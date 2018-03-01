//
//  COBCurrency.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBCurrency.h"
#import "COBParamFormatter.h"


@interface COBCurrency ()
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *minUnit;
@property (strong, nonatomic) NSNumber *depositFee;
@property (strong, nonatomic) NSNumber *withdrawalFee;
@end


@implementation COBCurrency

+ (COBCurrency *)currencyFromJsonObject:(NSDictionary *)jsonObject
{
    COBCurrency *currency = [COBCurrency new];
    currency.identifier = jsonObject[@"id"];
    currency.name = jsonObject[@"name"];
    currency.minUnit = [COBParamFormatter numberFromString:jsonObject[@"min_unit"]];
    currency.depositFee = [COBParamFormatter numberFromString:jsonObject[@"deposit_fee"]];
    currency.withdrawalFee = [COBParamFormatter numberFromString:jsonObject[@"withdrawal_fee"]];

    return currency;
}

@end
