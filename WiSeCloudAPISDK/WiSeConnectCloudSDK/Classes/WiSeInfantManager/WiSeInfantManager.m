//
//  WiSeInfantManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeInfantManager.h"
#import "WiSeInfantManagerDelegate.h"
#import "WiSeInfantServices.h"
#import "WiSeAPIDefaultDelegate.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@interface WiSeInfantManager ()  <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeInfantServices * infantServices;

@end

@implementation WiSeInfantManager


#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(infantManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate infantManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(infantManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate infantManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
        }
    });
    
}



# pragma mark --- Add Infant ---

- (WiSeCloudAPIRequestRegisteredDetails *) addInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.infantServices) { // Init the manager
        self.infantServices = [WiSeInfantServices new];
    }
    self.infantServices.delegate = self;
    return [self.infantServices addInfantApiWithRequest:request WithHeader:header];
}

# pragma mark --- Edit Infant ---

- (WiSeCloudAPIRequestRegisteredDetails *) editInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.infantServices) { // Init the manager
        self.infantServices = [WiSeInfantServices new];
    }
    self.infantServices.delegate = self;
    return [self.infantServices editInfantApiWithRequest:request WithHeader:header];
}

# pragma mark --- Delete Infant ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.infantServices) { // Init the manager
        self.infantServices = [WiSeInfantServices new];
    }
    self.infantServices.delegate = self;
    return [self.infantServices deleteInfantApiWithRequest:request WithHeader:header];
}

# pragma mark --- Get Infant ---

- (WiSeCloudAPIRequestRegisteredDetails*) getInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.infantServices) { // Init the manager
        self.infantServices = [WiSeInfantServices new];
    }
    self.infantServices.delegate = self;
    return [self.infantServices getInfantApiWithRequest:request WithHeader:header];
}

# pragma mark --- Infant Tag Assocation ---

- (WiSeCloudAPIRequestRegisteredDetails*) infantTagAssociationApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.infantServices) { // Init the manager
        self.infantServices = [WiSeInfantServices new];
    }
    self.infantServices.delegate = self;
    return [self.infantServices infantTagAssociationApiWithRequest:request WithHeader:header];
}

# pragma mark --- Add Rule ---

- (WiSeCloudAPIRequestRegisteredDetails*) addRuleApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.infantServices) { // Init the manager
        self.infantServices = [WiSeInfantServices new];
    }
    self.infantServices.delegate = self;
    return [self.infantServices addRuleApiWithRequest:request WithHeader:header];
}

# pragma mark --- Edit Rule ---

- (WiSeCloudAPIRequestRegisteredDetails*) editRuleApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.infantServices) { // Init the manager
        self.infantServices = [WiSeInfantServices new];
    }
    self.infantServices.delegate = self;
    return [self.infantServices editRuleApiWithRequest:request WithHeader:header];
}

# pragma mark --- Get Infants From Organizations ---

- (WiSeCloudAPIRequestRegisteredDetails *) getInfantsFromOrganizationsApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.infantServices) { // Init the manager
        self.infantServices = [WiSeInfantServices new];
    }
    self.infantServices.delegate = self;
    return [self.infantServices getInfantsFromOrganizationsApiWithRequest:request WithHeader:header];
}

# pragma mark --- Get Archived Infants ---

- (WiSeCloudAPIRequestRegisteredDetails*) getArchivedInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.infantServices) { // Init the manager
        self.infantServices = [WiSeInfantServices new];
    }
    self.infantServices.delegate = self;
    return [self.infantServices getArchivedInfantApiWithRequest:request WithHeader:header];
}

# pragma mark --- Get Infant Position ---

- (WiSeCloudAPIRequestRegisteredDetails*) getInfantPositionApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.infantServices) { // Init the manager
        self.infantServices = [WiSeInfantServices new];
    }
    self.infantServices.delegate = self;
    return [self.infantServices getInfantPositionApiWithRequest:request WithHeader:header];
}

# pragma mark - Default Callbacks

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}


@end
