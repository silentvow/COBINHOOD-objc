//
//  COBDeposit.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBDeposit : NSObject
@property (strong, nonatomic) NSString *depositId;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSNumber *confirmations;
@property (strong, nonatomic) NSNumber *requiredConfirmations;
@property (strong, nonatomic) NSNumber *createdAt;
@property (strong, nonatomic) NSNumber *completedAt;
@property (strong, nonatomic) NSString *fromAddress;
@property (strong, nonatomic) NSString *txhash;
@property (strong, nonatomic) NSString *currency;
@property (strong, nonatomic) NSNumber *amount;
@property (strong, nonatomic) NSNumber *fee;

+ (COBDeposit *)depositFromJsonObject:(NSDictionary *)jsonObject;
@end
