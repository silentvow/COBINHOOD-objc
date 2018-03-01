# COBINHOOD-objc

COBINHOOD-objc is a Cocoa and Cocoa Touch framework for interacting with [COBINHOOD restful API](https://cobinhood.github.io/api-public), built using [AFNetworking](https://github.com/AFNetworking/AFNetworking).

## Usage

In order to begin interacting with the API, you must instantiate a `COBClient`. 
You can instantiate an unauthenticated client:

```objc
COBClient *client = [[COBClient alloc] init];
```

or an authenticated client:

```objc
COBClientOptions *options = [[COBClientOptions alloc] init];
options.authToken = "YOUR_AUTHORIZATION_TOKEN";
COBClient *client = [[COBClient alloc] initWithOptions:options];
```

After we've got a client, we can start performing request. Each request method will call either success block or failure block. All requests are asynchronous.

### Get All Currencies

```objc
[client getAllCurrencies:^(NSArray<COBCurrency *> *currencies) {
    // do something with result
} failure:^(NSError *error) {
    // do error handling
}];
```

### Get Trading Statistics

```objc
[client getTradingStats:^(NSDictionary<NSString *,COBTradingStat *> *tradingStats
) {
    // do something with result
} failure:^(NSError *error) {
    // do error handling
}];
```

### Place an Order

```
[client placeOrderWithTradingPairId:@"BTC-USDT" side:kCOBOrderSideBid type:kCOBOrderTypeLimit price:@(5000.01) size:@(1.01) success:^(COBOrder *order) {
    // do something with result
} failure:^(NSError *error) {
    // do error handling
}];
```

### Cancel an Order

```
[client cancelOrderWithOrderId:@"ORDER_ID" success:^{
    // do something with result
} failure:^(NSError *error) {
    // do error handling
}];
```

Other request methods are listed in COBINHOOD API documents: [https://cobinhood.github.io/api-public/](https://cobinhood.github.io/api-public/)


## Error Handling

Each failure of request will provide a `NSError` error. 
If the failure reason is due to COBINHOOD server, the error's domain must be `COBClientErrorDomain
` and provide the reason in `userInfo[COBClientErrorCodeKey]`.
