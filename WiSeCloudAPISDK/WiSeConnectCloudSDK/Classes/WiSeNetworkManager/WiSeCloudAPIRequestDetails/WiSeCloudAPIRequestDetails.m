//
//  WiSeCloudAPIRequestDetails.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 14/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeCloudAPIRequestDetails.h"

@implementation WiSeCloudAPIRequestDetails

- (instancetype) initRequestDetailsWithRequest : (id) request withRequestId : (int) requestId withRequestStatus : (WiSeCloudApiRequestStatus) requestStatus withAPICallName:(int)apiCallName{
    
    if (self != nil) {
        self.request = request;
        self.requestId = requestId;
        self.requestStatus = requestStatus;
        self.apiId = apiCallName;
        // Can add few more properties like request priority .......
    }
    return self;
}

@end
