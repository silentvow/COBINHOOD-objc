//
//  CobinhoodTests.m
//  CobinhoodTests
//
//  Created by Chun-Ta, Lin on 2018/2/16.
//  Copyright © 2018年 peterlin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "COBClient.h"


@interface CobinhoodTests : XCTestCase
@property (strong, nonatomic) COBClient *client;
@end


@implementation CobinhoodTests

- (void)setUp
{
    [super setUp];

    COBClientOptions *options = [COBClientOptions new];
    options.authToken = @"YOUR_TOKEN_HERE";
    self.client = [[COBClient alloc] initWithOptions:options];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetAllCurrencies
{
    XCTestExpectation *expect = [self expectationWithDescription:@"testGetAllCurrencies"];
    [self.client getAllCurrencies:^(NSArray<COBCurrency *> *currencies) {
        [expect fulfill];
    } failure:^(NSError *error) {
        [expect fulfill];
    }];

    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testPlaceOrder
{
    XCTestExpectation *expect = [self expectationWithDescription:@"testPlaceOrder"];
    [self.client placeOrderWithTradingPairId:@"BTC-USDT" side:kCOBOrderSideAsk type:kCOBOrderTypeMarket price:nil size:@(1.01) success:^(COBOrder *order) {
        [expect fulfill];
    } failure:^(NSError *error) {
        [expect fulfill];
    }];

    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testGetCandles
{
    XCTestExpectation *expect = [self expectationWithDescription:@"testGetCandles"];
    [self.client getAllTradingPairs:^(NSArray<COBTradingPair *> *tradingPairs) {
        NSDate *date = [NSDate date];
        [date dateByAddingTimeInterval:-86400];

        [self.client getCandlesForTradingPair:tradingPairs.firstObject timeframe:kCOBCandleTimeframe1h startTime:[date dateByAddingTimeInterval:-86400] endTime:nil success:^(NSArray<COBCandle *> *candles) {
            [expect fulfill];
        } failure:^(NSError *error) {
            error.localizedFailureReason;
            [expect fulfill];
        }];

    } failure:^(NSError *error) {
        [expect fulfill];
    }];

    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

@end
