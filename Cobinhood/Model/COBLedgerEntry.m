//
//  COBLedgerEntry.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBLedgerEntry.h"
#import "COBParamFormatter.h"


@interface COBLedgerEntry ()
@property (nonatomic) kCOBLedgerType type;
@property (strong, nonatomic) NSString *currency;
@property (strong, nonatomic) NSNumber *amount;
@property (strong, nonatomic) NSNumber *balance;
@property (strong, nonatomic) NSNumber *timestamp;
@property (strong, nonatomic) NSString *tradeId;
@property (strong, nonatomic) NSString *depositId;
@property (strong, nonatomic) NSString *withdrawalId;
@property (nonatomic) kCOBLedgerAction action;
@property (strong, nonatomic) NSString *fiatDepositId;
@property (strong, nonatomic) NSString *fiatWithdrawalId;
@end

@implementation COBLedgerEntry

+ (COBLedgerEntry *)ledgerEntryFromJsonObject:(NSDictionary *)jsonObject
{
    COBLedgerEntry *entry = [COBLedgerEntry new];
    entry.type = [COBParamFormatter ledgerTypeForString:jsonObject[@"type"]];
    entry.currency = jsonObject[@"currency"];
    entry.amount = [COBParamFormatter numberFromString:jsonObject[@"amount"]];
    entry.balance = [COBParamFormatter numberFromString:jsonObject[@"balance"]];
    entry.timestamp = jsonObject[@"timestamp"];
    entry.tradeId = jsonObject[@"trade_id"];
    entry.depositId = jsonObject[@"deposit_id"];
    entry.withdrawalId = jsonObject[@"withdrawal_id"];
    entry.action = [COBParamFormatter ledgerActionForString:jsonObject[@"action"]];
    entry.fiatDepositId = jsonObject[@"fiat_deposit_id"];
    entry.fiatWithdrawalId = jsonObject[@"fiat_withdrawal_id"];
    return entry;
}

@end
