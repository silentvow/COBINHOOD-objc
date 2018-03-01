//
//  COBParamFormatter.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/23.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBParamFormatter.h"


@interface COBParamFormatter ()
@property (strong, nonatomic) NSNumberFormatter *formatter;
@end


@implementation COBParamFormatter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _formatter = [[NSNumberFormatter alloc] init];
        _formatter.numberStyle = NSNumberFormatterDecimalStyle;
    }
    return self;
}

+ (COBParamFormatter *)sharedInstance
{
    static COBParamFormatter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (kCOBOrderState)orderStateForString:(NSString *)string
{
    kCOBOrderState state = kCOBOrderStateUnknown;
    if ([string isEqualToString:@"new"]) {
        state = kCOBOrderStateNew;
    } else if ([string isEqualToString:@"queued"]) {
        state = kCOBOrderStateQueued;
    } else if ([string isEqualToString:@"open"]) {
        state = kCOBOrderStateOpen;
    } else if ([string isEqualToString:@"partially_filled"]) {
        state = kCOBOrderStatePartiallyFilled;
    } else if ([string isEqualToString:@"filled"]) {
        state = kCOBOrderStateFilled;
    } else if ([string isEqualToString:@"cancelled"]) {
        state = kCOBOrderStateCancelled;
    }
    return state;
}

+ (kCOBOrderSide)orderSideForString:(NSString *)string
{
    kCOBOrderSide side = kCOBOrderSideUnknown;
    if ([string isEqualToString:@"bid"]) {
        side = kCOBOrderSideBid;
    } else if ([string isEqualToString:@"ask"]) {
        side = kCOBOrderSideAsk;
    }
    return side;
}

+ (kCOBOrderType)orderTypeForString:(NSString *)string
{
    kCOBOrderType type = kCOBOrderTypeUnknown;
    if ([string isEqualToString:@"market"]) {
        type = kCOBOrderTypeMarket;
    } else if ([string isEqualToString:@"limit"]) {
        type = kCOBOrderTypeLimit;
    } else if ([string isEqualToString:@"stop"]) {
        type = kCOBOrderTypeStop;
    } else if ([string isEqualToString:@"stop_limit"]) {
        type = kCOBOrderTypeStopLimit;
    } else if ([string isEqualToString:@"trailing_stop"]) {
        type = kCOBOrderTypeTrailingStop;
    } else if ([string isEqualToString:@"fill_or_kill"]) {
        type = kCOBOrderTypeFillOrKill;
    }
    return type;
}

+ (kCOBWalletBalanceType)walletBalanceTypeForString:(NSString *)string
{
    kCOBWalletBalanceType type = kCOBWalletBalanceTypeUnknown;
    if ([string isEqualToString:@"exchange"]) {
        type = kCOBWalletBalanceTypeExchange;
    }
    return type;
}

+ (kCOBLedgerType)ledgerTypeForString:(NSString *)string
{
    kCOBLedgerType type = kCOBLedgerTypeUnknown;
    if ([string isEqualToString:@"funding"]) {
        type = kCOBLedgerTypeFunding;
    } else if ([string isEqualToString:@"margin"]) {
        type = kCOBLedgerTypeMargin;
    } else if ([string isEqualToString:@"exchange"]) {
        type = kCOBLedgerTypeExchange;
    }
    return type;
}

+ (kCOBLedgerAction)ledgerActionForString:(NSString *)string
{
    kCOBLedgerAction action = kCOBLedgerActionUnknown;
    if ([string isEqualToString:@"deposit"]) {
        action = kCOBLedgerActionDeposit;
    } else if ([string isEqualToString:@"fixup"]) {
        action = kCOBLedgerActionFixup;
    } else if ([string isEqualToString:@"withdrawal_fee"]) {
        action = kCOBLedgerActionWithdrawalFee;
    } else if ([string isEqualToString:@"deposit_fee"]) {
        action = kCOBLedgerActionDepositFee;
    } else if ([string isEqualToString:@"trade"]) {
        action = kCOBLedgerActionTrade;
    } else if ([string isEqualToString:@"withdraw"]) {
        action = kCOBLedgerActionWithdraw;
    }
    return action;
}

+ (kCOBWithdrawalStatus)withdrawalStatusForString:(NSString *)string
{
    kCOBWithdrawalStatus status = kCOBWithdrawalStatusUnknown;
    if ([string isEqualToString:@"tx_pending_two_factor_auth"]) {
        status = kCOBWithdrawalStatusTxPendingTwoFactorAuth;
    } else if ([string isEqualToString:@"tx_pending_email_auth"]) {
        status = kCOBWithdrawalStatusTxPendingEmailAuth;
    } else if ([string isEqualToString:@"tx_pending_approval"]) {
        status = kCOBWithdrawalStatusTxPendingApproval;
    } else if ([string isEqualToString:@"tx_approved"]) {
        status = kCOBWithdrawalStatusTxApproved;
    } else if ([string isEqualToString:@"tx_processing"]) {
        status = kCOBWithdrawalStatusTxProcessing;
    } else if ([string isEqualToString:@"tx_sent"]) {
        status = kCOBWithdrawalStatusTxSent;
    } else if ([string isEqualToString:@"tx_pending"]) {
        status = kCOBWithdrawalStatusTxPending;
    } else if ([string isEqualToString:@"tx_confirmed"]) {
        status = kCOBWithdrawalStatusTxConfirmed;
    } else if ([string isEqualToString:@"tx_timeout"]) {
        status = kCOBWithdrawalStatusTxTimeout;
    } else if ([string isEqualToString:@"tx_invalid"]) {
        status = kCOBWithdrawalStatusTxInvalid;
    } else if ([string isEqualToString:@"tx_cancelled"]) {
        status = kCOBWithdrawalStatusTxCancelled;
    } else if ([string isEqualToString:@"tx_rejected"]) {
        status = kCOBWithdrawalStatusTxRejected;
    }
    return status;
}

+ (NSString *)stringForOrderSide:(kCOBOrderSide)side
{
    NSString *string = nil;
    switch (side) {
        case kCOBOrderSideAsk:
            string = @"ask";
            break;
        case kCOBOrderSideBid:
            string = @"bid";
            break;
        default:
            break;
    }
    return string;
}

+ (NSString *)stringForOrderType:(kCOBOrderType)type
{
    NSString *string = nil;
    switch (type) {
        case kCOBOrderTypeMarket:
            string = @"market";
            break;
        case kCOBOrderTypeLimit:
            string = @"limit";
            break;
        case kCOBOrderTypeStop:
            string = @"stop";
            break;
        case kCOBOrderTypeStopLimit:
            string = @"stop_limit";
            break;
        default:
            break;
    }
    return string;
}

+ (NSString *)stringForWithdrawalStatus:(kCOBWithdrawalStatus)status
{
    NSString *string = nil;
    switch (status) {
        case kCOBWithdrawalStatusTxPendingTwoFactorAuth:
            string = @"tx_pending_two_factor_auth";
            break;
        case kCOBWithdrawalStatusTxPendingEmailAuth:
            string = @"tx_pending_email_auth";
            break;
        case kCOBWithdrawalStatusTxPendingApproval:
            string = @"tx_pending_approval";
            break;
        case kCOBWithdrawalStatusTxApproved:
            string = @"tx_approved";
            break;
        case kCOBWithdrawalStatusTxProcessing:
            string = @"tx_processing";
            break;
        case kCOBWithdrawalStatusTxSent:
            string = @"tx_sent";
            break;
        case kCOBWithdrawalStatusTxPending:
            string = @"tx_pending";
            break;
        case kCOBWithdrawalStatusTxConfirmed:
            string = @"tx_confirmed";
            break;
        case kCOBWithdrawalStatusTxTimeout:
            string = @"tx_timeout";
            break;
        case kCOBWithdrawalStatusTxInvalid:
            string = @"tx_invalid";
            break;
        case kCOBWithdrawalStatusTxCancelled:
            string = @"tx_cancelled";
            break;
        case kCOBWithdrawalStatusTxRejected:
            string = @"tx_rejected";
            break;
        default:
            break;
    }
    return string;
}

+ (NSString *)stringForCandleTimeframe:(kCOBCandleTimeframe)timeframe
{
    NSString *string = nil;
    switch (timeframe) {
        case kCOBCandleTimeframe1m:
            string = @"1m";
            break;
        case kCOBCandleTimeframe5m:
            string = @"5m";
            break;
        case kCOBCandleTimeframe15m:
            string = @"15m";
            break;
        case kCOBCandleTimeframe30m:
            string = @"30m";
            break;
        case kCOBCandleTimeframe1h:
            string = @"1h";
            break;
        case kCOBCandleTimeframe3h:
            string = @"3h";
            break;
        case kCOBCandleTimeframe6h:
            string = @"6h";
            break;
        case kCOBCandleTimeframe12h:
            string = @"12h";
            break;
        case kCOBCandleTimeframe1D:
            string = @"1D";
            break;
        case kCOBCandleTimeframe7D:
            string = @"7D";
            break;
        case kCOBCandleTimeframe14D:
            string = @"14D";
            break;
        case kCOBCandleTimeframe1M:
            string = @"1M";
            break;
        default:
            break;
    }
    return string;
}

+ (NSNumber *)numberFromString:(NSString *)string
{
    return [[self sharedInstance].formatter numberFromString:string];
}

+ (NSString *)stringFromNumber:(NSNumber *)number
{
    return [[self sharedInstance].formatter stringFromNumber:number];
}

@end
