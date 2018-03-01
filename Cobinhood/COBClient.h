//
//  COBClient.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COBClientOptions.h"
#import "COBTradingPair.h"
#import "COBTradingStat.h"
#import "COBCurrency.h"
#import "COBOrderBook.h"
#import "COBTicker.h"
#import "COBTrade.h"
#import "COBCandle.h"
#import "COBOrder.h"
#import "COBWalletBalance.h"
#import "COBLedgerEntry.h"
#import "COBWalletAddress.h"
#import "COBDeposit.h"
#import "COBWithdrawal.h"

typedef void (^COBClientSimpleBlock)(void);
typedef void (^COBClientFailureBlock)(NSError *error);


@interface COBClient : NSObject

- (instancetype)init;
- (instancetype)initWithOptions:(COBClientOptions *)options;

#pragma mark - market

- (void)getAllCurrencies:(void (^)(NSArray<COBCurrency *> *currencies))success
                 failure:(COBClientFailureBlock)failure;
- (void)getAllTradingPairs:(void (^)(NSArray<COBTradingPair *> *tradingPairs))success
                   failure:(COBClientFailureBlock)failure;
- (void)getTradingStats:(void (^)(NSDictionary<NSString *, COBTradingStat *> *tradingStats))success
                failure:(COBClientFailureBlock)failure;
- (void)getOrderBookForTradingPair:(COBTradingPair *)tradingPair
                             limit:(NSUInteger)limit
                           success:(void (^)(COBOrderBook *orderBook))success
                           failure:(COBClientFailureBlock)failure;
- (void)getTickerForTradingPair:(COBTradingPair *)tradingPair
                        success:(void (^)(COBTicker *orderBook))success
                        failure:(COBClientFailureBlock)failure;
- (void)getRecentTradesForTradingPair:(COBTradingPair *)tradingPair
                                limit:(NSUInteger)limit
                              success:(void (^)(NSArray<COBTrade *> *trades))success
                              failure:(COBClientFailureBlock)failure;

#pragma mark - chart

- (void)getCandlesForTradingPair:(COBTradingPair *)tradingPair
                       timeframe:(kCOBCandleTimeframe)timeframe
                       startTime:(NSDate *)startTime
                         endTime:(NSDate *)endTime
                         success:(void (^)(NSArray<COBCandle *> *candles))success
                         failure:(COBClientFailureBlock)failure;

#pragma mark - trading

- (void)getOrderForOrderId:(NSString *)orderId
                   success:(void (^)(COBOrder *order))success
                   failure:(COBClientFailureBlock)failure;
- (void)getTradesForOrderId:(NSString *)orderId
                    success:(void (^)(NSArray<COBTrade *> *trades))success
                    failure:(COBClientFailureBlock)failure;
- (void)getAllOrdersForTradingPairId:(NSString *)tradingPairId
                             success:(void (^)(NSArray<COBOrder *> *orders))success
                             failure:(COBClientFailureBlock)failure;
- (void)placeOrderWithTradingPairId:(NSString *)tradingPairId
                               side:(kCOBOrderSide)side
                               type:(kCOBOrderType)type
                              price:(NSNumber *)price
                               size:(NSNumber *)size
                            success:(void (^)(COBOrder *order))success
                            failure:(COBClientFailureBlock)failure;
- (void)modifyOrderWithOrderId:(NSString *)orderId
                         price:(NSNumber *)price
                          size:(NSNumber *)size
                       success:(COBClientSimpleBlock)success
                       failure:(COBClientFailureBlock)failure;
- (void)cancelOrderWithOrderId:(NSString *)orderId
                       success:(COBClientSimpleBlock)success
                       failure:(COBClientFailureBlock)failure;
- (void)getOrderHistoryForTradingPairId:(NSString *)tradingPairId
                                success:(void (^)(NSArray<COBOrder *> *orders))success
                                failure:(COBClientFailureBlock)failure;
- (void)getTradeForTradeId:(NSString *)tradeId
                   success:(void (^)(COBTrade *trade))success
                   failure:(COBClientFailureBlock)failure;
- (void)getTradeHistoryForTradingPairId:(NSString *)tradingPairId
                                success:(void (^)(NSArray<COBTrade *> *trades))success
                                failure:(COBClientFailureBlock)failure;

#pragma mark - wallet

- (void)getWalletBalances:(void (^)(NSArray<COBWalletBalance *> *balances))success
                  failure:(COBClientFailureBlock)failure;
- (void)getLedgerEntriesForCurrencyId:(NSString *)currencyId
                              success:(void (^)(NSArray<COBLedgerEntry *> *entries))success
                              failure:(COBClientFailureBlock)failure;
- (void)getDepositAddressesForCurrencyId:(NSString *)currencyId
                                 success:(void (^)(NSArray<COBWalletAddress *> *addresses))success
                                 failure:(COBClientFailureBlock)failure;
- (void)getWithdrawalAddressesForCurrencyId:(NSString *)currencyId
                                    success:(void (^)(NSArray<COBWalletAddress *> *addresses))success
                                    failure:(COBClientFailureBlock)failure;
- (void)getWithdrawalForWithdrawalId:(NSString *)withdrawalId
                             success:(void (^)(COBWithdrawal *withdrawal))success
                             failure:(COBClientFailureBlock)failure;
- (void)getAllWithdrawalsForCurrencyId:(NSString *)currenctId
                                status:(kCOBWithdrawalStatus)status
                               success:(void (^)(NSArray<COBWithdrawal *> *withdrawals))success
                               failure:(COBClientFailureBlock)failure;
- (void)getDepositForDepositId:(NSString *)depositId
                       success:(void (^)(COBDeposit *deposit))success
                       failure:(COBClientFailureBlock)failure;
- (void)getAllDeposits:(void (^)(NSArray<COBDeposit *> *deposits))success
               failure:(COBClientFailureBlock)failure;

@end
