//
//  COBWalletBalance.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COBConstants.h"


@interface COBWalletBalance : NSObject
@property (strong, nonatomic, readonly) NSString *currency;
@property (nonatomic, readonly) kCOBWalletBalanceType type;
@property (strong, nonatomic, readonly) NSNumber *total;
@property (strong, nonatomic, readonly) NSNumber *onOrder;
@property (nonatomic, readonly) BOOL locked;

+ (COBWalletBalance *)walletBalanceFromJsonObject:(NSDictionary *)jsonObject;
@end
