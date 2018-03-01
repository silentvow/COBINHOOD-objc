//
//  COBDeposit.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBDeposit : NSObject
@property (strong, nonatomic, readonly) NSString *depositId;
@property (strong, nonatomic, readonly) NSString *userId;
@property (strong, nonatomic, readonly) NSString *status;
@property (strong, nonatomic, readonly) NSNumber *confirmations;
@property (strong, nonatomic, readonly) NSNumber *requiredConfirmations;
@property (strong, nonatomic, readonly) NSNumber *createdAt;
@property (strong, nonatomic, readonly) NSNumber *completedAt;
@property (strong, nonatomic, readonly) NSString *fromAddress;
@property (strong, nonatomic, readonly) NSString *txhash;
@property (strong, nonatomic, readonly) NSString *currency;
@property (strong, nonatomic, readonly) NSNumber *amount;
@property (strong, nonatomic, readonly) NSNumber *fee;

+ (COBDeposit *)depositFromJsonObject:(NSDictionary *)jsonObject;
@end
