//
//  WiSeMessageServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@class WiSeGetMessageHistoryAPIResponse;
@class WiSeResetMessageQueueAPIResponse;
@class WiSeMessageFetchAPIResponse;
@class WiSeMessageStatusUpdateAPIResponse;
@class WiSeNotificationStatusUpdateAPIResponse;

@interface WiSeMessageServicesResponseValidater : NSObject

+ (id ) validateGetMessageHistoryResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetMessageHistoryFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateResetMessageQueueResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getResetMessageQueueFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateMessageFetchAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getMessageFetchAPIFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateMessageStatusUpdateAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getMessageStatusUpdateAPIFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateNotificationStatusUpdateAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getNotificationStatusUpdateAPIFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateGetTrackingAlertsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetTrackingAlertsAPIFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

@end
