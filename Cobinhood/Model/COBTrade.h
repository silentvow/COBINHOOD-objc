//
//  COBTrade.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBTrade : NSObject
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSNumber *size;
@property (strong, nonatomic) NSString *makerSide;
@property (strong, nonatomic) NSNumber *timestamp;

+ (COBTrade *)tradeFromJsonObject:(NSDictionary *)jsonObject;
@end
