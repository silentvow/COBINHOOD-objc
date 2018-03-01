//
//  COBTradingPair.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBTradingPair.h"
#import "COBParamFormatter.h"


@interface COBTradingPair ()
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *baseCurrencyId;
@property (strong, nonatomic) NSString *quoteCurrencyId;
@property (strong, nonatomic) NSNumber *baseMinSize;
@property (strong, nonatomic) NSNumber *baseMaxSize;
@property (strong, nonatomic) NSNumber *quoteIncrement;
@end


@implementation COBTradingPair

+ (COBTradingPair *)tradingPairFromJsonObject:(NSDictionary *)jsonObject
{
    COBTradingPair *tradingPair = [COBTradingPair new];
    tradingPair.identifier = jsonObject[@"id"];
    tradingPair.baseCurrencyId = jsonObject[@"base_currency_id"];
    tradingPair.quoteCurrencyId = jsonObject[@"quote_currency_id"];
    tradingPair.baseMinSize = [COBParamFormatter numberFromString:jsonObject[@"base_min_size"]];
    tradingPair.baseMaxSize = [COBParamFormatter numberFromString:jsonObject[@"base_max_size"]];
    tradingPair.quoteIncrement = [COBParamFormatter numberFromString:jsonObject[@"quote_increment"]];

    return tradingPair;
}

@end
