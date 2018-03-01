//
//  COBTradingStat.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBTradingStat.h"
#import "COBParamFormatter.h"


@interface COBTradingStat ()
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSNumber *lastPrice;
@property (strong, nonatomic) NSNumber *lowestAsk;
@property (strong, nonatomic) NSNumber *highestBid;
@property (strong, nonatomic) NSNumber *baseVolume;
@property (strong, nonatomic) NSNumber *quoteVolume;
@property (nonatomic) BOOL isFrozen;
@property (strong, nonatomic) NSNumber *high24hr;
@property (strong, nonatomic) NSNumber *low24hr;
@property (strong, nonatomic) NSNumber *percentChanged24hr;
@end


@implementation COBTradingStat

+ (COBTradingStat *)tradingStatFromJsonObject:(NSDictionary *)jsonObject
{
    COBTradingStat *stat = [COBTradingStat new];
    stat.identifier = jsonObject[@"id"];
    stat.lastPrice = [COBParamFormatter numberFromString:jsonObject[@"last_price"]];
    stat.lowestAsk = [COBParamFormatter numberFromString:jsonObject[@"lowest_ask"]];
    stat.highestBid = [COBParamFormatter numberFromString:jsonObject[@"highest_bid"]];
    stat.baseVolume = [COBParamFormatter numberFromString:jsonObject[@"base_volume"]];
    stat.quoteVolume = [COBParamFormatter numberFromString:jsonObject[@"quote_volume"]];
    stat.isFrozen = [jsonObject[@"is_frozen"] boolValue];
    stat.high24hr = [COBParamFormatter numberFromString:jsonObject[@"high_24hr"]];
    stat.low24hr = [COBParamFormatter numberFromString:jsonObject[@"low_24hr"]];
    stat.percentChanged24hr = [COBParamFormatter numberFromString:jsonObject[@"percent_changed_24hr"]];

    return stat;
}

@end
