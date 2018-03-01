//
//  COBCandle.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBCandle : NSObject
@property (strong, nonatomic, readonly) NSNumber *timestamp;
@property (strong, nonatomic, readonly) NSNumber *open;
@property (strong, nonatomic, readonly) NSNumber *close;
@property (strong, nonatomic, readonly) NSNumber *high;
@property (strong, nonatomic, readonly) NSNumber *low;
@property (strong, nonatomic, readonly) NSNumber *volume;

+ (COBCandle *)candleFromJsonObject:(NSDictionary *)jsonObject;
@end
