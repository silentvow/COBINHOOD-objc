//
//  COBOrderBook.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/17.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBOrderBook.h"


@implementation COBOrderBook

+ (COBOrderBook *)orderBookFromJsonObject:(NSDictionary *)jsonObject
{
    COBOrderBook *orderBook = [COBOrderBook new];
    orderBook.sequence = jsonObject[@"sequence"];

    NSMutableArray *asks = [NSMutableArray array];
    for (id jsonArray in jsonObject[@"asks"]) {
        [asks addObject:[COBAskBid askBidFromJsonArray:jsonArray]];
    }
    orderBook.asks = [NSArray arrayWithArray:asks];

    NSMutableArray *bids = [NSMutableArray array];
    for (id jsonArray in jsonObject[@"bids"]) {
        [bids addObject:[COBAskBid askBidFromJsonArray:jsonArray]];
    }
    orderBook.bids = [NSArray arrayWithArray:bids];
    return orderBook;
}

@end
