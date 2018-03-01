//
//  COBClient.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBClient.h"
#import "COBParamFormatter.h"
#import "NSError+Cobinhood.h"
#import "JSONKit.h"
#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSInteger, kHttpMethod) {
    kHttpMethodGET,
    kHttpMethodPOST,
    kHttpMethodHEAD,
    kHttpMethodPUT,
    kHttpMethodPATCH,
    kHttpMethodDELETE,
};


@interface COBClient ()
@property (strong, nonatomic) NSString *authToken;
@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;
@end


@implementation COBClient

- (instancetype)init
{
    return [self initWithOptions:[COBClientOptions defaultOptions]];
}

- (instancetype)initWithOptions:(COBClientOptions *)options
{
    if (self = [super init]) {
        self.authToken = options.authToken;
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kApiURL]];
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.sessionManager.requestSerializer setValue:self.authToken forHTTPHeaderField:@"authorization"];
        [self.sessionManager.requestSerializer setValue:kOriginURL forHTTPHeaderField:@"Origin"];
    }
    return self;
}

#pragma mark - market

- (void)getAllCurrencies:(void (^)(NSArray<COBCurrency *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/market/currencies"];

    [self sendRequest:kHttpMethodGET path:path parameters:nil success:^(NSDictionary *result) {
        NSArray *currencies = result[@"currencies"];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *currency in currencies) {
            [array addObject:[COBCurrency currencyFromJsonObject:currency]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

- (void)getAllTradingPairs:(void (^)(NSArray<COBTradingPair *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/market/trading_pairs"];

    [self sendRequest:kHttpMethodGET path:path parameters:nil success:^(NSDictionary *result) {
        NSArray *tradingPairs = result[@"trading_pairs"];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *tradingPair in tradingPairs) {
            [array addObject:[COBTradingPair tradingPairFromJsonObject:tradingPair]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

- (void)getTradingStats:(void (^)(NSDictionary<NSString *, COBTradingStat *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/market/stats"];

    [self sendRequest:kHttpMethodGET path:path parameters:nil success:^(NSDictionary *result) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        for (NSString *key in result) {
            dict[key] = [COBTradingStat tradingStatFromJsonObject:result[key]];
        }
        safe_block(success, dict);
    } failure:failure];
}

- (void)getOrderBookForTradingPair:(COBTradingPair *)tradingPair limit:(NSUInteger)limit success:(void (^)(COBOrderBook *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/market/orderbooks/%@", tradingPair.identifier];
    NSDictionary *parameters = @{ @"limit" : @(limit) };

    [self sendRequest:kHttpMethodGET path:path parameters:parameters success:^(NSDictionary *result) {
        COBOrderBook *orderBook = [COBOrderBook orderBookFromJsonObject:result[@"orderbook"]];
        safe_block(success, orderBook);
    } failure:failure];
}

- (void)getTickerForTradingPair:(COBTradingPair *)tradingPair success:(void (^)(COBTicker *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/market/tickers/%@", tradingPair.identifier];

    [self sendRequest:kHttpMethodGET path:path parameters:nil success:^(NSDictionary *result) {
        COBTicker *ticker = [COBTicker tickerFromJsonObject:result[@"ticker"]];
        safe_block(success, ticker);
    } failure:failure];
}

- (void)getRecentTradesForTradingPair:(COBTradingPair *)tradingPair limit:(NSUInteger)limit success:(void (^)(NSArray<COBTrade *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/market/trades/%@", tradingPair.identifier];
    NSDictionary *parameters = @{ @"limit" : @(limit) };

    [self sendRequest:kHttpMethodGET path:path parameters:parameters success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *trade in result[@"trades"]) {
            [array addObject:[COBTrade tradeFromJsonObject:trade]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

#pragma mark - chart

- (void)getCandlesForTradingPair:(COBTradingPair *)tradingPair timeframe:(kCOBCandleTimeframe)timeframe startTime:(NSDate *)startTime endTime:(NSDate *)endTime success:(void (^)(NSArray<COBCandle *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/chart/candles/%@", tradingPair.identifier];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithObject:[COBParamFormatter stringForCandleTimeframe:timeframe] forKey:@"timeframe"];
    [parameters setValue:[self timestampFromDate:startTime] forKey:@"start_time"];
    [parameters setValue:[self timestampFromDate:endTime] forKey:@"end_time"];

    [self sendRequest:kHttpMethodGET path:path parameters:parameters success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *candle in result[@"candles"]) {
            [array addObject:[COBCandle candleFromJsonObject:candle]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

#pragma mark - trading

- (void)getOrderForOrderId:(NSString *)orderId success:(void (^)(COBOrder *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/trading/orders/%@", orderId];

    [self sendRequest:kHttpMethodGET path:path parameters:nil success:^(NSDictionary *result) {
        safe_block(success, [COBOrder orderFromJsonObject:result[@"order"]]);
    } failure:failure];
}

- (void)getTradesForOrderId:(NSString *)orderId success:(void (^)(NSArray<COBTrade *> *_Nonnull))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/trading/orders/%@/trades", orderId];

    [self sendRequest:kHttpMethodGET path:path parameters:nil success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *trade in result[@"trades"]) {
            [array addObject:[COBTrade tradeFromJsonObject:trade]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

- (void)getAllOrdersForTradingPairId:(NSString *)tradingPairId success:(void (^)(NSArray<COBOrder *> *_Nonnull))success failure:(COBClientFailureBlock)failure
{
    NSString *path = @"/v1/trading/orders";
    NSDictionary *parameters = tradingPairId ? @{ @"trading_pair_id" : tradingPairId } : nil;

    [self sendRequest:kHttpMethodGET path:path parameters:parameters success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *order in result[@"orders"]) {
            [array addObject:[COBOrder orderFromJsonObject:order]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

- (void)placeOrderWithTradingPairId:(NSString *)tradingPairId side:(kCOBOrderSide)side type:(kCOBOrderType)type price:(NSNumber *)price size:(NSNumber *)size success:(void (^)(COBOrder *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = @"/v1/trading/orders";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:tradingPairId forKey:@"trading_pair_id"];
    [parameters setValue:[COBParamFormatter stringForOrderSide:side] forKey:@"side"];
    [parameters setValue:[COBParamFormatter stringForOrderType:type] forKey:@"type"];
    [parameters setValue:[COBParamFormatter stringFromNumber:price] forKey:@"price"];
    [parameters setValue:[COBParamFormatter stringFromNumber:size] forKey:@"size"];

    [self sendRequest:kHttpMethodPOST path:path parameters:parameters success:^(NSDictionary *result) {
        safe_block(success, [COBOrder orderFromJsonObject:result[@"order"]]);
    } failure:failure];
}

- (void)modifyOrderWithOrderId:(NSString *)orderId price:(NSNumber *)price size:(NSNumber *)size success:(COBClientSimpleBlock)success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/trading/orders/%@", orderId];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:[COBParamFormatter stringFromNumber:price] forKey:@"price"];
    [parameters setValue:[COBParamFormatter stringFromNumber:size] forKey:@"size"];

    [self sendRequest:kHttpMethodPUT path:path parameters:parameters success:^(NSDictionary *result) {
        safe_block(success);
    } failure:failure];
}

- (void)cancelOrderWithOrderId:(NSString *)orderId success:(COBClientSimpleBlock)success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/trading/orders/%@", orderId];

    [self sendRequest:kHttpMethodDELETE path:path parameters:nil success:^(NSDictionary *result) {
        safe_block(success);
    } failure:failure];
}

- (void)getOrderHistoryForTradingPairId:(NSString *)tradingPairId success:(void (^)(NSArray<COBOrder *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = @"/v1/trading/order_history";
    NSDictionary *parameters = tradingPairId ? @{ @"trading_pair_id" : tradingPairId } : nil;

    [self sendRequest:kHttpMethodGET path:path parameters:parameters success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *order in result[@"order_history"]) {
            [array addObject:[COBOrder orderFromJsonObject:order]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

- (void)getTradeForTradeId:(NSString *)tradeId success:(void (^)(COBTrade *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/trading/trades/%@", tradeId];

    [self sendRequest:kHttpMethodGET path:path parameters:nil success:^(NSDictionary *result) {
        safe_block(success, [COBTrade tradeFromJsonObject:result[@"trade"]]);
    } failure:failure];
}

- (void)getTradeHistoryForTradingPairId:(NSString *)tradingPairId success:(void (^)(NSArray<COBTrade *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = @"/v1/trading/trades";
    NSDictionary *parameters = tradingPairId ? @{ @"trading_pair_id" : tradingPairId } : nil;

    [self sendRequest:kHttpMethodGET path:path parameters:parameters success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *trade in result[@"trades"]) {
            [array addObject:[COBTrade tradeFromJsonObject:trade]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

#pragma mark - wallet

- (void)getWalletBalances:(void (^)(NSArray<COBWalletBalance *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = @"/v1/wallet/balances";

    [self sendRequest:kHttpMethodGET path:path parameters:nil success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *balance in result[@"balances"]) {
            [array addObject:[COBWalletBalance walletBalanceFromJsonObject:balance]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

- (void)getLedgerEntriesForCurrencyId:(NSString *)currencyId success:(void (^)(NSArray<COBLedgerEntry *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = @"/v1/wallet/ledger";
    NSDictionary *parameters = currencyId ? @{ @"currency" : currencyId } : nil;

    [self sendRequest:kHttpMethodGET path:path parameters:parameters success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *entry in result[@"ledger"]) {
            [array addObject:[COBLedgerEntry ledgerEntryFromJsonObject:entry]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

- (void)getDepositAddressesForCurrencyId:(NSString *)currencyId success:(void (^)(NSArray<COBWalletAddress *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = @"/v1/wallet/deposit_addresses";
    NSDictionary *parameters = currencyId ? @{ @"currency" : currencyId } : nil;

    [self sendRequest:kHttpMethodGET path:path parameters:parameters success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *address in result[@"deposit_addresses"]) {
            [array addObject:[COBWalletAddress walletAddressFromJsonObject:address]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

- (void)getWithdrawalAddressesForCurrencyId:(NSString *)currencyId success:(void (^)(NSArray<COBWalletAddress *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = @"/v1/wallet/withdrawal_addresses";
    NSDictionary *parameters = currencyId ? @{ @"currency" : currencyId } : nil;

    [self sendRequest:kHttpMethodGET path:path parameters:parameters success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *address in result[@"withdrawal_addresses"]) {
            [array addObject:[COBWalletAddress walletAddressFromJsonObject:address]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

- (void)getWithdrawalForWithdrawalId:(NSString *)withdrawalId success:(void (^)(COBWithdrawal *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/wallet/withdrawals/%@", withdrawalId];

    [self sendRequest:kHttpMethodGET path:path parameters:nil success:^(NSDictionary *result) {
        safe_block(success, [COBWithdrawal withdrawalFromJsonObject:result[@"withdrawal"]]);
    } failure:failure];
}

- (void)getAllWithdrawalsForCurrencyId:(NSString *)currencyId status:(kCOBWithdrawalStatus)status success:(void (^)(NSArray<COBWithdrawal *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = @"/v1/wallet/withdrawals";
    NSDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:currencyId forKey:@"currency"];
    [parameters setValue:[COBParamFormatter stringForWithdrawalStatus:status] forKey:@"status"];

    [self sendRequest:kHttpMethodGET path:path parameters:parameters success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *withdrawal in result[@"withdrawals"]) {
            [array addObject:[COBWithdrawal withdrawalFromJsonObject:withdrawal]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

- (void)getDepositForDepositId:(NSString *)depositId success:(void (^)(COBDeposit *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = [NSString stringWithFormat:@"/v1/wallet/deposits/%@", depositId];

    [self sendRequest:kHttpMethodGET path:path parameters:nil success:^(NSDictionary *result) {
        safe_block(success, [COBDeposit depositFromJsonObject:result[@"deposit"]]);
    } failure:failure];
}

- (void)getAllDeposits:(void (^)(NSArray<COBDeposit *> *))success failure:(COBClientFailureBlock)failure
{
    NSString *path = @"/v1/wallet/deposits";

    [self sendRequest:kHttpMethodGET path:path parameters:nil success:^(NSDictionary *result) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *deposit in result[@"deposits"]) {
            [array addObject:[COBDeposit depositFromJsonObject:deposit]];
        }
        safe_block(success, [NSArray arrayWithArray:array]);
    } failure:failure];
}

#pragma mark - request

- (void)sendRequest:(kHttpMethod)method path:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *result))success failure:(COBClientFailureBlock)failure
{
    void (^successBlock)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject: %@", responseObject);

        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            safe_block(failure, [NSError COBUnknownError]);
        }

        id result = responseObject[@"result"];
        if (![result isKindOfClass:[NSDictionary class]]) {
            safe_block(failure, [NSError COBUnknownError]);
        }

        safe_block(success, result);
    };
    void (^failureBlock)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error) {
        NSData *responseData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        id obj = [responseData objectFromJSONData];
        NSLog(@"responseError: %@", obj);

        if ([obj isKindOfClass:[NSDictionary class]] && obj[@"error"]) {
            safe_block(failure, [NSError COBErrorWithCode:obj[@"error"][@"error_code"]]);
        } else {
            safe_block(failure, error);
        }
    };
    NSString *nonce = [NSString stringWithFormat:@"%.0lf", [[NSDate date] timeIntervalSince1970]];

    switch (method) {
        case kHttpMethodGET:
            [self.sessionManager GET:path parameters:parameters progress:nil success:successBlock failure:failureBlock];
            break;
        case kHttpMethodPOST:
            [self.sessionManager.requestSerializer setValue:nonce forHTTPHeaderField:@"nonce"];
            [self.sessionManager POST:path parameters:parameters progress:nil success:successBlock failure:failureBlock];
            break;
        case kHttpMethodHEAD: {
            [self.sessionManager HEAD:path parameters:parameters success:^(NSURLSessionDataTask *_Nonnull task) {
                success(nil);
            } failure:failureBlock];
            break;
        }
        case kHttpMethodPUT:
            [self.sessionManager.requestSerializer setValue:nonce forHTTPHeaderField:@"nonce"];
            [self.sessionManager PUT:path parameters:parameters success:successBlock failure:failureBlock];
            break;
        case kHttpMethodPATCH:
            [self.sessionManager PATCH:path parameters:parameters success:successBlock failure:failureBlock];
            break;
        case kHttpMethodDELETE:
            [self.sessionManager.requestSerializer setValue:nonce forHTTPHeaderField:@"nonce"];
            [self.sessionManager DELETE:path parameters:parameters success:successBlock failure:failureBlock];
            break;
        default:
            break;
    }
}

#pragma mark - utility

- (NSNumber *)timestampFromDate:(NSDate *)date
{
    if (!date) {
        return nil;
    }
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return @(round(timeInterval * 1000));
}

@end
