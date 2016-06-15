//
//  WiSeOperationServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 04/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeOperationServices.h"
#import "WiSeNetworkUtil.h"
#import "WiSeOperationServicesRequestParser.h"
#import "WiSeOperationServicesResponseParser.h"
#import "WiSeOperationServicesResponseValidater.h"

#import "WiSeUpdateDirectOperationStatusAPIRequest.h"
#import "WiSeUpdateDirectOperationStatusAPIResponse.h"
#import "WiSeRequestForRemoteOperationAPIRequest.h"
#import "WiSeRequestForRemoteOperationAPIResponse.h"
#import "WiSeUpdateRemoteOperationFeedbackAPIRequest.h"
#import "WiSeUpdateRemoteOperationFeedbackAPIResponse.h"

#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>

#import "WiSeCloudAPIURLInfo.h"

@interface WiSeOperationServices () <WiSeCloudApiRequestDelegate>

@end

@implementation WiSeOperationServices {
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

# pragma mark --- Update Direct Operation Status ---

- (WiSeCloudAPIRequestRegisteredDetails *) updateDirectOperationStautsApiWithRequest : (WiSeUpdateDirectOperationStatusAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSDictionary * dict                       = [WiSeOperationServicesRequestParser createUpdateDirectOperationStatusApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:UpdateDirectOperationStatus]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:UpdateDirectOperationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:UpdateDirectOperationStatus]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) updateDirectOperationStautsRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeOperationServicesResponseValidater validateUpdateDirectOperationStatusResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeUpdateDirectOperationStatusAPIResponse class ]]) { // When model response class exsit
        
        WiSeUpdateDirectOperationStatusAPIResponse * response = (WiSeUpdateDirectOperationStatusAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeOperationServicesResponseValidater getUpdateDirectOperationStatusFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateDirectOperationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


# pragma mark --- Request For Remote Operation ---

- (WiSeCloudAPIRequestRegisteredDetails *) requestForRemoteOperationApiWithRequest : (WiSeRequestForRemoteOperationAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSDictionary * dict                       = [WiSeOperationServicesRequestParser createRequestForRemoteOperationApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:RequestForRemoteOperation]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:RequestForRemoteOperationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:RequestForRemoteOperation];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) requestForRemoteOperationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeOperationServicesResponseValidater validateRequestForRemoteOperationResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeRequestForRemoteOperationAPIResponse class ]]) { // When model response class exsit
        
        WiSeRequestForRemoteOperationAPIResponse * response = (WiSeRequestForRemoteOperationAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeOperationServicesResponseValidater getUpdateRequestForRemoteOperationFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:RequestForRemoteOperationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}



# pragma mark --- Update Remote Operation Feedback ---

- (WiSeCloudAPIRequestRegisteredDetails *) updateRemoteOperationFeedbackApiWithRequest : (WiSeUpdateRemoteOperationFeedbackAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSMutableArray * arr                      = [WiSeOperationServicesRequestParser createUpdateRemoteOperationFeedbackApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:UpdateRemoteOperationFeedback]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:UpdateRemoteOperationFeedbackURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:UpdateRemoteOperationFeedback]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) updateRemoteOperationFeedbackRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeOperationServicesResponseValidater validateUpdateRemoteOperationFeedbackResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeUpdateRemoteOperationFeedbackAPIResponse class ]]) { // When model response class exsit
        
        WiSeUpdateRemoteOperationFeedbackAPIResponse * response = (WiSeUpdateRemoteOperationFeedbackAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeOperationServicesResponseValidater getUpdateUpdateRemoteOperationFeedbackFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateRemoteOperationFeedbackErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case RequestForRemoteOperation:
            [self requestForRemoteOperationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case UpdateDirectOperationStatus:
            [self updateDirectOperationStautsRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case UpdateRemoteOperationFeedback:
            [self updateRemoteOperationFeedbackRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}

@end
