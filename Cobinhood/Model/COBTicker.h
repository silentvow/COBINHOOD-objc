//
//  COBTicker.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBTicker : NSObject
@property (strong, nonatomic, readonly) NSString *tradingPairId;
@property (strong, nonatomic, readonly) NSNumber *timestamp;
@property (strong, nonatomic, readonly) NSNumber *high24h;
@property (strong, nonatomic, readonly) NSNumber *low24h;
@property (strong, nonatomic, readonly) NSNumber *open24h;
@property (strong, nonatomic, readonly) NSNumber *volume24h;
@property (strong, nonatomic, readonly) NSNumber *lastTradePrice;
@property (strong, nonatomic, readonly) NSNumber *highestBid;
@property (strong, nonatomic, readonly) NSNumber *lowestAsk;

+ (COBTicker *)tickerFromJsonObject:(NSDictionary *)jsonObject;
@end
