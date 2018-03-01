//
//  COBOrder.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBOrder.h"
#import "COBParamFormatter.h"


@interface COBOrder ()
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
@end

@implementation COBOrder

+ (COBOrder *)orderFromJsonObject:(NSDictionary *)jsonObject
{
    COBOrder *order = [COBOrder new];
    order.identifier = jsonObject[@"id"];
    order.tradingPair = jsonObject[@"trading_pair"];
    order.state = [COBParamFormatter orderStateForString:jsonObject[@"state"]];
    order.side = [COBParamFormatter orderSideForString:jsonObject[@"side"]];
    order.type = [COBParamFormatter orderTypeForString:jsonObject[@"type"]];
    order.price = [COBParamFormatter numberFromString:jsonObject[@"price"]];
    order.size = [COBParamFormatter numberFromString:jsonObject[@"size"]];
    order.timestamp = jsonObject[@"timestamp"];
    order.filled = [COBParamFormatter numberFromString:jsonObject[@"filled"]];
    order.eqPrice = [COBParamFormatter numberFromString:jsonObject[@"eq_price"]];
    order.completeAt = jsonObject[@"completed_at"];

    return order;
}

@end
