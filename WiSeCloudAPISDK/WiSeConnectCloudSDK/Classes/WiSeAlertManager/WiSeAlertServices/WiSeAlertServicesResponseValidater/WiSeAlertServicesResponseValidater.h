//
//  WiSeAlertServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeAlertServicesResponseValidater : NSObject

+ (id) validateSetUpdateSnoozeTimingResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getSetUpdateSnoozeTimingFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateEnableDisableCheckOutResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getEnableDisableCheckOutFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateSelfAssignResetResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getSelfAssignResetFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

@end
