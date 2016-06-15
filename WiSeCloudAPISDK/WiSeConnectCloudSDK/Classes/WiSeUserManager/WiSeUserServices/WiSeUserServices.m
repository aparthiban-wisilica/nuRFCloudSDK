//
//  WiSeUserServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 27/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeUserServices.h"
#import "WiSeUserServicesRequestParser.h"
#import "WiSeUserServicesResponseParser.h"
#import "WiSeUserServicesResponseValidater.h"
#import "WiSeParsedAPIResponse.h"
#import <WiSeAppLog/WiSeLogManager.h>

#import "WiSeRegisterAppAPIRequest.h"
#import "WiSeRegisterAppInfoAPIResponse.h"

#import "WiSeLoginApiRequest.h"
#import "WiSeLoginApiResponse.h"

#import "WiSeSignUpApiRequest.h"
#import "WiSeSignUpApiResponse.h"

#import "WiSeChangePasswordApiRequest.h"
#import "WiSeChangePasswordApiResponse.h"

#import "WiSeForgotPasswordAPIRequest.h"
#import "WiSeForgotPasswordAPIResponse.h"

#import "WiSeLogoutAPIRequest.h"
#import "WiSeLogoutAPIResponse.h"

#import "WiSeUpdateUserProfileAPIRequest.h"
#import "WiSeUpdateUserProfileAPIResponse.h"

#import "WiSeUpdateDeviceTokenAPIRequest.h"
#import "WiSeUpdateDeviceTokenAPIResponse.h"

#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>

#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>

#import "WiSeAPIHeader.h"
#import "WiSeCloudUserAPIRequest.h"
#import "WiSeCloudUserAPIResponse.h"

#import "WiSeListRolesAPIRequest.h"
#import "WiSeListRolesAPIResponse.h"

#import "WiSeCloudAPIURLInfo.h"

@interface WiSeUserServices () <WiSeCloudApiRequestDelegate>

@end

@implementation WiSeUserServices {
    WiSeNetworkManager * wiseNetworkManager;
}

# pragma mark - Trigger Call back

- (void) triggerSuccessCallBack : (id) response withRequestDetails : (WiSeCloudAPIRequestDetails *)requestInfo{
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiCallIsSuccessfulWithResponse:WithRequestDetails:)]) {
        [self.delegate apiCallIsSuccessfulWithResponse:response WithRequestDetails:requestInfo];
    }
}

- (void) triggerFailCallBack : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *)requestInfo{
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiCallIsFailedWithError:WithRequestDetails:)]) {
        [self.delegate apiCallIsFailedWithError:error WithRequestDetails:requestInfo];
    }
}

#pragma mark - Save APP Info

