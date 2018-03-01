//
//  NSError+Cobinhood.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "NSError+Cobinhood.h"

NSErrorDomain const COBClientErrorDomain = @"COBClientErrorDomain";
NSString *const COBClientErrorCodeKey = @"COBClientErrorCode";


@implementation NSError (Cobinhood)

+ (NSError *)COBUnknownError
{
    return [NSError COBErrorWithCode:@"unknown"];
}

+ (NSError *)COBErrorWithCode:(NSString *)code
{
    NSDictionary *dict = @{COBClientErrorCodeKey : code};
    return [NSError errorWithDomain:COBClientErrorDomain code:0 userInfo:dict];
}

@end
