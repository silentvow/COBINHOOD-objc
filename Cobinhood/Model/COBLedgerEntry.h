//
//  COBLedgerEntry.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COBConstants.h"


@interface COBLedgerEntry : NSObject
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

+ (COBLedgerEntry *)ledgerEntryFromJsonObject:(NSDictionary *)jsonObject;
@end
