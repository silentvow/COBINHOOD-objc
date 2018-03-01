//
//  COBTicker.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBTicker : NSObject
@property (strong, nonatomic) NSString *tradingPairId;
@property (strong, nonatomic) NSNumber *timestamp;
@property (strong, nonatomic) NSNumber *high24h;
@property (strong, nonatomic) NSNumber *low24h;
@property (strong, nonatomic) NSNumber *open24h;
@property (strong, nonatomic) NSNumber *volume24h;
@property (strong, nonatomic) NSNumber *lastTradePrice;
@property (strong, nonatomic) NSNumber *highestBid;
@property (strong, nonatomic) NSNumber *lowestAsk;

+ (COBTicker *)tickerFromJsonObject:(NSDictionary *)jsonObject;
@end
