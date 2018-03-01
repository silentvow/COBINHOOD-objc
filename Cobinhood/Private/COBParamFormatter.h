//
//  COBParamFormatter.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/23.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COBConstants.h"


@interface COBParamFormatter : NSObject
+ (kCOBOrderState)orderStateForString:(NSString *)string;
+ (kCOBOrderSide)orderSideForString:(NSString *)string;
+ (kCOBOrderType)orderTypeForString:(NSString *)string;
+ (kCOBWalletBalanceType)walletBalanceTypeForString:(NSString *)string;
+ (kCOBLedgerType)ledgerTypeForString:(NSString *)string;
+ (kCOBLedgerAction)ledgerActionForString:(NSString *)string;
+ (kCOBWithdrawalStatus)withdrawalStatusForString:(NSString *)string;

+ (NSString *)stringForOrderSide:(kCOBOrderSide)side;
+ (NSString *)stringForOrderType:(kCOBOrderType)type;
+ (NSString *)stringForWithdrawalStatus:(kCOBWithdrawalStatus)status;
+ (NSString *)stringForCandleTimeframe:(kCOBCandleTimeframe)timeframe;
+ (NSNumber *)numberFromString:(NSString *)string;
+ (NSString *)stringFromNumber:(NSNumber *)number;
@end
