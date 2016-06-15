//
//  WiSeScheduleManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeScheduleManager.h"
#import "WiSeScheduleServices.h"
#import "WiSeAPIDefaultDelegate.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@interface WiSeScheduleManager () <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeScheduleServices * scheduleServices;

@end

@implementation WiSeScheduleManager

#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(scheduleManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate scheduleManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(scheduleManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate scheduleManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
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

# pragma mark --- Add Schedule ---

- (WiSeCloudAPIRequestRegisteredDetails *) addScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.scheduleServices) { // Init the manager
        self.scheduleServices = [WiSeScheduleServices new];
    }
    self.scheduleServices.delegate = self;
    return [self.scheduleServices addScheduleApiWithRequest:request WithHeader:header];
}

# pragma mark --- Edit Schedule ---

- (WiSeCloudAPIRequestRegisteredDetails *) editScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.scheduleServices) { // Init the manager
        self.scheduleServices = [WiSeScheduleServices new];
    }
    self.scheduleServices.delegate = self;
    return [self.scheduleServices editScheduleApiWithRequest:request WithHeader:header];
}

# pragma mark --- Delete Schedule ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.scheduleServices) { // Init the manager
        self.scheduleServices = [WiSeScheduleServices new];
    }
    self.scheduleServices.delegate = self;
    return [self.scheduleServices deleteScheduleApiWithRequest:request WithHeader:header];
}

# pragma mark --- Get Schedule ---

- (WiSeCloudAPIRequestRegisteredDetails *) getScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.scheduleServices) { // Init the manager
        self.scheduleServices = [WiSeScheduleServices new];
    }
    self.scheduleServices.delegate = self;
    return [self.scheduleServices getScheduleApiWithRequest:request WithHeader:header];
}


@end
