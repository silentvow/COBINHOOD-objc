//
//  COBTradingPair.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBTradingPair : NSObject
@property (strong, nonatomic, readonly) NSString *identifier;
@property (strong, nonatomic, readonly) NSString *baseCurrencyId;
@property (strong, nonatomic, readonly) NSString *quoteCurrencyId;
@property (strong, nonatomic, readonly) NSNumber *baseMinSize;
@property (strong, nonatomic, readonly) NSNumber *baseMaxSize;
@property (strong, nonatomic, readonly) NSNumber *quoteIncrement;

+ (COBTradingPair *)tradingPairFromJsonObject:(NSDictionary *)jsonObject;
@end