- (WiSeCloudAPIRequestRegisteredDetails *)registerAppAPIWithRequest:(WiSeRegisterAppAPIRequest *)request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequest];
        NSDictionary * dictParams                 = [WiSeUserServicesRequestParser createSaveAPPAPIJson:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:SaveAppInfo]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dictParams withURLKey:SaveAppInfoURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:SaveAppInfo]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getSaveAppInfoRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateRegisterAppResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Register App Response
    if ([result isKindOfClass:[WiSeRegisterAppInfoAPIResponse class ]]) { // When model response class exsit
        
        WiSeRegisterAppInfoAPIResponse * response = (WiSeRegisterAppInfoAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getSaveAPPInfoErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SaveAppInfoErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

#pragma mark - Login

- (WiSeCloudAPIRequestRegisteredDetails *)loginApiWithRequest:(WiSeLoginApiRequest *)request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (![WiSeNetworkUtil createSHA512:request.password]) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:WiSePasswordEncryptDomainError withErrorDescription:WiSePasswordEncryptErrorDecription withDomainCode:PasswordEncryptionErrorCode];
        WiSeLogInfo(@"%@",error);
        regDetails = [WiSeNetworkUtil isRequestValid:nil];
    }
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequest];
        NSDictionary * dictParams                 = [WiSeUserServicesRequestParser createLoingApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:Login]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dictParams withURLKey:LoginURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:Login]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (WiSeCloudAPIRequestRegisteredDetails *) loginApiWithRequest : (WiSeLoginApiRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (![WiSeNetworkUtil createSHA512:request.password]) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:WiSePasswordEncryptDomainError withErrorDescription:WiSePasswordEncryptErrorDecription withDomainCode:PasswordEncryptionErrorCode];
        WiSeLogInfo(@"%@",error);
        regDetails = [WiSeNetworkUtil isRequestValid:nil];
    }
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * dictParams                 = [WiSeUserServicesRequestParser createLoingApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:Login]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dictParams withURLKey:LoginURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:Login]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getLoginRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateLoginResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Login Response
    if ([result isKindOfClass:[WiSeLoginApiResponse class ]]) { // When model response class exsit
        
        WiSeLoginApiResponse * response = (WiSeLoginApiResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getLoginErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:LoginErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark - Signup

- (WiSeCloudAPIRequestRegisteredDetails *)signUpApiWithRequest:(WiSeSignUpApiRequest *)request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (![WiSeNetworkUtil createSHA512:request.userPassword]) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:WiSePasswordEncryptDomainError withErrorDescription:WiSePasswordEncryptErrorDecription withDomainCode:PasswordEncryptionErrorCode];
        WiSeLogInfo(@"%@",error);
        regDetails = [WiSeNetworkUtil isRequestValid:nil];
    }
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequest];
        NSDictionary * dictParams                 = [WiSeUserServicesRequestParser createSignUpApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:SignUp]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dictParams withURLKey:SignUpURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:SignUp]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getSignUpRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateSignUpResponse:responseInfo WithRequestDetails:requestInfo]; // Validate SignUp Response
    if ([result isKindOfClass:[WiSeSignUpApiResponse class ]]) { // When model response class exsit
        
        WiSeSignUpApiResponse * response = (WiSeSignUpApiResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getSignUpErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SignUpErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark - Add User

- (WiSeCloudAPIRequestRegisteredDetails *) addUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (![WiSeNetworkUtil createSHA512:request.userPassword]) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:WiSePasswordEncryptDomainError withErrorDescription:WiSePasswordEncryptErrorDecription withDomainCode:PasswordEncryptionErrorCode];
        WiSeLogInfo(@"%@",error);
        regDetails = [WiSeNetworkUtil isRequestValid:nil];
    }
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * arrParams                       = [WiSeUserServicesRequestParser createAddUserApiParameters:request];

        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddUser]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:arrParams withURLKey:AddUserURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddUser];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getAddUserRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateAddUserResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit User Response
    if ([result isKindOfClass:[WiSeCloudUserAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudUserAPIResponse * response = (WiSeCloudUserAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getAddUserErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddUserErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark - Edit User

- (WiSeCloudAPIRequestRegisteredDetails *) editUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader:(WiSeAPIHeader *)header{
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (![WiSeNetworkUtil createSHA512:request.userPassword]) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:WiSePasswordEncryptDomainError withErrorDescription:WiSePasswordEncryptErrorDecription withDomainCode:PasswordEncryptionErrorCode];
        WiSeLogInfo(@"%@",error);
        regDetails = [WiSeNetworkUtil isRequestValid:nil];
    }
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * dictParams                 = [WiSeUserServicesRequestParser createAddUserApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditUser]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dictParams withURLKey:EditUserURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditUser]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getEditUserRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateEditUserResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit User Response
    if ([result isKindOfClass:[WiSeCloudUserAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudUserAPIResponse * response = (WiSeCloudUserAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getEditUserErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditUserErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


#pragma mark - Change Password

- (WiSeCloudAPIRequestRegisteredDetails *) changePasswordApiWithRequest : (WiSeChangePasswordApiRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (![WiSeNetworkUtil createSHA512:request.oldPassword] || ![WiSeNetworkUtil createSHA512:request.changedPassword]) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:WiSePasswordEncryptDomainError withErrorDescription:WiSePasswordEncryptErrorDecription withDomainCode:PasswordEncryptionErrorCode];
        WiSeLogInfo(@"%@",error);
        regDetails = [WiSeNetworkUtil isRequestValid:nil];
    }
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSDictionary * dictParams                 = [WiSeUserServicesRequestParser createChangePasswordApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:ChangePassword]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];

        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dictParams withURLKey:ChangePasswordURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ChangePassword]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
    
}

- (WiSeCloudAPIRequestRegisteredDetails *) changePasswordApiWithRequest : (WiSeChangePasswordApiRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (![WiSeNetworkUtil createSHA512:request.oldPassword] || ![WiSeNetworkUtil createSHA512:request.changedPassword]) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:WiSePasswordEncryptDomainError withErrorDescription:WiSePasswordEncryptErrorDecription withDomainCode:PasswordEncryptionErrorCode];
        WiSeLogInfo(@"%@",error);
        regDetails = [WiSeNetworkUtil isRequestValid:nil];
    }
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * dictParams                 = [WiSeUserServicesRequestParser createChangePasswordApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:ChangePassword]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dictParams withURLKey:ChangePasswordURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ChangePassword]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getChangePasswordRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateChangePasswordResponse:responseInfo WithRequestDetails:requestInfo]; // Validate ChangePassword Response
    if ([result isKindOfClass:[WiSeChangePasswordApiResponse class ]]) { // When model response class exsit
        
        WiSeChangePasswordApiResponse * response = (WiSeChangePasswordApiResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getChangePasswordErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:ChangePasswordErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark - Forgot Password

- (WiSeCloudAPIRequestRegisteredDetails *)forgotPasswordApiWithRequest:(WiSeForgotPasswordAPIRequest *)request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valids
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequest];
        NSDictionary * dictParams =[WiSeUserServicesRequestParser createForgotPasswordApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:ForgotPassword]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dictParams withURLKey:ForgotPasswordURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ForgotPassword]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) forgotPasswordRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateForgotPasswordResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Forgot Password Response
    if ([result isKindOfClass:[WiSeForgotPasswordAPIResponse class ]]) { // When model response class exsit
        
        WiSeForgotPasswordAPIResponse * response = (WiSeForgotPasswordAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getForgotPasswordErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SaveAppInfoErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

#pragma mark --- Logout ---

- (WiSeCloudAPIRequestRegisteredDetails *) logoutApiWithRequest : (WiSeLogoutAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valids
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];

        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:Logout]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];

        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:nil withURLKey:LogoutURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:Logout]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (WiSeCloudAPIRequestRegisteredDetails *) logoutApiWithRequest : (WiSeLogoutAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valids
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:Logout]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:nil withURLKey:LogoutURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:Logout]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) logoutRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateLogoutResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Logout Response
    if ([result isKindOfClass:[WiSeLogoutAPIResponse class ]]) { // When model response class exsit
        
        WiSeLogoutAPIResponse * response = (WiSeLogoutAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getLogoutFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:LogoutErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

#pragma mark --- List Roles ---

- (WiSeCloudAPIRequestRegisteredDetails *) listRolesApiWithRequest: (WiSeListRolesAPIRequest *) request WithHeader : (WiSeAPIHeader *) header  {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:ListRoles]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];

        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:ListRolesURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ListRoles];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) listRolesRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateListRolesResponse:responseInfo WithRequestDetails:requestInfo]; // Validate List Role Response
    if ([result isKindOfClass:[WiSeListRolesAPIResponse class ]]) { // When model response class exsit
        
        WiSeListRolesAPIResponse * response = (WiSeListRolesAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getListRolesFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:LogoutErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


#pragma mark --- Update User Profile ---

- (WiSeCloudAPIRequestRegisteredDetails *) updateUserProfileApiWithRequest : (WiSeUpdateUserProfileAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valids
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token];
        NSDictionary * dict                       = [WiSeUserServicesRequestParser createUpdateUserProfileApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:UpdateUserProfile]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:UpdateUserProfileURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:UpdateUserProfile]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) updateUserProfileRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateUserProfileUpdateResponse:responseInfo WithRequestDetails:requestInfo]; // Validate UpdateUser Profile Response
    if ([result isKindOfClass:[WiSeUpdateUserProfileAPIResponse class ]]) { // When model response class exsit
        
        WiSeUpdateUserProfileAPIResponse * response = (WiSeUpdateUserProfileAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getUserProfileUpdateFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateUserProfileErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

#pragma mark --- Update Device Token ---

- (WiSeCloudAPIRequestRegisteredDetails *) updateDeviceTokenApiWithRequest : (WiSeUpdateDeviceTokenAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valids
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSDictionary * dict                       = [WiSeUserServicesRequestParser createUpdateDeviceTokenApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:UpdateDeviceToken]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:UpdateDeviceTokenURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:UpdateDeviceToken]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) updateDeviceTokenRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateUserProfileUpdateResponse:responseInfo WithRequestDetails:requestInfo]; // Validate UpdateUser Profile Response
    if ([result isKindOfClass:[WiSeUpdateDeviceTokenAPIResponse class ]]) { // When model response class exsit
        
        WiSeUpdateDeviceTokenAPIResponse * response = (WiSeUpdateDeviceTokenAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getUpdateDeviceTokenFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateDeviceTokenErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark - List Users

- (WiSeCloudAPIRequestRegisteredDetails *) getUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];

        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:ListUsers]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * queryParams                     = [NSString stringWithFormat:@"?orgId=%d&user=%d&status=%d&start=%f&limit=%d",header.subOrganizationId,request.userType,request.userStatus,request.start,request.limit];
        NSString * strURL                          = [NSString stringWithFormat:@"%@%@",baseURL,queryParams];
        
        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:ListUsersURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ListUsers]; // Creating Cloud Request Object
        
        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getUserRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateListUsersResponse:responseInfo WithRequestDetails:requestInfo]; // Validate List User Response
    if ([result isKindOfClass:[WiSeCloudUserAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudUserAPIResponse * response = (WiSeCloudUserAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getListUsersFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:ListUsersErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark - Delete User

- (WiSeCloudAPIRequestRegisteredDetails *) deleteUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteUser]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
        NSString * strURL                         = [NSString stringWithFormat:@"%@%d",baseURL,request.userCloudId];

        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:DeleteUsersURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:DeleteUser];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) deleteUserRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeUserServicesResponseValidater validateDeleteUsersResponse:responseInfo WithRequestDetails:requestInfo]; // Validate List User Response
    if ([result isKindOfClass:[WiSeCloudUserAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudUserAPIResponse * response = (WiSeCloudUserAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeUserServicesResponseValidater getDeleteUsersFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteUserErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case SaveAppInfo:
            [self getSaveAppInfoRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case Login:
            [self getLoginRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case SignUp:
            [self getSignUpRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case AddUser:
            [self getAddUserRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case EditUser:
            [self getEditUserRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case ChangePassword:
            [self getChangePasswordRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case ForgotPassword:
            [self forgotPasswordRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case Logout:
            [self logoutRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case UpdateUserProfile:
            [self updateUserProfileRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case UpdateDeviceToken:
            [self updateDeviceTokenRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case ListRoles:
            [self listRolesRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case ListUsers:
            [self getUserRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteUser:
            [self deleteUserRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}



@end
