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
@property (strong, nonatomic) NSString *currency;
@property (nonatomic) kCOBWalletBalanceType type;
@property (strong, nonatomic) NSNumber *total;
@property (strong, nonatomic) NSNumber *onOrder;
@property (nonatomic) BOOL locked;

+ (COBWalletBalance *)walletBalanceFromJsonObject:(NSDictionary *)jsonObject;
@end
