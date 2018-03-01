//
//  COBAskBid.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBAskBid.h"
#import "COBParamFormatter.h"

@interface COBAskBid ()
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSNumber *count;
@property (strong, nonatomic) NSNumber *size;
@end

@implementation COBAskBid

+ (COBAskBid *)askBidFromJsonArray:(NSArray *)jsonArray
{
    COBAskBid *askBid = [COBAskBid new];
    askBid.price = [COBParamFormatter numberFromString:jsonArray[0]];
    askBid.size = [COBParamFormatter numberFromString:jsonArray[1]];
    askBid.count = [COBParamFormatter numberFromString:jsonArray[2]];

    return askBid;
}

@end
