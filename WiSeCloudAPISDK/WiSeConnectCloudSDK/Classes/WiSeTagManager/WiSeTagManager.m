//
//  WiSeTagManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeTagManager.h"
#import "WiSeTagManagerServices.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import "WiSeAPIDefaultDelegate.h"

@interface WiSeTagManager ()  <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeTagManagerServices * tagServices;

@end

@implementation WiSeTagManager

#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(tagManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate tagManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(tagManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate tagManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
        }
    });
    
}

#pragma mark --- Add Tag ---

- (WiSeCloudAPIRequestRegisteredDetails *) addTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.tagServices) { // Init the manager
        self.tagServices = [WiSeTagManagerServices new];
    }
    self.tagServices.delegate = self;
    return [self.tagServices addTagApiWithRequest:request WithHeader:header];
}

#pragma mark --- Edit Tag ---

- (WiSeCloudAPIRequestRegisteredDetails *) editTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.tagServices) { // Init the manager
        self.tagServices = [WiSeTagManagerServices new];
    }
    self.tagServices.delegate = self;
    return [self.tagServices editTagApiWithRequest:request WithHeader:header];
}

#pragma mark --- Get Tag ---

- (WiSeCloudAPIRequestRegisteredDetails *) getTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.tagServices) { // Init the manager
        self.tagServices = [WiSeTagManagerServices new];
    }
    self.tagServices.delegate = self;
    return [self.tagServices getTagApiWithRequest:request WithHeader:header];
}

#pragma mark --- Get Archived Tag ---

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.tagServices) { // Init the manager
        self.tagServices = [WiSeTagManagerServices new];
    }
    self.tagServices.delegate = self;
    return [self.tagServices getArchivedTagApiWithRequest:request WithHeader:header];
}

#pragma mark --- Delete Tag ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.tagServices) { // Init the manager
        self.tagServices = [WiSeTagManagerServices new];
    }
    self.tagServices.delegate = self;
    return [self.tagServices deleteTagApiWithRequest:request WithHeader:header];
}

#pragma mark --- Secure Tag ---

- (WiSeCloudAPIRequestRegisteredDetails *) getSecureTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.tagServices) { // Init the manager
        self.tagServices = [WiSeTagManagerServices new];
    }
    self.tagServices.delegate = self;
    return [self.tagServices addSecureTagApiWithRequest:request WithHeader:header];
}

#pragma mark --- Delete Secure Tag ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteSecureTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header{
    if (!self.tagServices) { // Init the manager
        self.tagServices = [WiSeTagManagerServices new];
    }
    self.tagServices.delegate = self;
    return [self.tagServices deleteSecureTagApiWithRequest:request WithHeader:header];
}

#pragma mark --- Delete Secure Tag ---

- (WiSeCloudAPIRequestRegisteredDetails *) tagCheckApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header{
    if (!self.tagServices) { // Init the manager
        self.tagServices = [WiSeTagManagerServices new];
    }
    self.tagServices.delegate = self;
    return [self.tagServices tagCheckApiWithRequest:request WithHeader:header];
}

# pragma mark - Default Callbacks

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}


@end
