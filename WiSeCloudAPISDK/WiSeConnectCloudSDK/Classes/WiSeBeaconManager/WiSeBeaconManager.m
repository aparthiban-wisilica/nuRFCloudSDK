//
//  WiSeBeaconManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 15/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeBeaconManager.h"
#import "WiSeBeaconServices.h"
#import "WiSeAPIDefaultDelegate.h"

#import "WiSeCloudBeaconAPIRequest.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@interface WiSeBeaconManager () <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeBeaconServices * beaconServices;

@end

@implementation WiSeBeaconManager


#pragma mark - Fire Callbacks

- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(beaconMangerAPICallFailedWithError:withRequestDetails:)]) {
            [self.delegate beaconMangerAPICallFailedWithError:error withRequestDetails:requestDetails];
        }
    });
}

- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(beaconMangerAPICallSuccessWithResponse:withRequestDetails:)]) {
            [self.delegate beaconMangerAPICallSuccessWithResponse:response withRequestDetails:requestDetails];
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

# pragma mark - Add Beacon API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *)addBeaconApiWithRequest:(WiSeCloudBeaconAPIRequest *)request {
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices addBeaconApiWithRequest:request];
}

# pragma mark - Edit Beacon API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) editBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices editBeaconApiWithRequest:request];
}


# pragma mark --- Update Beacon Battery Status ---

- (WiSeCloudAPIRequestRegisteredDetails *) updateBeaconBatteryStatusApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices updateBeaconBatteryStatusApiWithRequest:request];

}

# pragma mark --- Update Beacon Data Log ---

- (WiSeCloudAPIRequestRegisteredDetails *) updateBeaconDataLogApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices updateBeaconDataLogApiWithRequest:request];
}

# pragma mark - Get Beacon API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) getBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices getBeaconApiWithRequest:request];
}

# pragma mark - Get Archived Beacon API Call

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices getArchivedBeaconApiWithRequest:request];
}

# pragma mark - Delete Beacon API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) deleteBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request{
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices deleteBeaconApiWithRequest:request];
}



# pragma mark - Delete Beacon API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *)callDeleteBeaconApiWithRequest:(WiSeCloudBeaconAPIRequest *)request {
    return nil;
}

- (void)deleteBeaconFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)deleteBeaconSuccessWithResponse:(WiSeCloudBeaconAPIRequest *)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

# pragma mark - Add Configured Beacon API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *)addConfiguredBeaconApiWithRequest:(WiSeCloudBeaconAPIRequest *)request {
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices addConfiguredBeaconApiWithRequest:request];
}

# pragma mark - Edit Configured Beacon API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *)editConfiguredBeaconApiWithRequest:(WiSeCloudBeaconAPIRequest *)request {
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices editConfiguredBeaconApiWithRequest:request];
}



# pragma mark - Get Configured Beacon API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) getConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices getConfiguredBeaconApiWithRequest:request];
}

# pragma mark - Delete Configured Beacon API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) deleteConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices deleteConfiguredBeaconApiWithRequest:request];
    
}

# pragma mark - Create Device Beacon Association API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *)deviceBeaconAssociationApiWithRequest:(WiSeCloudBeaconAPIRequest *)request {
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices beaconAssociationApiWithRequest:request];
}

# pragma mark - Get Device Beacon Association API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) getDeviceBeaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices getBeaconAssociationApiWithRequest:request];

}

# pragma mark - Get Archived Device Beacon Association API

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedDeviceBeaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    if (!self.beaconServices) {
        self.beaconServices = [WiSeBeaconServices new];
    }
    self.beaconServices.delegate = self;
    return [self.beaconServices getArchivedBeaconAssociationApiWithRequest:request];

}


@end
