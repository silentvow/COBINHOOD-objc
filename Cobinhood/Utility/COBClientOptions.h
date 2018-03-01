//
//  COBClientOptions.h
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COBClientOptions : NSObject
@property (strong, nonatomic) NSString *authToken;

+ (COBClientOptions *)defaultOptions;
@end
