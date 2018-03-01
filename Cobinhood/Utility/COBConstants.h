//
//  COBConstants.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#ifndef COBConstants_h
#define COBConstants_h

#import <Foundation/Foundation.h>

#define safe_block(block, ...) block ? block(__VA_ARGS__) : nil
#define async_queue_block(queue, block, ...) dispatch_async(queue, ^{ \
    safe_block(block, __VA_ARGS__);                                   \
})
#define main_queue_block(block, ...) async_queue_block(dispatch_get_main_queue(), block, __VA_ARGS__);

static NSString *const kOriginURL = @"https://cobinhood.com";
static NSString *const kApiURL = @"https://api.cobinhood.com";

typedef NS_ENUM(NSInteger, kCOBCandleTimeframe) {
    kCOBCandleTimeframe1m,
    kCOBCandleTimeframe5m,
    kCOBCandleTimeframe15m,
    kCOBCandleTimeframe30m,
    kCOBCandleTimeframe1h,
    kCOBCandleTimeframe3h,
    kCOBCandleTimeframe6h,
    kCOBCandleTimeframe12h,
    kCOBCandleTimeframe1D,
    kCOBCandleTimeframe7D,
    kCOBCandleTimeframe14D,
    kCOBCandleTimeframe1M,
};

typedef NS_ENUM(NSInteger, kCOBOrderState) {
    kCOBOrderStateUnknown,
    kCOBOrderStateNew,
    kCOBOrderStateQueued,
    kCOBOrderStateOpen,
    kCOBOrderStatePartiallyFilled,
    kCOBOrderStateFilled,
    kCOBOrderStateCancelled,
};

typedef NS_ENUM(NSInteger, kCOBOrderSide) {
    kCOBOrderSideUnknown,
    kCOBOrderSideBid,
    kCOBOrderSideAsk
};

typedef NS_ENUM(NSInteger, kCOBOrderType) {
    kCOBOrderTypeUnknown,
    kCOBOrderTypeMarket,
    kCOBOrderTypeLimit,
    kCOBOrderTypeStop,
    kCOBOrderTypeStopLimit,
    kCOBOrderTypeTrailingStop,
    kCOBOrderTypeFillOrKill,
};

typedef NS_ENUM(NSInteger, kCOBTradeMakerSide) {
    kCOBTradeMakerSideBid,
    kCOBTradeMakerSideAsk
};

typedef NS_ENUM(NSInteger, kCOBWalletBalanceType) {
    kCOBWalletBalanceTypeUnknown,
    kCOBWalletBalanceTypeExchange,
};

typedef NS_ENUM(NSInteger, kCOBLedgerType) {
    kCOBLedgerTypeUnknown,
    kCOBLedgerTypeFunding,
    kCOBLedgerTypeMargin,
    kCOBLedgerTypeExchange,
};

typedef NS_ENUM(NSInteger, kCOBLedgerAction) {
    kCOBLedgerActionUnknown,
    kCOBLedgerActionDeposit,
    kCOBLedgerActionFixup,
    kCOBLedgerActionWithdrawalFee,
    kCOBLedgerActionDepositFee,
    kCOBLedgerActionTrade,
    kCOBLedgerActionWithdraw,
};

typedef NS_ENUM(NSInteger, kCOBWithdrawalStatus) {
    kCOBWithdrawalStatusUnknown,
    kCOBWithdrawalStatusTxPendingTwoFactorAuth,
    kCOBWithdrawalStatusTxPendingEmailAuth,
    kCOBWithdrawalStatusTxPendingApproval,
    kCOBWithdrawalStatusTxApproved,
    kCOBWithdrawalStatusTxProcessing,
    kCOBWithdrawalStatusTxSent,
    kCOBWithdrawalStatusTxPending,
    kCOBWithdrawalStatusTxConfirmed,
    kCOBWithdrawalStatusTxTimeout,
    kCOBWithdrawalStatusTxInvalid,
    kCOBWithdrawalStatusTxCancelled,
    kCOBWithdrawalStatusTxRejected,
};


#endif /* COBConstants_h */
