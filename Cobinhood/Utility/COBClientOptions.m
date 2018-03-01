//
//  COBClientOptions.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBClientOptions.h"


@implementation COBClientOptions

+ (COBClientOptions *)defaultOptions
{
    return [COBClientOptions new];
}

- (instancetype)init
{
    if (self = [super init]) {
        self.authToken = nil;
    }
    return self;
}

@end
