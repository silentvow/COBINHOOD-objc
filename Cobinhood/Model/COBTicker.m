//
//  COBTicker.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBTicker.h"
#import "COBParamFormatter.h"


@interface COBTicker ()
@property (strong, nonatomic) NSString *tradingPairId;
@property (strong, nonatomic) NSNumber *timestamp;
@property (strong, nonatomic) NSNumber *high24h;
@property (strong, nonatomic) NSNumber *low24h;
@property (strong, nonatomic) NSNumber *open24h;
@property (strong, nonatomic) NSNumber *volume24h;
@property (strong, nonatomic) NSNumber *lastTradePrice;
@property (strong, nonatomic) NSNumber *highestBid;
@property (strong, nonatomic) NSNumber *lowestAsk;
@end

@implementation COBTicker

+ (COBTicker *)tickerFromJsonObject:(NSDictionary *)jsonObject
{
    COBTicker *ticker = [COBTicker new];
    ticker.tradingPairId = jsonObject[@"trading_pair_id"];
    ticker.timestamp = jsonObject[@"timestamp"];
    ticker.high24h = [COBParamFormatter numberFromString:jsonObject[@"24h_high"]];
    ticker.low24h = [COBParamFormatter numberFromString:jsonObject[@"24h_low"]];
    ticker.open24h = [COBParamFormatter numberFromString:jsonObject[@"24h_open"]];
    ticker.volume24h = [COBParamFormatter numberFromString:jsonObject[@"24h_volume"]];
    ticker.lastTradePrice = [COBParamFormatter numberFromString:jsonObject[@"last_trade_price"]];
    ticker.highestBid = [COBParamFormatter numberFromString:jsonObject[@"highest_bid"]];
    ticker.lowestAsk = [COBParamFormatter numberFromString:jsonObject[@"lowest_ask"]];
    return ticker;
}

@end
