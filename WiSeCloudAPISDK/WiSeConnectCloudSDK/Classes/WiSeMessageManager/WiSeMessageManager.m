//
//  WiSeMessageManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeMessageManager.h"
#import "WiSeAPIDefaultDelegate.h"
#import "WiSeMessageServices.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>


@interface WiSeMessageManager () <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeMessageServices * messageServices;

@end

@implementation WiSeMessageManager


#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(messageManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate messageManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(messageManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate messageManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
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


# pragma mark --- Get Message History ---

- (WiSeCloudAPIRequestRegisteredDetails *) getMessageHistoryApiWithRequest : (WiSeGetMessageHistoryAPIRequest *) request {
    
    if (!self.messageServices) {
        self.messageServices = [WiSeMessageServices new]; // Init the manager
    }
    self.messageServices.delegate = self;
    return [self.messageServices getMessageHistoryApiWithRequest:request];

}

# pragma mark --- Reset Message Queue ---

- (WiSeCloudAPIRequestRegisteredDetails *) resetMessageQueueApiWithRequest : (WiSeResetMessageQueueAPIRequest *) request {
    
    if (!self.messageServices) {
        self.messageServices = [WiSeMessageServices new]; // Init the manager
    }
    self.messageServices.delegate = self;
    return [self.messageServices resetMessageQueueApiWithRequest:request];
    
}

- (WiSeCloudAPIRequestRegisteredDetails *) resetMessageQueueApiWithRequest : (WiSeResetMessageQueueAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.messageServices) {
        self.messageServices = [WiSeMessageServices new]; // Init the manager
    }
    self.messageServices.delegate = self;
    return [self.messageServices resetMessageQueueApiWithRequest:request WithHeader:header];
}

# pragma mark --- Message Fetch ---

- (WiSeCloudAPIRequestRegisteredDetails *) messageFetchApiWithRequest : (WiSeMessageFetchAPIRequest *) request {
    
    if (!self.messageServices) {
        self.messageServices = [WiSeMessageServices new]; // Init the manager
    }
    self.messageServices.delegate = self;
    return [self.messageServices messageFetchApiWithRequest:request];

}

# pragma mark --- Message Status Update ---

- (WiSeCloudAPIRequestRegisteredDetails *) messageStatusUpdateApiWithRequest : (WiSeMessageStatusUpdateAPIRequest *) request {
    
    if (!self.messageServices) {
        self.messageServices = [WiSeMessageServices new]; // Init the manager
    }
    self.messageServices.delegate = self;
    return [self.messageServices messageStatusUpdateApiWithRequest:request];
    
}

- (WiSeCloudAPIRequestRegisteredDetails *) messageStatusUpdateApiWithRequest : (WiSeMessageStatusUpdateAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.messageServices) {
        self.messageServices = [WiSeMessageServices new]; // Init the manager
    }
    self.messageServices.delegate = self;
    return [self.messageServices messageStatusUpdateApiWithRequest:request WithHeader:header];
}

# pragma mark --- Notification Status Update ---

- (WiSeCloudAPIRequestRegisteredDetails *) notificationStatusUpdateApiWithRequest : (WiSeNotificationStatusUpdateAPIRequest *) request {
    
    if (!self.messageServices) {
        self.messageServices = [WiSeMessageServices new]; // Init the manager
    }
    self.messageServices.delegate = self;
    return [self.messageServices notificationStatusUpdateApiWithRequest:request];
    
}

# pragma mark --- Notification Update ---

- (WiSeCloudAPIRequestRegisteredDetails *) notificationUpdateApiWithRequest : (WiSeNotificationStatusUpdateAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.messageServices) {
        self.messageServices = [WiSeMessageServices new]; // Init the manager
    }
    self.messageServices.delegate = self;
    return [self.messageServices notificationUpdateApiWithRequest:request WithHeader:header];
}

# pragma mark --- Get Tracking Alerts ---

- (WiSeCloudAPIRequestRegisteredDetails *) getTrackingAlertsApiWithRequest : (WiSeCloudTrackingAlertAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.messageServices) {
        self.messageServices = [WiSeMessageServices new]; // Init the manager
    }
    self.messageServices.delegate = self;
    return [self.messageServices getTrackingAlertsApiWithRequest:request WithHeader:header];
}


@end
