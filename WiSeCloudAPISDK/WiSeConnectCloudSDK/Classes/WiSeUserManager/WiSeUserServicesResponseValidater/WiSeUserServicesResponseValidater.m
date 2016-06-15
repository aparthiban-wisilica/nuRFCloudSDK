//
//  WiSeUserServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 27/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeUserServicesResponseValidater.h"
#import "WiSeUserServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>

#import "WiSeRegisterAppInfoAPIResponse.h"
#import "WiSeLoginApiResponse.h"
#import "WiSeSignUpApiResponse.h"
#import "WiSeChangePasswordApiResponse.h"
#import "WiSeForgotPasswordAPIResponse.h"
#import "WiSeLogoutAPIResponse.h"
#import "WiSeUpdateUserProfileAPIResponse.h"
#import "WiSeUpdateDeviceTokenAPIResponse.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudUserAPIResponse.h"
#import "WiSeListRolesAPIResponse.h"

@implementation WiSeUserServicesResponseValidater

#pragma mark - Commom Valid Methods

+ (NSString *) getValidErrorMessageFromError : (id) result AndResponseInfo : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeAppError * error = (WiSeAppError *) result;
    NSString * strErrorDes = nil;
    if (responseInfo.error) {
        strErrorDes = responseInfo.error.localizedDescription;
    }else if (error) {
        strErrorDes = error.localizedDescription;
    }
    else {
        strErrorDes = RESPONSE_IS_NIL;
    }
    return strErrorDes;
}

#pragma mark - Save App Info

+ (id) validateRegisterAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == APP_REGISTRATION_SUCCESSFULL || statusCode == APP_REGISTRATION_UPDATED) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeRegisterAppInfoAPIResponse * response = [WiSeUserServicesResponseParser parseSaveAppInfoAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error = [self getSaveAPPInfoErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result = error;
            }
        }else {
            result = [self getSaveAPPInfoErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SaveAppInfoErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getSaveAPPInfoErrorWithErrorDes:strErrorDes WithStatusCode:SaveAppInfoErrorCode];
        result = error;
    }
    return result;
}

+ (WiSeAppError *) getSaveAPPInfoErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:SaveAppInfoFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark - Login

+ (id) validateLoginResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == USER_LOGIN_SUCCESSFULL) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeLoginApiResponse * response = [WiSeUserServicesResponseParser parseLoginAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error = [self getLoginErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result = error;
            }
        }else {
            result = [self getLoginErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:LoginErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getLoginErrorWithErrorDes:strErrorDes WithStatusCode:LoginErrorCode];
        result = error;
    }
    return result;
}

+ (WiSeAppError *) getLoginErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:LoginFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark - SignUp

+ (id) validateSignUpResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == USER_REGISTRATION_SUCCESSFULL) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeSignUpApiResponse * response = [WiSeUserServicesResponseParser parseSignUpAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error = [self getSignUpErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result = error;
            }
        }else {
            result = [self getSignUpErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SignUpErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getSignUpErrorWithErrorDes:strErrorDes WithStatusCode:SignUpErrorCode];
        result = error;
    }
    return result;

}

+ (WiSeAppError *) getSignUpErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:SignUpFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark - Add User

+ (id) validateAddUserResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeCloudUserAPIResponse * response = [WiSeUserServicesResponseParser parseAddEditUserAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error = [self getAddUserErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result = error;
            }
        }else {
            result = [self getAddUserErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddUserErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getAddUserErrorWithErrorDes:strErrorDes WithStatusCode:AddUserErrorCode];
        result = error;
    }
    return result;
}

+ (WiSeAppError *) getAddUserErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
  return [WiSeNetworkUtil getErrorWithDomainName:AddUserFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark - Edit User

+ (id) validateEditUserResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeCloudUserAPIResponse * response = [WiSeUserServicesResponseParser parseAddEditUserAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error = [self getEditUserErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result = error;
            }
        }else {
            result = [self getEditUserErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditUserErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getEditUserErrorWithErrorDes:strErrorDes WithStatusCode:EditUserErrorCode];
        result = error;
    }
    return result;
}

+ (WiSeAppError *) getEditUserErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:EditUserFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark - ChangePassword

