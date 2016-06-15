//
//  WiSeOrganizationManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeOrganizationManager.h"
#import "WiSeOrganizationManagerDelegate.h"
#import "WiSeOrganizationServices.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@interface WiSeOrganizationManager ()  <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeOrganizationServices * orgServices;

@end

@implementation WiSeOrganizationManager


#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(organizationManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate organizationManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(organizationManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate organizationManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
        }
    });
    
}


#pragma mark --- Add Sub Organization ---

- (WiSeCloudAPIRequestRegisteredDetails *) addOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header{
    
    if (!self.orgServices) { // Init the manager
        self.orgServices = [WiSeOrganizationServices new];
    }
    self.orgServices.delegate = self;
    return [self.orgServices addOrganizationApiWithRequest:request WithHeader:header];
}

#pragma mark --- Edit Sub Organization ---

- (WiSeCloudAPIRequestRegisteredDetails *) editOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header{
    if (!self.orgServices) { // Init the manager
        self.orgServices = [WiSeOrganizationServices new];
    }
    self.orgServices.delegate = self;
    return [self.orgServices editOrganizationApiWithRequest:request WithHeader:header];
}

#pragma mark --- Get Sub Organization ---

- (WiSeCloudAPIRequestRegisteredDetails*) getOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header{
    if (!self.orgServices) { // Init the manager
        self.orgServices = [WiSeOrganizationServices new];
    }
    self.orgServices.delegate = self;
    return [self.orgServices getOrganizationApiWithRequest:request WithHeader:header];
}

#pragma mark --- Delete Sub Organization ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header{
    if (!self.orgServices) { // Init the manager
        self.orgServices = [WiSeOrganizationServices new];
    }
    self.orgServices.delegate = self;
    return [self.orgServices deleteOrganizationApiWithRequest:request WithHeader:header];
}

# pragma mark - Default Callbacks

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

@end
