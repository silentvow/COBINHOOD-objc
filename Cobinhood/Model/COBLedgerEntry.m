//
//  COBLedgerEntry.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBLedgerEntry.h"
#import "COBParamFormatter.h"


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
