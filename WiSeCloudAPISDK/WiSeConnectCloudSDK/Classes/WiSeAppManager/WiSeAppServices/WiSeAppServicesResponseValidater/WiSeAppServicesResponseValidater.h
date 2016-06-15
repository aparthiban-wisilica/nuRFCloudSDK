//
//  WiSeAppServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeAppServicesResponseValidater : NSObject

+ (id ) validateRegisterAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getSaveAPPInfoErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

+ (id ) validateUpdateRegisterAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getUpdateSaveAPPInfoErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

@end
