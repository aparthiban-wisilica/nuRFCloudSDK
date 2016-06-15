//
//  WiSeUserServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 27/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeUserServicesResponseValidater : NSObject

+ (id ) validateRegisterAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getSaveAPPInfoErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;

+ (id) validateLoginResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo ;
+ (WiSeAppError *) getLoginErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateSignUpResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo ;
+ (WiSeAppError *) getSignUpErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateAddUserResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo ;
+ (WiSeAppError *) getAddUserErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateEditUserResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo ;
+ (WiSeAppError *) getEditUserErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateChangePasswordResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getChangePasswordErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateForgotPasswordResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getForgotPasswordErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateLogoutResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getLogoutFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateUserProfileUpdateResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getUserProfileUpdateFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateUpdateDeviceTokenResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getUpdateDeviceTokenFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateListRolesResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getListRolesFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateListUsersResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getListUsersFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateDeleteUsersResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getDeleteUsersFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;


@end
