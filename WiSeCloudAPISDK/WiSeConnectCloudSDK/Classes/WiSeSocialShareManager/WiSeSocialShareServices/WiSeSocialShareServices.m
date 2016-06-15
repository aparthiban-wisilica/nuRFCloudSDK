//
//  WiSeSocialShareServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSocialShareServices.h"
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import "WiSeNetworkUtil.h"
#import "WiSeCloudSocialShareRequest.h"
#import "WiSeCloudSocialShareResponse.h"

#import "WiSeSocialShareServicesRequestParser.h"
#import "WiSeSocialShareServicesResponseParser.h"
#import "WiSeSocialShareServicesResponseValidater.h"
#import "WiSeCloudAPIURLInfo.h"

@interface WiSeSocialShareServices () <WiSeCloudApiRequestDelegate>


@end

@implementation WiSeSocialShareServices {
    WiSeNetworkManager * wiseNetworkManager;
}


# pragma mark --- Trigger Call back ---

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

#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {

}

# pragma mark --- Add Friends                     ---

- (WiSeCloudAPIRequestRegisteredDetails *) addFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeSocialShareServicesRequestParser createAddFriendsApiParameterWithRequest:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddFriends]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddFriendURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddFriends]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;    
}

- (void) addFriendsRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSocialShareServicesResponseValidater validateAddFriendsResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudSocialShareResponse class ]]) { // When model response class exsit
        
        WiSeCloudSocialShareResponse * response = (WiSeCloudSocialShareResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSocialShareServicesResponseValidater getAddFriendsFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconDataLogErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Get Friends                     ---

- (WiSeCloudAPIRequestRegisteredDetails *) getFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetFriends]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetFriend_UsersURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetFriends]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getFriendsRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSocialShareServicesResponseValidater validateGetFriendsResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudSocialShareResponse class ]]) { // When model response class exsit
        
        WiSeCloudSocialShareResponse * response = (WiSeCloudSocialShareResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSocialShareServicesResponseValidater getGetFriendsFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconDataLogErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Delete Friends                  ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeSocialShareServicesRequestParser createDeleteFriendsApiParameterWithRequest:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteFriend]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteFriendURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:DeleteFriend]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) deleteFriendsRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSocialShareServicesResponseValidater validateDeleteFriendsResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudSocialShareResponse class ]]) { // When model response class exsit
        
        WiSeCloudSocialShareResponse * response = (WiSeCloudSocialShareResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSocialShareServicesResponseValidater getDeleteFriendsFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconDataLogErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Friend Request Accept OR Reject ---

- (WiSeCloudAPIRequestRegisteredDetails *) acceptOrRejectFriendRequestApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeSocialShareServicesRequestParser createAcceptOrRejectFriendRequestApiParameterWithRequest:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:FriendRequestAccept_Reject]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:FriendsRequestAccept_RejectURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:FriendRequestAccept_Reject]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) acceptOrRejectFriendRequestRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSocialShareServicesResponseValidater validateAcceptOrRejectFriendRequestResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudSocialShareResponse class ]]) { // When model response class exsit
        
        WiSeCloudSocialShareResponse * response = (WiSeCloudSocialShareResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSocialShareServicesResponseValidater getAcceptOrRejectFriendRequestFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconDataLogErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Get Shared Devices              ---

- (WiSeCloudAPIRequestRegisteredDetails *) getSharedDevicesApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetSharedDevices]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetSharedDevicesURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetSharedDevices]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getSharedDevicesRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSocialShareServicesResponseValidater validateGetSharedDevicesResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudSocialShareResponse class ]]) { // When model response class exsit
        
        WiSeCloudSocialShareResponse * response = (WiSeCloudSocialShareResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSocialShareServicesResponseValidater getGetSharedDevicesFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconDataLogErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Get Shared Groups               ---

- (WiSeCloudAPIRequestRegisteredDetails *) getSharedGroupsApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetSharedGroups]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetSharedGroupsURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetSharedGroups]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getSharedGroupsRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSocialShareServicesResponseValidater validateGetSharedGroupsResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudSocialShareResponse class ]]) { // When model response class exsit
        
        WiSeCloudSocialShareResponse * response = (WiSeCloudSocialShareResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSocialShareServicesResponseValidater getGetSharedGroupsFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconDataLogErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Share Accept OR Reject          ---

- (WiSeCloudAPIRequestRegisteredDetails *) acceptOrRejectShareRequestApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeSocialShareServicesRequestParser createAcceptOrRejectShareRequestApiParameterWithRequest:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:ShareAccept_Reject]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:ShareAccept_RejectURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ShareAccept_Reject]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) acceptOrRejectShareRequestRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSocialShareServicesResponseValidater validateAcceptOrRejectShareRequestResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudSocialShareResponse class ]]) { // When model response class exsit
        
        WiSeCloudSocialShareResponse * response = (WiSeCloudSocialShareResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSocialShareServicesResponseValidater getAcceptOrRejectShareRequestFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconDataLogErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Share Create                    ---

- (WiSeCloudAPIRequestRegisteredDetails *) createShareApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeSocialShareServicesRequestParser createCreateShareApiParameterWithRequest:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:CreateShare]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:CreateShareURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:CreateShare]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) createShareRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSocialShareServicesResponseValidater validateCreateShareResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudSocialShareResponse class ]]) { // When model response class exsit
        
        WiSeCloudSocialShareResponse * response = (WiSeCloudSocialShareResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSocialShareServicesResponseValidater getCreateShareFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconDataLogErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


@end
