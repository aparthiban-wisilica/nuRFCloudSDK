//
//  WiSeAppManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAppManager.h"
#import "WiSeAppServices.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@interface WiSeAppManager ()  <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeAppServices * appServices;

@end

@implementation WiSeAppManager

#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(appManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate appManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(appManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate appManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
        }
    });
    
}

# pragma mark - Save App Info API Call

- (WiSeCloudAPIRequestRegisteredDetails *) registerAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request {
    if (!self.appServices) {
        self.appServices = [WiSeAppServices new]; // Init the manager
    }
    self.appServices.delegate = self;
    return [self.appServices registerAppAPIWithRequest:request];
}

- (WiSeCloudAPIRequestRegisteredDetails *) registerAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.appServices) {
        self.appServices = [WiSeAppServices new]; // Init the manager
    }
    self.appServices.delegate = self;
    return [self.appServices registerAppAPIWithRequest:request WithHeader:header];
}

# pragma mark - Update Save App Info API Call

- (WiSeCloudAPIRequestRegisteredDetails *) updateRegisterAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request {
    if (!self.appServices) {
        self.appServices = [WiSeAppServices new]; // Init the manager
    }
    self.appServices.delegate = self;
    return [self.appServices updateRegisterAppAPIWithRequest:request];
}

- (WiSeCloudAPIRequestRegisteredDetails *) updateRegisterAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request WithHeader : (WiSeAPIHeader *) header{
    if (!self.appServices) {
        self.appServices = [WiSeAppServices new]; // Init the manager
    }
    self.appServices.delegate = self;
    return [self.appServices updateRegisterAppAPIWithRequest:request WithHeader:header];
}


# pragma mark - Default Callbacks

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}



@end
