//
//  COBTrade.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBTrade : NSObject
@property (strong, nonatomic, readonly) NSString *identifier;
@property (strong, nonatomic, readonly) NSNumber *price;
@property (strong, nonatomic, readonly) NSNumber *size;
@property (strong, nonatomic, readonly) NSString *makerSide;
@property (strong, nonatomic, readonly) NSNumber *timestamp;

+ (COBTrade *)tradeFromJsonObject:(NSDictionary *)jsonObject;
@end
