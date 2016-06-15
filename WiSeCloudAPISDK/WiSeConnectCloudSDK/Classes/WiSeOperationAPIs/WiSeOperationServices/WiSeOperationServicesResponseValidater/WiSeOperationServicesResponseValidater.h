//
//  WiSeOperationServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 04/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeOperationServicesResponseValidater : NSObject

# pragma mark --- Update Direct Operation Status ---

+ (id ) validateUpdateDirectOperationStatusResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getUpdateDirectOperationStatusFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

# pragma mark --- Request For Remote Operation ---

+ (id ) validateRequestForRemoteOperationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getUpdateRequestForRemoteOperationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

# pragma mark --- Update Remote Operation Feedback ---

+ (id ) validateUpdateRemoteOperationFeedbackResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getUpdateUpdateRemoteOperationFeedbackFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


@end
