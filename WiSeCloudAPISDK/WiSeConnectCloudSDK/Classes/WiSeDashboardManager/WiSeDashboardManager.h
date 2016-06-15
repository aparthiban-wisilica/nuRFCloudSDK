//
//  WiSeDashboardManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 07/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeDashboardManagerDelegate.h"

@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeCloudDeviceAPIRequest;
@class WiSeCloudSensorAPIRequest;
@class WiSeCloudGroupAPIRequest;
@class WiSeAPIHeader;
@class WiSeCloudListenerAPIRequest;

@interface WiSeDashboardManager : NSObject

@property (nonatomic,weak) id <WiSeDashboardManagerDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) addGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) editGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedGroupsApiWithRequest : (WiSeCloudGroupAPIRequest *) request ;


- (WiSeCloudAPIRequestRegisteredDetails *) addDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) editDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getAllDeviceAgainstUserApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) deviceGroupAssociationApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getDeviceGroupAssociationApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getSecureDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) clearSecureDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;


- (WiSeCloudAPIRequestRegisteredDetails *) sensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getSensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedSensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) sensorTriggerLogApiWithRequest : (WiSeCloudSensorAPIRequest *) request ;



//- (WiSeCloudAPIRequestRegisteredDetails *) callDashBoardApiWithRequest : (WiSeDashBoardAPIRequest *) request;
//- (WiSeCloudAPIRequestRegisteredDetails *) callUpdateDirectOperationStatusApiWithRequest : (WiSeUpdateDirectOperationStatusAPIRequest *) request ;

//- (WiSeCloudAPIRequestRegisteredDetails *) callMakeMultiSensorApiWithRequest : (WiSeMakeMultiSensorAPIRequest *) request ;
//- (WiSeCloudAPIRequestRegisteredDetails *) callSensorTriggerLogApiWithRequest : (WiSeSensorTriggerLogAPIRequest *) request ;
//- (WiSeCloudAPIRequestRegisteredDetails *) callSensorTriggerIntervalSetApiWithRequest : (WiSeSensorTriggerIntervalSetAPIRequest *) request ;
//- (WiSeCloudAPIRequestRegisteredDetails *) callShutterUpdateApiWithRequest : (WiSeShutterUpdateAPIRequest *) request ;
//- (WiSeCloudAPIRequestRegisteredDetails *) callShutterFetchApiWithRequest : (WiSeShutterFetchAPIRequest *) request ;
//- (WiSeCloudAPIRequestRegisteredDetails*) callGetADeviceApiWithRequest : (WiSeGetDevicesAPIRequest *) request ;

/*!
 * @brief CMS APIs.
 */

- (WiSeCloudAPIRequestRegisteredDetails *) addDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getAllDeviceAgainstUserApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getListenersAgainstUserApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getListenerZoneMappingApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getListenersFromOrganizationsApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) addListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getSecureListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteSecureListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;
// Upadated
- (WiSeCloudAPIRequestRegisteredDetails *) deleteListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedListenersApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;


@end
