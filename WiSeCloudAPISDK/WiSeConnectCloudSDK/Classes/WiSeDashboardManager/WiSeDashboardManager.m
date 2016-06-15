//
//  WiSeDashboardManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 07/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeDashboardManager.h"
#import <WiSeAppLog/WiSeLogManager.h>

#import "WiSeGroupServices.h"
#import "WiSeDeviceServices.h"
#import "WiSeSensorServices.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@interface WiSeDashboardManager () <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeGroupServices                  * groupServices;
@property (nonatomic,strong) WiSeDeviceServices                 * deviceServices;
@property (nonatomic,strong) WiSeSensorServices                 * sensorServices;

@end

@implementation WiSeDashboardManager


#pragma mark - Init

- (instancetype)init {
    return self;
}

#pragma mark - Fire Callbacks
// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(dashboardManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate dashboardManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(dashboardManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate dashboardManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
        }
    });
}



# pragma mark - Add Group API

# pragma mark - Add Group API Call 


- (WiSeCloudAPIRequestRegisteredDetails *)addGroupApiWithRequest:(WiSeCloudGroupAPIRequest *)request {
    if (!self.groupServices) {
        self.groupServices = [WiSeGroupServices new];
    }
    self.groupServices.delegate = self;
    return [self.groupServices addGroupApiWithRequest:request];
}


# pragma mark - Edit Group API 

# pragma mark - Edit Group API Call 


- (WiSeCloudAPIRequestRegisteredDetails *)editGroupApiWithRequest:(WiSeCloudGroupAPIRequest *)request {
    if (!self.groupServices) {
        self.groupServices = [WiSeGroupServices new];
    }
    self.groupServices.delegate = self;
    return [self.groupServices editGroupApiWithRequest:request];
}


# pragma mark - Delete Group API 

# pragma mark - Delete Group API Call 


- (WiSeCloudAPIRequestRegisteredDetails *) deleteGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request {
    if (!self.groupServices) {
        self.groupServices = [WiSeGroupServices new];
    }
    self.groupServices.delegate = self;
    return [self.groupServices deleteGroupApiWithRequest:request];
}

# pragma mark - Default Callbacks

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}



# pragma mark - Add Device API 

# pragma mark - Add Device API Call 


- (WiSeCloudAPIRequestRegisteredDetails *)addDeviceApiWithRequest:(WiSeCloudDeviceAPIRequest *)request {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices addDeviceApiWithRequest:request];
}

- (WiSeCloudAPIRequestRegisteredDetails *) addDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices addDeviceApiWithRequest:request WithHeader:header];
}

# pragma mark - Edit Device API 

# pragma mark - Edit Device API Call 


-(WiSeCloudAPIRequestRegisteredDetails *)editDeviceApiWithRequest:(WiSeCloudDeviceAPIRequest *)request {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices editDeviceApiWithRequest:request];
}

- (WiSeCloudAPIRequestRegisteredDetails *) editDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices editDeviceApiWithRequest:request WithHeader:header];
}

# pragma mark - Get All Devices Against User API

- (WiSeCloudAPIRequestRegisteredDetails*) getAllDeviceAgainstUserApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices getAllDeviceAgainstUserApiWithRequest:request];
}

- (WiSeCloudAPIRequestRegisteredDetails*) getAllDeviceAgainstUserApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices getAllDeviceAgainstUserApiWithRequest:request WithHeader:header];
}

# pragma mark - Get Archived Device API

- (WiSeCloudAPIRequestRegisteredDetails*) getArchivedDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices getArchivedDevicesApiWithRequest:request];
}

- (WiSeCloudAPIRequestRegisteredDetails*) getArchivedDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices getArchivedDeviceApiWithRequest:request WithHeader:header];
}

# pragma mark - Get All Devices Against A Group API 

# pragma mark - Get All Devices Against A Group API Call 


- (WiSeCloudAPIRequestRegisteredDetails*) getAllDeviceAgainstAGroupApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices getAllDevicesAgainstAGroupApiWithRequest:request];
}

#pragma mark --- Device Group Association ---


