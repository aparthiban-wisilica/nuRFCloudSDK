//
//  WiSeSettingsServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSettingsServices.h"
#import "WiSeNetworkUtil.h"
#import "WiSeSettingsServicesRequestParser.h"
#import "WiSeSettingsServicesResponseParser.h"
#import "WiSeSettingsServicesResponseValidater.h"

#import "WiSeBridgeSet_RemoveAPIRequest.h"
#import "WiSeBridgeSet_RemoveAPIResponse.h"

#import "WiSeCloudSubscriptionAPIRequest.h"
#import "WiSeCloudSubscriptionAPIResponse.h"

#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import "WiSeAPIHeader.h"
#import "WiSeCloudAPIURLInfo.h"
#import "WiSeHealthCheckAPIRequest.h"


@interface WiSeSettingsServices () <WiSeCloudApiRequestDelegate>


@end


@implementation WiSeSettingsServices {
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

#pragma mark - Bridge Set and Remove

- (WiSeCloudAPIRequestRegisteredDetails *) bridgeSet_RemoveApiWithRequest : (WiSeBridgeSet_RemoveAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSDictionary * dict                       = [WiSeSettingsServicesRequestParser createBridgeSet_RemoveApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:BridgeSet_Remove]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:BridgeSet_RemoveURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:BridgeSet_Remove]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) bridgeSet_RemoveRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSettingsServicesResponseValidater validateBridgeSet_RemoveApiResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeBridgeSet_RemoveAPIResponse class ]]) { // When model response class exsit
        
        WiSeBridgeSet_RemoveAPIResponse * response = (WiSeBridgeSet_RemoveAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSettingsServicesResponseValidater getBridgeSet_RemoveApiFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:BridgeSet_RemoveErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Create/Update Subscription ---

- (WiSeCloudAPIRequestRegisteredDetails *) createUpdateSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSDictionary * dict                       = [WiSeSettingsServicesRequestParser createCreateUpdateSubscriptionApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:CreateUpdateSubscription]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:CreateUpdateSubscriptionURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:CreateUpdateSubscription];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
    
}

- (WiSeCloudAPIRequestRegisteredDetails *) createUpdateSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * dict                       = [WiSeSettingsServicesRequestParser createCreateUpdateSubscriptionApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:CreateUpdateSubscription]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:CreateUpdateSubscriptionURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:CreateUpdateSubscription];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) createUpdateSubscriptionRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSettingsServicesResponseValidater validateCreateUpdateSubscriptionResponse:responseInfo WithRequestDetails:requestInfo]; // Validate WiSeCreateUpdateSubscriptionAPIResponse
    if ([result isKindOfClass:[WiSeCloudSubscriptionAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudSubscriptionAPIResponse * response = (WiSeCloudSubscriptionAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSettingsServicesResponseValidater getCreateUpdateSubscriptionFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateRemoteOperationFeedback];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Get Subscription ---

- (WiSeCloudAPIRequestRegisteredDetails *) getSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetSubcription]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:nil withURLKey:GetSubscriptionURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetSubcription];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (WiSeCloudAPIRequestRegisteredDetails *) getSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetSubcription]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:nil withURLKey:GetSubscriptionURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetSubcription];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getSubscriptionRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSettingsServicesResponseValidater validateGetSubscriptionResponse:responseInfo WithRequestDetails:requestInfo]; // Validate WiSeCreateUpdateSubscriptionAPIResponse
    if ([result isKindOfClass:[WiSeCloudSubscriptionAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudSubscriptionAPIResponse * response = (WiSeCloudSubscriptionAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSettingsServicesResponseValidater getGetSubscriptionFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetSubcriptionErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Health Check ---

- (WiSeCloudAPIRequestRegisteredDetails *) healthCheckApiWithRequest : (WiSeHealthCheckAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:HealthCheck]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        NSDictionary * dict = [WiSeSettingsServicesRequestParser createHealthCheckApiParameters:request];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:HealthCheckURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:HealthCheck];// Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) healthCheckRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSettingsServicesResponseValidater validateHealthCheckResponse:responseInfo WithRequestDetails:requestInfo]; // Validate WiSeCreateUpdateSubscriptionAPIResponse
    if ([result isKindOfClass:[WiSeCloudSubscriptionAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudSubscriptionAPIResponse * response = (WiSeCloudSubscriptionAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSettingsServicesResponseValidater getHealthCheckFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetSubcriptionErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case BridgeSet_Remove:
            [self bridgeSet_RemoveRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case CreateUpdateSubscription:
            [self createUpdateSubscriptionRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetSubcription:
            [self getSubscriptionRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case HealthCheck:
            [self healthCheckRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;

        default:
            break;
    }
}




@end
