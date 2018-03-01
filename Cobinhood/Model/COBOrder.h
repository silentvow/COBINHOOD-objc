//
//  COBOrder.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COBConstants.h"


@interface COBOrder : NSObject
@property (strong, nonatomic, readonly) NSString *identifier;
@property (strong, nonatomic, readonly) NSString *tradingPair;
@property (nonatomic, readonly) kCOBOrderState state;
@property (nonatomic, readonly) kCOBOrderSide side;
@property (nonatomic, readonly) kCOBOrderType type;
@property (strong, nonatomic, readonly) NSNumber *price;
@property (strong, nonatomic, readonly) NSNumber *size;
@property (strong, nonatomic, readonly) NSNumber *filled;
@property (strong, nonatomic, readonly) NSNumber *timestamp;
@property (strong, nonatomic, readonly) NSNumber *eqPrice;
@property (strong, nonatomic, readonly) NSString *completeAt;

+ (COBOrder *)orderFromJsonObject:(NSDictionary *)jsonObject;
@end
