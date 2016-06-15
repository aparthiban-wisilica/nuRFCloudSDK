//
//  WiSeOperation.m
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 19/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeOperation.h"

//const static int DefaultPriority = 10;
const static int minRetryCount = 0;

@implementation WiSeOperation

- (instancetype)initWithDefaultValuesAndWithCloudApiRequest : (WiSeCloudApiRequest *) apiRequest WithRegisteredId : (int) registeredId{
    
    self.retryCount = minRetryCount;
    self.operationRegisteredTime = [NSDate date];
    self.requestStatus = RequestIsReady;
    self.apiRequest = apiRequest;
    self.priority = apiRequest.requestPriority;
    self.requestRegisteredId = registeredId;
    return self;
    
}

@end
