//
//  COBCurrency.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBCurrency : NSObject
@property (strong, nonatomic, readonly) NSString *identifier;
@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSNumber *minUnit;
@property (strong, nonatomic, readonly) NSNumber *depositFee;
@property (strong, nonatomic, readonly) NSNumber *withdrawalFee;

+ (COBCurrency *)currencyFromJsonObject:(NSDictionary *)jsonObject;
@end
