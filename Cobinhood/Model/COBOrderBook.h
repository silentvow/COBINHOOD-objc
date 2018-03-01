//
//  COBOrderBook.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COBAskBid.h"


@interface COBOrderBook : NSObject
@property (strong, nonatomic) NSNumber *sequence;
@property (strong, nonatomic) NSArray<COBAskBid *> *bids;
@property (strong, nonatomic) NSArray<COBAskBid *> *asks;

+ (COBOrderBook *)orderBookFromJsonObject:(NSDictionary *)jsonObject;
@end
