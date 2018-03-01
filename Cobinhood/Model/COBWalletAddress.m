//
//  COBWalletAddress.m
//  Cobinhood
//
//  Created by Chun-Ta, Lin on 2018/2/19.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import "COBWalletAddress.h"
#import "COBParamFormatter.h"


@interface COBWalletAddress ()
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *currency;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) kCOBLedgerType type;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSNumber *createdAt;
@end

@implementation COBWalletAddress

+ (COBWalletAddress *)walletAddressFromJsonObject:(NSDictionary *)jsonObject
{
    COBWalletAddress *address = [COBWalletAddress new];
    address.identifier = jsonObject[@"id"];
    address.currency = jsonObject[@"currency"];
    address.name = jsonObject[@"name"];
    address.type = [COBParamFormatter ledgerTypeForString:jsonObject[@"type"]];
    address.address = jsonObject[@"address"];
    address.createdAt = jsonObject[@"created_at"];
    return address;
}

@end
