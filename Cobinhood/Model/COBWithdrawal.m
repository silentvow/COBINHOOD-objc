//
//  COBWithdrawal.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBWithdrawal.h"
#import "COBParamFormatter.h"


@interface COBWithdrawal ()
@property (strong, nonatomic) NSString *withdrawalId;
@property (strong, nonatomic) NSString *userId;
@property (nonatomic) kCOBWithdrawalStatus status;
@property (strong, nonatomic) NSNumber *confirmations;
@property (strong, nonatomic) NSNumber *requiredConfirmations;
@property (strong, nonatomic) NSNumber *createdAt;
@property (strong, nonatomic) NSNumber *sentAt;
@property (strong, nonatomic) NSNumber *completedAt;
@property (strong, nonatomic) NSNumber *updatedAt;
@property (strong, nonatomic) NSString *toAddress;
@property (strong, nonatomic) NSString *txhash;
@property (strong, nonatomic) NSString *currency;
@property (strong, nonatomic) NSNumber *amount;
@property (strong, nonatomic) NSNumber *fee;
@end

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
