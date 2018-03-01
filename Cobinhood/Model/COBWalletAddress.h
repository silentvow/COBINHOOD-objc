//
//  COBWalletAddress.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COBConstants.h"


@interface COBWalletAddress : NSObject
@property (strong, nonatomic, readonly) NSString *identifier;
@property (strong, nonatomic, readonly) NSString *currency;
@property (strong, nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) kCOBLedgerType type;
@property (strong, nonatomic, readonly) NSString *address;
@property (strong, nonatomic, readonly) NSNumber *createdAt;

+ (COBWalletAddress *)walletAddressFromJsonObject:(NSDictionary *)jsonObject;
@end
