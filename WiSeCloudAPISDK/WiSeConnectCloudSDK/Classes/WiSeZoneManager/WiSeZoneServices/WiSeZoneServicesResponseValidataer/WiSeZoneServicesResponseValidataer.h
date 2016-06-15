//
//  WiSeZoneServicesResponseValidataer.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 22/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeZoneServicesResponseValidataer : NSObject

+ (id) validateAddZoneResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getAddZoneFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateEditZoneResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getEditZoneFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateDeleteZoneResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getDeleteZoneFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateGetZoneResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getGetZoneFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateGetArchivedZoneResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getGetArchivedZoneFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateGetZonesFromOrganizationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getGetZonesFromOrganizationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateGetZoneListenerMappingResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getGetZoneListenerMappingFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateMapZoneListenerResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getMapZoneListenerFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

@end
