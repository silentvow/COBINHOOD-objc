//
//  NSError+Cobinhood.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSErrorDomain const COBClientErrorDomain;
FOUNDATION_EXPORT NSString *const COBClientErrorCodeKey;


@interface NSError (Cobinhood)

+ (NSError *)COBUnknownError;
+ (NSError *)COBErrorWithCode:(NSString *)code;

@end
