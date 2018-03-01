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
@property (nonatomic, readonly) kCOBLedgerType type;
@property (strong, nonatomic, readonly) NSString *currency;
@property (strong, nonatomic, readonly) NSNumber *amount;
@property (strong, nonatomic, readonly) NSNumber *balance;
@property (strong, nonatomic, readonly) NSNumber *timestamp;
@property (strong, nonatomic, readonly) NSString *tradeId;
@property (strong, nonatomic, readonly) NSString *depositId;
@property (strong, nonatomic, readonly) NSString *withdrawalId;
@property (nonatomic, readonly) kCOBLedgerAction action;
@property (strong, nonatomic, readonly) NSString *fiatDepositId;
@property (strong, nonatomic, readonly) NSString *fiatWithdrawalId;

+ (COBLedgerEntry *)ledgerEntryFromJsonObject:(NSDictionary *)jsonObject;
@end
