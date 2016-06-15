//
//  WiSeMapManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeMapManager.h"
#import "WiSeMapSettingServices.h"
#import "WiSeAPIDefaultDelegate.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@interface WiSeMapManager ()  <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeMapSettingServices * mapServices;

@end

@implementation WiSeMapManager

#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(mapManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate mapManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(mapManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate mapManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
        }
    });
    
}

#pragma mark --- Get Map Settings ---

- (WiSeCloudAPIRequestRegisteredDetails *) getMapSettingsApiWithRequest : (WiSeCloudMapAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.mapServices) { // Init the manager
        self.mapServices = [WiSeMapSettingServices new];
    }
    self.mapServices.delegate = self;
    return [self.mapServices getMapSettingsApiWithRequest:request WithHeader:header];
}

# pragma mark - Default Callbacks

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}


@end