- (WiSeCloudAPIRequestRegisteredDetails *)deviceGroupAssociationApiWithRequest:(WiSeCloudDeviceAPIRequest *)request {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices deviceGroupAssociationApiWithRequest:request];
}

#pragma mark --- Get Device Group Association ---

- (WiSeCloudAPIRequestRegisteredDetails *)getDeviceGroupAssociationApiWithRequest:(WiSeCloudDeviceAPIRequest *)request {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices getDeviceGroupAssociationApiWithRequest:request];
}

# pragma mark - Get Secured Devices

- (WiSeCloudAPIRequestRegisteredDetails *) getSecureDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices getSecureDeviceApiWithRequest:request];
}

# pragma mark - Clear Secured Devices

- (WiSeCloudAPIRequestRegisteredDetails *) clearSecureDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices clearSecureDeviceApiWithRequest:request];
}


# pragma mark - Get A Devices API 

# pragma mark - Get A Devices API Call 


//- (WiSeCloudAPIRequestRegisteredDetails*) callGetADeviceApiWithRequest : (WiSeGetDevicesAPIRequest *) request {
//    if (!self.getADeviceAPIManager) {
//        self.getADeviceAPIManager = [WiSeGetADeviceAPI new];
//    }
//    self.getADeviceAPIManager.delegate = self;
//    return [self.getADeviceAPIManager callGetADeviceApiWithRequest:request];
//}


# pragma mark - Delete Device API 

# pragma mark - Delete Device API Call 


- (WiSeCloudAPIRequestRegisteredDetails *)deleteDeviceApiWithRequest:(WiSeCloudDeviceAPIRequest *)request {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices deleteDeviceApiWithRequest:request];
}

- (WiSeCloudAPIRequestRegisteredDetails *) deleteDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header{
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices deleteDeviceApiWithRequest:request WithHeader:header];
}



# pragma mark - Sensor Association API 

# pragma mark - Sensor Association API Call 


- (WiSeCloudAPIRequestRegisteredDetails *) sensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request {
    if (!self.sensorServices) {
        self.sensorServices = [WiSeSensorServices new];
    }
    self.sensorServices.delegate = self;
    return [self.sensorServices sensorAssociationApiWithRequest:request];
}


# pragma mark - Get Sensor Association API

# pragma mark - Get Sensor Association API Call 


- (WiSeCloudAPIRequestRegisteredDetails *) getSensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request {
    if (!self.sensorServices) {
        self.sensorServices = [WiSeSensorServices new];
    }
    self.sensorServices.delegate = self;
    return [self.sensorServices getSensorAssociationApiWithRequest:request];
}


# pragma mark - Make Multi Sensor API

# pragma mark - Make Multi Sensor API Call 


//- (WiSeCloudAPIRequestRegisteredDetails *)callMakeMultiSensorApiWithRequest:(WiSeMakeMultiSensorAPIRequest *)request {
//    if (!self.makeMultiSensorManager) {
//        self.makeMultiSensorManager = [WiSeMakeMultiSensorAPI new];
//    }
////    self.makeMultiSensorManager.delegate = self;
//    return [self.makeMultiSensorManager callMakeMultiSensorApiWithRequest:request];
//}



# pragma mark -  Sensor Trigger Log API

# pragma mark -  Sensor Trigger Log API Call 


- (WiSeCloudAPIRequestRegisteredDetails *) sensorTriggerLogApiWithRequest : (WiSeCloudSensorAPIRequest *) request ; {
    if (!self.sensorServices) {
        self.sensorServices = [WiSeSensorServices new];
    }
    self.sensorServices.delegate = self;
    return [self.sensorServices sensorTriggerLogApiWithRequest:request];
}



# pragma mark -  Sensor Trigger Interval Set API

# pragma mark -  Sensor Trigger Interval Set API Call 


//- (WiSeCloudAPIRequestRegisteredDetails *)callSensorTriggerIntervalSetApiWithRequest:(WiSeSensorTriggerIntervalSetAPIRequest *)request {
//    if (!self.sensorTriggerIntervalSetManager) {
//        self.sensorTriggerIntervalSetManager = [WiSeSensorTriggerIntervalSetAPI new];
//    }
////    self.sensorTriggerIntervalSetManager.delegate = self;
//    return [self.sensorTriggerIntervalSetManager callSensorTriggerIntervalSetApiWithRequest:request];
//}



