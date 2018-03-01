//
//  COBDeposit.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBDeposit.h"
#import "COBParamFormatter.h"


@implementation COBDeposit

+ (COBDeposit *)depositFromJsonObject:(NSDictionary *)jsonObject
{
    COBDeposit *deposit = [COBDeposit new];
    deposit.depositId = jsonObject[@"deposit_id"];
    deposit.userId = jsonObject[@"user_id"];
    deposit.status = jsonObject[@"status"];
    deposit.confirmations = jsonObject[@"confirmations"];
    deposit.requiredConfirmations = jsonObject[@"required_confirmations"];
    deposit.createdAt = jsonObject[@"created_at"];
    deposit.completedAt = jsonObject[@"completed_at"];
    deposit.fromAddress = jsonObject[@"from_address"];
    deposit.txhash = jsonObject[@"txhash"];
    deposit.currency = jsonObject[@"currency"];
    deposit.amount = [COBParamFormatter numberFromString:jsonObject[@"amount"]];
    deposit.fee = [COBParamFormatter numberFromString:jsonObject[@"fee"]];
    return deposit;
}

@end
