//
//  COBWalletBalance.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBWalletBalance.h"
#import "COBParamFormatter.h"


@interface COBWalletBalance ()
@property (strong, nonatomic) NSString *currency;
@property (nonatomic) kCOBWalletBalanceType type;
@property (strong, nonatomic) NSNumber *total;
@property (strong, nonatomic) NSNumber *onOrder;
@property (nonatomic) BOOL locked;
@end

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
