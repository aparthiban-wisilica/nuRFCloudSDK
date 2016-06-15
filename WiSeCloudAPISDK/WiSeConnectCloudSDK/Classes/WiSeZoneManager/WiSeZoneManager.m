//
//  WiSeZoneManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 22/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeZoneManager.h"
#import "WiSeZoneServices.h"
#import "WiSeAPIDefaultDelegate.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@interface WiSeZoneManager ()  <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeZoneServices * zoneServices;

@end

@implementation WiSeZoneManager

#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(zoneManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate zoneManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(zoneManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate zoneManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
        }
    });
}

# pragma mark --- Add Zone ---

- (WiSeCloudAPIRequestRegisteredDetails *) addZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.zoneServices) { // Init the manager
        self.zoneServices = [WiSeZoneServices new];
    }
    self.zoneServices.delegate = self;
    return [self.zoneServices addZoneApiWithRequest:request WithHeader:header];
}

# pragma mark --- Edit Zone ---

- (WiSeCloudAPIRequestRegisteredDetails *) editZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.zoneServices) { // Init the manager
        self.zoneServices = [WiSeZoneServices new];
    }
    self.zoneServices.delegate = self;
    return [self.zoneServices editZoneApiWithRequest:request WithHeader:header];
}


# pragma mark --- Delete Zone ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.zoneServices) { // Init the manager
        self.zoneServices = [WiSeZoneServices new];
    }
    self.zoneServices.delegate = self;
    return [self.zoneServices deleteZoneApiWithRequest:request WithHeader:header];
}


# pragma mark --- Get Zone ---

- (WiSeCloudAPIRequestRegisteredDetails *) getZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.zoneServices) { // Init the manager
        self.zoneServices = [WiSeZoneServices new];
    }
    self.zoneServices.delegate = self;
    return [self.zoneServices getZoneApiWithRequest:request WithHeader:header];
}

# pragma mark --- Get Archived Zone ---

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.zoneServices) { // Init the manager
        self.zoneServices = [WiSeZoneServices new];
    }
    self.zoneServices.delegate = self;
    return [self.zoneServices getArchivedZoneApiWithRequest:request WithHeader:header];
}

# pragma mark --- Get Zones From Organization ---

- (WiSeCloudAPIRequestRegisteredDetails *) getZonesFromOrganizationsApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.zoneServices) { // Init the manager
        self.zoneServices = [WiSeZoneServices new];
    }
    self.zoneServices.delegate = self;
    return [self.zoneServices getZonesFromOrganizationsApiWithRequest:request WithHeader:header];

}

# pragma mark --- Map Zone & Listener ---

- (WiSeCloudAPIRequestRegisteredDetails *) mapZoneAndListenerApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header{
    if (!self.zoneServices) { // Init the manager
        self.zoneServices = [WiSeZoneServices new];
    }
    self.zoneServices.delegate = self;
    return [self.zoneServices mapZoneAndListenerApiWithRequest:request WithHeader:header];

}

# pragma mark --- Get Zone Listener Mappping ---

- (WiSeCloudAPIRequestRegisteredDetails *) getZoneListenerMappingApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.zoneServices) { // Init the manager
        self.zoneServices = [WiSeZoneServices new];
    }
    self.zoneServices.delegate = self;
    return [self.zoneServices getZoneListenerMappingApiWithRequest:request WithHeader:header];
}

# pragma mark - Default Callbacks

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

@end