# pragma mark -  Shutter Update API

# pragma mark -  Shutter Update API Call 


//- (WiSeCloudAPIRequestRegisteredDetails *) callShutterUpdateApiWithRequest : (WiSeShutterUpdateAPIRequest *) request {
//    if (!self.shutterUpdateManager) {
//        self.shutterUpdateManager = [WiSeShutterUpdateAPI new];
//    }
////    self.shutterUpdateManager.delegate = self;
//    return [self.shutterUpdateManager callShutterUpdateApiWithRequest:request];
//}


# pragma mark -  Shutter Fetch API

# pragma mark -  Shutter Fetch API Call 


//- (WiSeCloudAPIRequestRegisteredDetails *)callShutterFetchApiWithRequest:(WiSeShutterFetchAPIRequest *)request {
//    if (!self.shutterFetchManager) {
//        self.shutterFetchManager = [WiSeShutterFetchAPI new];
//    }
////    self.shutterFetchManager.delegate = self;
//    return [self.shutterFetchManager callShutterFetchApiWithRequest:request];
//}


# pragma mark -  Get Group

# pragma mark -  Get Group Call 


- (WiSeCloudAPIRequestRegisteredDetails*) getGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request {
    if (!self.groupServices) {
        self.groupServices = [WiSeGroupServices new];
    }
    self.groupServices.delegate = self;
    return [self.groupServices getGroupApiWithRequest:request];
}

# pragma mark -  Get Archived Groups

- (WiSeCloudAPIRequestRegisteredDetails*) getArchivedGroupsApiWithRequest : (WiSeCloudGroupAPIRequest *) request {
    if (!self.groupServices) {
        self.groupServices = [WiSeGroupServices new];
    }
    self.groupServices.delegate = self;
    return [self.groupServices getArchivedGroupApiWithRequest:request];
}

# pragma mark -  Get Archived Sensor Association

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedSensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request {
    if (!self.sensorServices) {
        self.sensorServices = [WiSeSensorServices new];
    }
    self.sensorServices.delegate = self;
    return [self.sensorServices getArchivedSensorAssociationApiWithRequest:request];
}

#pragma mark - Get Listener

- (WiSeCloudAPIRequestRegisteredDetails *) getListenersAgainstUserApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices getListenersAgainstUserApiWithRequest:request WithHeader:header]; 
}

#pragma mark - Get Listener Zone Mapping

- (WiSeCloudAPIRequestRegisteredDetails *) getListenerZoneMappingApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices getListenerZoneMappingApiWithRequest:request WithHeader:header];
}

# pragma mark --- Get Listeners From Organizations ---

- (WiSeCloudAPIRequestRegisteredDetails *) getListenersFromOrganizationsApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices getListenersFromOrganizationsApiWithRequest:request WithHeader:header];
}

#pragma mark - Add Listener

- (WiSeCloudAPIRequestRegisteredDetails *) addListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices addListenerApiWithRequest:request WithHeader:header];
}

#pragma mark - Get Secure Listener

- (WiSeCloudAPIRequestRegisteredDetails *) getSecureListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices addSecureListenerApiWithRequest:request WithHeader:header];
}

#pragma mark - Delete Secure Listener

- (WiSeCloudAPIRequestRegisteredDetails *) deleteSecureListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices deleteSecureListenerApiWithRequest:request WithHeader:header];
}

#pragma mark - Edit Listener

- (WiSeCloudAPIRequestRegisteredDetails *) editListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices editListenerApiWithRequest:request WithHeader:header];
}

#pragma mark - Delete Listener

- (WiSeCloudAPIRequestRegisteredDetails *) deleteListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices deleteListenerApiWithRequest:request WithHeader:header];
}

#pragma mark --- Get Listeners Archive ---

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedListenersApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.deviceServices) {
        self.deviceServices = [WiSeDeviceServices new];
    }
    self.deviceServices.delegate = self;
    return [self.deviceServices getArchivedListenersApiWithRequest:request WithHeader:header];
}

@end
