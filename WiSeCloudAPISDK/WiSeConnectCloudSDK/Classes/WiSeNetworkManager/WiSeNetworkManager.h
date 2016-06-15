//
//  WiSeNetworkManager.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 17/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiRequestDelegate.h"
#import "WiSeCoreNetworkConstants.h"

@class WiSeOperationQueue;
@class WiSeCloudApiRequest;
@class WiSeCloudAPIRequestRegisteredDetails;

@interface WiSeNetworkManager : NSObject

@property (nonatomic,weak) id <WiSeCloudApiRequestDelegate> delegate;
@property (nonatomic,retain) WiSeOperationQueue * operationQueue;
@property (nonatomic,assign) int maximumNumberOfCuncurrentOperations;
@property (nonatomic,assign) NSInteger requestTimeout;

- (WiSeCloudAPIRequestRegisteredDetails *)callApiWithRequest:(WiSeCloudApiRequest *)apiRequest;

+ (id)sharedWiSeNetworkManager;

@end
