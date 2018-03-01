//
//  COBCandle.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBCandle : NSObject
@property (strong, nonatomic) NSNumber *timestamp;
@property (strong, nonatomic) NSNumber *open;
@property (strong, nonatomic) NSNumber *close;
@property (strong, nonatomic) NSNumber *high;
@property (strong, nonatomic) NSNumber *low;
@property (strong, nonatomic) NSNumber *volume;

+ (COBCandle *)candleFromJsonObject:(NSDictionary *)jsonObject;
@end
