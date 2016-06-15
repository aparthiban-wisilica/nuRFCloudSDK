//
//  WiSeSettingsServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;


@interface WiSeSettingsServicesResponseValidater : NSObject

+ (id ) validateBridgeSet_RemoveApiResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getBridgeSet_RemoveApiFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

# pragma mark --- Create/Update Subscription ---

+ (id ) validateCreateUpdateSubscriptionResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getCreateUpdateSubscriptionFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

# pragma mark --- Get Subscription ---

+ (id ) validateGetSubscriptionResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetSubscriptionFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

# pragma mark --- Health Check ---

+ (id ) validateHealthCheckResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getHealthCheckFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

@end
