//
//  WiSeBeaconServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeBeaconServicesResponseValidater : NSObject

+ (id ) validateAddBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getAddBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateEditBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getEditBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateDeleteBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getDeleteBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateGetBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateAddConfiguredBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getAddConfiguredBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateEditConfiguredBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getEditConfiguredBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateDeleteConfiguredBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getDeleteConfiguredBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateGetConfiguredBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetConfiguredBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateCreateBeaconAssociationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getCreateBeaconAssociationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateGetBeaconAssociationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetBeaconAssociationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateDeleteBeaconAssociationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getDeleteBeaconAssociationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateUpdateBeaconBatteryStatusResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getUpdateBeaconBatteryStatusFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateUpdateBeaconDataLogResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getUpdateBeaconDataLogFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

@end
