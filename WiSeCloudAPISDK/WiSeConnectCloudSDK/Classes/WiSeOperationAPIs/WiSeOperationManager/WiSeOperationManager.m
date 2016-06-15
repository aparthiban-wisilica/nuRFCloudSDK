//
//  WiSeOperationManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeOperationManager.h"
#import "WiSeOperationServices.h"

#import "WiSeUpdateDirectOperationStatusAPIRequest.h"
#import "WiSeRequestForRemoteOperationAPIRequest.h"
#import "WiSeUpdateRemoteOperationFeedbackAPIRequest.h"
#import "WiSeAPIDefaultDelegate.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>


@interface WiSeOperationManager () <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeOperationServices * operationServices;

@end

@implementation WiSeOperationManager

#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(operationManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate operationManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(operationManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate operationManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
        }
    });
    
}

# pragma mark - Default Callbacks

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

# pragma mark --- Update Direct Operation Status ---

- (WiSeCloudAPIRequestRegisteredDetails *) updateDirectOperationStautsApiWithRequest : (WiSeUpdateDirectOperationStatusAPIRequest *) request {
    
    if (!self.operationServices) {
        self.operationServices = [WiSeOperationServices new]; // Init the manager
    }
    self.operationServices.delegate = self;
    return [self.operationServices updateDirectOperationStautsApiWithRequest:request];

}

# pragma mark --- Request For Remote Operation ---

- (WiSeCloudAPIRequestRegisteredDetails *) requestForRemoteOperationApiWithRequest : (WiSeRequestForRemoteOperationAPIRequest *) request {
    
    if (!self.operationServices) {
        self.operationServices = [WiSeOperationServices new]; // Init the manager
    }
    self.operationServices.delegate = self;
    return [self.operationServices requestForRemoteOperationApiWithRequest:request];
    
}

# pragma mark --- Update Remote Operation Feedback ---

- (WiSeCloudAPIRequestRegisteredDetails *) updateRemoteOperationFeedbackApiWithRequest : (WiSeUpdateRemoteOperationFeedbackAPIRequest *) request {
    
    if (!self.operationServices) {
        self.operationServices = [WiSeOperationServices new]; // Init the manager
    }
    self.operationServices.delegate = self;
    return [self.operationServices updateRemoteOperationFeedbackApiWithRequest:request];
    
}


@end
