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
@property (strong, nonatomic) NSString *withdrawalId;
@property (strong, nonatomic) NSString *userId;
@property (nonatomic) kCOBWithdrawalStatus status;
@property (strong, nonatomic) NSNumber *confirmations;
@property (strong, nonatomic) NSNumber *requiredConfirmations;
@property (strong, nonatomic) NSNumber *createdAt;
@property (strong, nonatomic) NSNumber *sentAt;
@property (strong, nonatomic) NSNumber *completedAt;
@property (strong, nonatomic) NSNumber *updatedAt;
@property (strong, nonatomic) NSString *toAddress;
@property (strong, nonatomic) NSString *txhash;
@property (strong, nonatomic) NSString *currency;
@property (strong, nonatomic) NSNumber *amount;
@property (strong, nonatomic) NSNumber *fee;

+ (COBWithdrawal *)withdrawalFromJsonObject:(NSDictionary *)jsonObject;
@end
