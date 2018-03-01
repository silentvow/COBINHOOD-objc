//
//  COBTradingStat.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBTradingStat : NSObject
@property (strong, nonatomic, readonly) NSString *identifier;
@property (strong, nonatomic, readonly) NSNumber *lastPrice;
@property (strong, nonatomic, readonly) NSNumber *lowestAsk;
@property (strong, nonatomic, readonly) NSNumber *highestBid;
@property (strong, nonatomic, readonly) NSNumber *baseVolume;
@property (strong, nonatomic, readonly) NSNumber *quoteVolume;
@property (nonatomic, readonly) BOOL isFrozen;
@property (strong, nonatomic, readonly) NSNumber *high24hr;
@property (strong, nonatomic, readonly) NSNumber *low24hr;
@property (strong, nonatomic, readonly) NSNumber *percentChanged24hr;

+ (COBTradingStat *)tradingStatFromJsonObject:(NSDictionary *)jsonObject;
@end
