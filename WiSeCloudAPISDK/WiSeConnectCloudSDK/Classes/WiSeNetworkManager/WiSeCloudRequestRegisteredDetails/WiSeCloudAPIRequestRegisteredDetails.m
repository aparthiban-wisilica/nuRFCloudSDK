//
//  WiSeCloudRequestRegisteredDetails.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 16/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeCloudAPIRequestRegisteredDetails.h"
#import "WiSeCoreNetworkConstants.h"

@implementation WiSeCloudAPIRequestRegisteredDetails

- (instancetype) initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId : (int) requestRegisteredId WithRequestStatus : (WiSeCloudApiRequestStatus) requestStatus {
    if (self != nil) {
        self.requestRegisteredId = requestRegisteredId;
        self.requestStatus = requestStatus;
    }
    return self;
}

@end
