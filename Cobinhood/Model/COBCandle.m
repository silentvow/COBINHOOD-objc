//
//  COBCandle.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBCandle.h"
#import "COBParamFormatter.h"

@interface COBCandle ()
@property (strong, nonatomic) NSNumber *timestamp;
@property (strong, nonatomic) NSNumber *open;
@property (strong, nonatomic) NSNumber *close;
@property (strong, nonatomic) NSNumber *high;
@property (strong, nonatomic) NSNumber *low;
@property (strong, nonatomic) NSNumber *volume;
@end

@implementation COBCandle

+ (COBCandle *)candleFromJsonObject:(NSDictionary *)jsonObject
{
    COBCandle *candle = [COBCandle new];
    candle.timestamp = jsonObject[@"timestamp"];
    candle.open = [COBParamFormatter numberFromString:jsonObject[@"open"]];
    candle.close = [COBParamFormatter numberFromString:jsonObject[@"close"]];
    candle.high = [COBParamFormatter numberFromString:jsonObject[@"high"]];
    candle.low = [COBParamFormatter numberFromString:jsonObject[@"low"]];
    candle.volume = [COBParamFormatter numberFromString:jsonObject[@"volume"]];

    return candle;
}

@end
