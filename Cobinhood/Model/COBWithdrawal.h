//
//  COBWithdrawal.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COBConstants.h"


@interface COBWithdrawal : NSObject
@property (strong, nonatomic, readonly) NSString *withdrawalId;
@property (strong, nonatomic, readonly) NSString *userId;
@property (nonatomic, readonly) kCOBWithdrawalStatus status;
@property (strong, nonatomic, readonly) NSNumber *confirmations;
@property (strong, nonatomic, readonly) NSNumber *requiredConfirmations;
@property (strong, nonatomic, readonly) NSNumber *createdAt;
@property (strong, nonatomic, readonly) NSNumber *sentAt;
@property (strong, nonatomic, readonly) NSNumber *completedAt;
@property (strong, nonatomic, readonly) NSNumber *updatedAt;
@property (strong, nonatomic, readonly) NSString *toAddress;
@property (strong, nonatomic, readonly) NSString *txhash;
@property (strong, nonatomic, readonly) NSString *currency;
@property (strong, nonatomic, readonly) NSNumber *amount;
@property (strong, nonatomic, readonly) NSNumber *fee;

+ (COBWithdrawal *)withdrawalFromJsonObject:(NSDictionary *)jsonObject;
@end
