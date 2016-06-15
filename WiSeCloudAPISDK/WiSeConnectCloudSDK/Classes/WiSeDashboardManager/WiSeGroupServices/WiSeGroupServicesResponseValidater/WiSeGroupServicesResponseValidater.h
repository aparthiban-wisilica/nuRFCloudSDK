//
//  WiSeGroupServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 28/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeGroupServicesResponseValidater : NSObject

+ (id) validateAddGroupResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getAddGroupFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateEditGroupResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getEditGroupFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateDeleteGroupResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getDeleteGroupFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateGetGroupResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getGetGroupFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

@end
