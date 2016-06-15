//
//  WiSeSensorServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 03/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeSensorServicesResponseValidater : NSObject

# pragma mark --- Sensor Association ---

+ (id ) validateSensorAssociationAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getSensorAssociationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


# pragma mark --- Get Sensor Association ---

+ (id ) validateGetSensorAssociationAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetSensorAssociationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


# pragma mark --- Sensor Trigger Log ---

+ (id ) validateSensorTriggerLogAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getSensorTriggerLogFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

# pragma mark --- Sensor Trigger Intervel Set ---

+ (id ) validateSensorTriggerIntervalSetAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getSensorTriggerIntervalSetFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

# pragma mark --- Make Multisensor ---

+ (id ) validateMakeMultiSensorAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getMakeMultiSensorFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

@end