+ (id) validateChangePasswordResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
        
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            if (statusCode == USER_REQUEST_SUCCESSFULL) {
                requestInfo.requestStatus                = RequestSuccess;
                WiSeChangePasswordApiResponse * response = [WiSeUserServicesResponseParser parseChangePasswordAPIResponse:responseInfo];
                result                                   = response;
            }else {
                NSString * strErrorDes                   = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                     = [self getChangePasswordErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                   = error;
            }
        }else {
            result = [self getChangePasswordErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:ChangePasswordErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getChangePasswordErrorWithErrorDes:strErrorDes WithStatusCode:ChangePasswordErrorCode];
        result = error;
    }
    return result;
    
}

+ (WiSeAppError *) getChangePasswordErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:ChangePasswordFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark - ForgotPassword

+ (id) validateForgotPasswordResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode                           = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == USER_REQUEST_SUCCESSFULL) {
            requestInfo.requestStatus                = RequestSuccess;
            WiSeForgotPasswordAPIResponse * response = [WiSeUserServicesResponseParser parseForgotPasswordAPIResponse:responseInfo];
            result                                   = response;
            }else {
            NSString * strErrorDes                   = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
            WiSeAppError * error                     = [self getForgotPasswordErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            result                                   = error;
            }
        }else {
            result = [self getForgotPasswordErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:ForgotPasswordErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getForgotPasswordErrorWithErrorDes:strErrorDes WithStatusCode:ForgotPasswordErrorCode];
        result = error;
    }
    return result;
}

+ (WiSeAppError *) getForgotPasswordErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:ForgotPasswordFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Logout ---

+ (id) validateLogoutResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == USER_LOGOUT_SUCCESSFULL) {
            requestInfo.requestStatus        = RequestSuccess;
            WiSeLogoutAPIResponse * response = [WiSeUserServicesResponseParser parseLogoutPasswordAPIResponse:responseInfo];
            result                           = response;
            }else {
            NSString * strErrorDes           = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
            WiSeAppError * error             = [self getLogoutFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            result                           = error;
            }
        }else {
            result = [self getLogoutFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:LogoutErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getLogoutFailedErrorWithErrorDes:strErrorDes WithStatusCode:LogoutErrorCode];
        result = error;
    }
    return result;
}

+ (WiSeAppError *) getLogoutFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:LogoutFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Update User Profile ---

+ (id) validateUserProfileUpdateResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == USER_LOGOUT_SUCCESSFULL) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeUpdateUserProfileAPIResponse * response = [WiSeUserServicesResponseParser parseUpdateUserProfilePasswordAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error = [self getUserProfileUpdateFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result = error;
            }
        }else {
            result = [self getUserProfileUpdateFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateUserProfileErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getUserProfileUpdateFailedErrorWithErrorDes:strErrorDes WithStatusCode:UpdateUserProfileErrorCode];
        result = error;
    }
    return result;
}

+ (WiSeAppError *) getUserProfileUpdateFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:UpdateUserProfileFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Update Device Token ---

+ (id) validateUpdateDeviceTokenResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == UPDATE_DEVICE_TOKEN_SUCCESSFULL) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeUpdateDeviceTokenAPIResponse * response = [WiSeUserServicesResponseParser parseUpdateDeviceTokenAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getUpdateDeviceTokenFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getUpdateDeviceTokenFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateDeviceTokenErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getUpdateDeviceTokenFailedErrorWithErrorDes:strErrorDes WithStatusCode:UpdateDeviceTokenErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getUpdateDeviceTokenFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:UpdateDeviceTokenFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- List Roles ---

+ (id) validateListRolesResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeListRolesAPIResponse * response         = [WiSeUserServicesResponseParser parseListRolesAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getListRolesFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getListRolesFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:ListRolesErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getListRolesFailedErrorWithErrorDes:strErrorDes WithStatusCode:ListRolesErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getListRolesFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:ListRolesFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- List Users ---

+ (id) validateListUsersResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeCloudUserAPIResponse * response         = [WiSeUserServicesResponseParser parseListUsersAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getListUsersFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getListUsersFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:ListUsersErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getListUsersFailedErrorWithErrorDes:strErrorDes WithStatusCode:ListUsersErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getListUsersFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:ListUsersFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Delete User ---

+ (id) validateDeleteUsersResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeCloudUserAPIResponse * response         = [WiSeUserServicesResponseParser parseDeleteUsersAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getDeleteUsersFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getDeleteUsersFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteUserErrorCode];
        }
    }else {
        NSString * strErrorDes = [self getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getDeleteUsersFailedErrorWithErrorDes:strErrorDes WithStatusCode:DeleteUserErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getDeleteUsersFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteUsersFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

@end
