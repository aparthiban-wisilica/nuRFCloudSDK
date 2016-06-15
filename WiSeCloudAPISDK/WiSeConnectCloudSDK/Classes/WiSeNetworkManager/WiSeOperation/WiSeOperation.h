//
//  WiSeOperation.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 19/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiRequest.h"
#import "WiSeCoreNetworkConstants.h"


@interface WiSeOperation : NSObject

@property (nonatomic,retain) WiSeCloudApiRequest * apiRequest;
@property (nonatomic,retain) NSDate * operationRegisteredTime;
@property (nonatomic,retain) NSDate * operationCompletedTime;
@property (nonatomic,assign) NSTimeInterval totalTimeTaken;
@property (nonatomic,assign) int retryCount;
@property (nonatomic,assign) WiSeCloudApiRequestPriority priority;
@property (nonatomic,assign) WiSeCloudApiRequestStatus requestStatus;
@property (nonatomic,assign) int requestRegisteredId;

- (instancetype)initWithDefaultValuesAndWithCloudApiRequest : (WiSeCloudApiRequest *) apiRequest WithRegisteredId : (int) registeredId;

@end
