//
//  COBTrade.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBTrade.h"
#import "COBParamFormatter.h"


@interface COBTrade ()
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSNumber *size;
@property (strong, nonatomic) NSString *makerSide;
@property (strong, nonatomic) NSNumber *timestamp;
@end

@implementation COBTrade

+ (COBTrade *)tradeFromJsonObject:(NSDictionary *)jsonObject
{
    COBTrade *trade = [COBTrade new];
    trade.identifier = jsonObject[@"id"];
    trade.price = [COBParamFormatter numberFromString:jsonObject[@"price"]];
    trade.size = [COBParamFormatter numberFromString:jsonObject[@"size"]];
    trade.makerSide = jsonObject[@"maker_side"];
    trade.timestamp = jsonObject[@"timestamp"];
    return trade;
}

@end
