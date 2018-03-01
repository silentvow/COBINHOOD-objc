//
//  COBAskBid.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBAskBid : NSObject
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSNumber *count;
@property (strong, nonatomic) NSNumber *size;

+ (COBAskBid *)askBidFromJsonArray:(NSArray *)jsonArray;
@end
