//
//  WiSeTagManagerServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeTagManagerServicesResponseValidater : NSObject

+ (id) validateAddTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getAddTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;


+ (id) validateEditTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getEditTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;


+ (id) validateGetTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;


+ (id) validateGetArchivedTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetArchivedTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;


+ (id) validateDeleteTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetDeleteFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;


+ (id) validateSecureTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getSecureTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;


+ (id) validateDeleteSecureTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getDeleteSecureTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;


+ (id) validateTagCheckResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getTagCheckFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;


@end
