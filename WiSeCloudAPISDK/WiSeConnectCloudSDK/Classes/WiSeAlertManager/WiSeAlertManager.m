//
//  WiSeAlertManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAlertManager.h"
#import "WiSeAlertServices.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import "WiSeAPIDefaultDelegate.h"

@interface WiSeAlertManager ()  <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeAlertServices * alertServices;

@end

@implementation WiSeAlertManager {
    
}

#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(alertManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate alertManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(alertManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate alertManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
        }
    });
    
}

#pragma mark - Set/Update Snooze Timing

- (WiSeCloudAPIRequestRegisteredDetails *)setUpdateSnoozeTimeApiWithRequest:(WiSeCloudSnoozeSettingRequest *)request WithHeader:(WiSeAPIHeader *)header {
    if (!self.alertServices) { // Init the manager
        self.alertServices = [WiSeAlertServices new];
    }
    self.alertServices.delegate = self;
    return [self.alertServices setUpdateSnoozeTimeApiWithRequest:request WithHeader:header];
}

#pragma mark - Enable/Disable CheckOut API

- (WiSeCloudAPIRequestRegisteredDetails *) enableDisableCheckOutApiWithRequest : (WiSeCheckOutRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.alertServices) { // Init the manager
        self.alertServices = [WiSeAlertServices new];
    }
    self.alertServices.delegate = self;
    return [self.alertServices enableDisableCheckOutApiWithRequest:request WithHeader:header];
}

#pragma mark - Self Assign-Assign Reset API

- (WiSeCloudAPIRequestRegisteredDetails *) selfAssignResetApiWithRequest : (WiSeSelfAssignResetAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.alertServices) { // Init the manager
        self.alertServices = [WiSeAlertServices new];
    }
    self.alertServices.delegate = self;
    return [self.alertServices selfAssignResetApiWithRequest:request WithHeader:header];
}

# pragma mark - Default Callbacks

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}


@end
