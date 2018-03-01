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
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *tradingPair;
@property (nonatomic) kCOBOrderState state;
@property (nonatomic) kCOBOrderSide side;
@property (nonatomic) kCOBOrderType type;
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSNumber *size;
@property (strong, nonatomic) NSNumber *filled;
@property (strong, nonatomic) NSNumber *timestamp;
@property (strong, nonatomic) NSNumber *eqPrice;
@property (strong, nonatomic) NSString *completeAt;

+ (COBOrder *)orderFromJsonObject:(NSDictionary *)jsonObject;
@end
