//
//  COBWalletBalance.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBWalletBalance.h"
#import "COBParamFormatter.h"


@implementation COBWalletBalance

+ (COBWalletBalance *)walletBalanceFromJsonObject:(NSDictionary *)jsonObject
{
    COBWalletBalance *balance = [COBWalletBalance new];
    balance.currency = jsonObject[@"currency"];
    balance.type = [COBParamFormatter walletBalanceTypeForString:jsonObject[@"type"]];
    balance.total = [COBParamFormatter numberFromString:jsonObject[@"total"]];
    balance.onOrder = [COBParamFormatter numberFromString:jsonObject[@"on_order"]];
    balance.locked = [jsonObject[@"locked"] boolValue];
    return balance;
}

@end
