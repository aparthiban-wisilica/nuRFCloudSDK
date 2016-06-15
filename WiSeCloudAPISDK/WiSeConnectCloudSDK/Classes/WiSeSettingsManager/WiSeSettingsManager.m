//
//  WiSeSettingsManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSettingsManager.h"

#import "WiSeSettingsServices.h"

#import "WiSeAPIDefaultDelegate.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@interface WiSeSettingsManager () <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeSettingsServices * settingsServices;

@end

@implementation WiSeSettingsManager

#pragma mark - Fire Callbacks

- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(settingsManagerAPICallFailedWithError:withRequestDetails:)]) {
            [self.delegate settingsManagerAPICallFailedWithError:error withRequestDetails:requestDetails];
        }
    });
}

- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(settingsManagerAPICallSuccessWithResponse:withRequestDetails:)]) {
            [self.delegate settingsManagerAPICallSuccessWithResponse:response withRequestDetails:requestDetails];
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

# pragma mark - Bridge Set_Remove API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) bridgeSet_RemoveApiWithRequest : (WiSeBridgeSet_RemoveAPIRequest *) request {
    if (!self.settingsServices) {
        self.settingsServices = [WiSeSettingsServices new];
    }
    self.settingsServices.delegate = self;
    return [self.settingsServices bridgeSet_RemoveApiWithRequest:request];
}

# pragma mark --- Create/Update Subscription ---

- (WiSeCloudAPIRequestRegisteredDetails *) createUpdateSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request {
    if (!self.settingsServices) {
        self.settingsServices = [WiSeSettingsServices new]; // Init the manager
    }
    self.settingsServices.delegate = self;
    return [self.settingsServices createUpdateSubscriptionApiWithRequest:request];
}

- (WiSeCloudAPIRequestRegisteredDetails *) createUpdateSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.settingsServices) {
        self.settingsServices = [WiSeSettingsServices new]; // Init the manager
    }
    self.settingsServices.delegate = self;
    return [self.settingsServices createUpdateSubscriptionApiWithRequest:request WithHeader:header];
}

# pragma mark --- Get Subscription ---

- (WiSeCloudAPIRequestRegisteredDetails *) getSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request {
    if (!self.settingsServices) {
        self.settingsServices = [WiSeSettingsServices new]; // Init the manager
    }
    self.settingsServices.delegate = self;
    return [self.settingsServices getSubscriptionApiWithRequest:request];
}

- (WiSeCloudAPIRequestRegisteredDetails *) getSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.settingsServices) {
        self.settingsServices = [WiSeSettingsServices new]; // Init the manager
    }
    self.settingsServices.delegate = self;
    return [self.settingsServices getSubscriptionApiWithRequest:request WithHeader:header];
}

# pragma mark --- Health Check ---

- (WiSeCloudAPIRequestRegisteredDetails *) healthCheckApiWithRequest : (WiSeHealthCheckAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.settingsServices) {
        self.settingsServices = [WiSeSettingsServices new]; // Init the manager
    }
    self.settingsServices.delegate = self;
    return [self.settingsServices healthCheckApiWithRequest:request WithHeader:header];
}
@end
