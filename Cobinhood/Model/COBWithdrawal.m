//
//  COBWithdrawal.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBWithdrawal.h"
#import "COBParamFormatter.h"


@implementation COBWithdrawal

+ (COBWithdrawal *)withdrawalFromJsonObject:(NSDictionary *)jsonObject
{
    COBWithdrawal *withdrawal = [COBWithdrawal new];
    withdrawal.withdrawalId = jsonObject[@"withdrawal_id"];
    withdrawal.userId = jsonObject[@"user_id"];
    withdrawal.status = [COBParamFormatter withdrawalStatusForString:jsonObject[@"status"]];
    withdrawal.confirmations = jsonObject[@"confirmations"];
    withdrawal.requiredConfirmations = jsonObject[@"required_confirmations"];
    withdrawal.createdAt = jsonObject[@"created_at"];
    withdrawal.sentAt = jsonObject[@"sent_at"];
    withdrawal.completedAt = jsonObject[@"completed_at"];
    withdrawal.updatedAt = jsonObject[@"updated_at"];
    withdrawal.toAddress = jsonObject[@"to_address"];
    withdrawal.txhash = jsonObject[@"txhash"];
    withdrawal.currency = jsonObject[@"currency"];
    withdrawal.amount = [COBParamFormatter numberFromString:jsonObject[@"amount"]];
    withdrawal.fee = [COBParamFormatter numberFromString:jsonObject[@"fee"]];
    return withdrawal;
}

@end
