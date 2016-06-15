//
//  WiSeScheduleServicesResponseValidator.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeScheduleServicesResponseValidator : NSObject

+ (id) validateAddScheduleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getAddScheduleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateEditScheduleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getEditScheduleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateDeleteScheduleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getDeleteScheduleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateGetScheduleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getGetScheduleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

@end
