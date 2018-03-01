//
//  COBAskBid.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBAskBid : NSObject
@property (strong, nonatomic, readonly) NSNumber *price;
@property (strong, nonatomic, readonly) NSNumber *count;
@property (strong, nonatomic, readonly) NSNumber *size;

+ (COBAskBid *)askBidFromJsonArray:(NSArray *)jsonArray;
@end
