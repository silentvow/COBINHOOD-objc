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
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *currency;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) kCOBLedgerType type;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSNumber *createdAt;

+ (COBWalletAddress *)walletAddressFromJsonObject:(NSDictionary *)jsonObject;
@end
