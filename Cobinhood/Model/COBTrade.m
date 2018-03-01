//
//  COBTrade.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBTrade.h"
#import "COBParamFormatter.h"


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
