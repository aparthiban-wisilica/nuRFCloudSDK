//
//  WiSeMessageServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeMessageServices.h"
#import "WiSeNetworkUtil.h"
#import "WiSeMessageServicesRequestParser.h"
#import "WiSeMessageServicesResponseParser.h"
#import "WiSeMessageServicesResponseValidater.h"

#import "WiSeGetMessageHistoryAPIRequest.h"
#import "WiSeGetMessageHistoryAPIResponse.h"
#import "WiSeResetMessageQueueAPIRequest.h"
#import "WiSeResetMessageQueueAPIResponse.h"
#import "WiSeMessageFetchAPIRequest.h"
#import "WiSeMessageFetchAPIResponse.h"
#import "WiSeMessageStatusUpdateAPIRequest.h"
#import "WiSeMessageStatusUpdateAPIResponse.h"
#import "WiSeNotificationStatusUpdateAPIRequest.h"
#import "WiSeNotificationStatusUpdateAPIResponse.h"

#import "WiSeAPIHeader.h"

#import "WiSeCloudTrackingAlertAPIRequest.h"
#import "WiSeCloudTrackingAlertAPIResponse.h"

#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>


#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import "WiSeCloudAPIURLInfo.h"


@interface WiSeMessageServices () <WiSeCloudApiRequestDelegate>


@end


@implementation WiSeMessageServices {
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

# pragma mark --- Get Message History ---

- (WiSeCloudAPIRequestRegisteredDetails *) getMessageHistoryApiWithRequest : (WiSeGetMessageHistoryAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        // Header Params
        NSString * token                           = request.token?request.token:@"";
        NSString * strPhoneCloudId                 = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart                        = [NSString stringWithFormat:@"%d",request.start];
        NSString * strEnd                          = [NSString stringWithFormat:@"%d",request.limit];
//        NSString * strMessageType  = [NSString stringWithFormat:@"%d",request.messageType];

        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];

        WiSeCloudAPIURLInfo * urlInfo              = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetMessageHistory]];
        NSString * baseURL                         = urlInfo.apiURL;
        NSString * httpMethod                      = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                          = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetMessageHistoryURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetMessageHistory];// Creating Cloud Request Object

        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getMessageHistoryRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeMessageServicesResponseValidater validateGetMessageHistoryResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit Device Response
    if ([result isKindOfClass:[WiSeGetMessageHistoryAPIResponse class ]]) { // When model response class exsit
        
        WiSeGetMessageHistoryAPIResponse * response = (WiSeGetMessageHistoryAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeMessageServicesResponseValidater getGetMessageHistoryFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetMessageHistoryErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


# pragma mark --- Reset Message Queue ---

- (WiSeCloudAPIRequestRegisteredDetails *) resetMessageQueueApiWithRequest : (WiSeResetMessageQueueAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:ResetMessageQueue]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:ResetMessageQueueURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ResetMessageQueue]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (WiSeCloudAPIRequestRegisteredDetails *) resetMessageQueueApiWithRequest : (WiSeResetMessageQueueAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:ResetMessageQueue]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:ResetMessageQueueURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ResetMessageQueue]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) resetMessageQueueRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeMessageServicesResponseValidater validateResetMessageQueueResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit Device Response
    if ([result isKindOfClass:[WiSeResetMessageQueueAPIResponse class]]) { // When model response class exsit
        
        WiSeResetMessageQueueAPIResponse * response = (WiSeResetMessageQueueAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeMessageServicesResponseValidater getGetMessageHistoryFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetMessageHistoryErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


# pragma mark --- Message Fetch ---

- (WiSeCloudAPIRequestRegisteredDetails *) messageFetchApiWithRequest : (WiSeMessageFetchAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        // Header Params
        NSString * token = request.token?request.token:@"";
        NSString * msgId;
        if (request.messageId == 0) {
            msgId = @"msg";
        }else {
            msgId = [NSString stringWithFormat:@"%d",request.messageId];
        }
        
        NSString * strPhoneCloudId                 = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strMessageType                  = [NSString stringWithFormat:@"%d",request.messageType];
        NSString * strStart                        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd                          = [NSString stringWithFormat:@"%d",request.limit];


        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:msgId forKey:MESSAGE_ID];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];

        int apiId                                  = 0;
        
        if (request.messageType == OperationMessages) {
            apiId = OperationMessagesFetch;
        }else if (request.messageType == OtherMessages) {
            apiId = OtherMessagesFetch;
        }
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:apiId]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                         = [NSString stringWithFormat:@"%@%@",baseURL,strMessageType];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:MessageFetchURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
        
    }
    return regDetails;

}

- (void) messageFetchRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeMessageServicesResponseValidater validateMessageFetchAPIResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit Device Response
    if ([result isKindOfClass:[WiSeMessageFetchAPIResponse class]]) { // When model response class exsit
        
        WiSeMessageFetchAPIResponse * response = (WiSeMessageFetchAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeMessageServicesResponseValidater getMessageFetchAPIFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:MessageFetchErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Message Status Update ---

- (WiSeCloudAPIRequestRegisteredDetails *) messageStatusUpdateApiWithRequest : (WiSeMessageStatusUpdateAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;          
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSDictionary * dict                 = [WiSeMessageServicesRequestParser createMessageStatusUpdateApiParameters:request];

        wiseNetworkManager                  = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        int apiId = 0;
        
        if (request.messageType == OperationMessages) {
            apiId = OperationMessagesUpdate;
        }else if (request.messageType == OtherMessages) {
            apiId = OtherMessagesUpdate;
        }
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:apiId]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@%d",baseURL,request.messageType];


        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:MessageStatusUpdateURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
        
        regDetails = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (WiSeCloudAPIRequestRegisteredDetails *) messageStatusUpdateApiWithRequest : (WiSeMessageStatusUpdateAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * dict                 = [WiSeMessageServicesRequestParser createMessageStatusUpdateApiParameters:request];
        
        wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];

        int apiId = 0;
        
        if (request.messageType == OperationMessages) {
            apiId = OperationMessagesUpdate;
        }else if (request.messageType == OtherMessages) {
            apiId = OtherMessagesUpdate;
        }
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:apiId]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@%d",baseURL,request.messageType];
        
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:MessageStatusUpdateURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) messageStuatsUpdateRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeMessageServicesResponseValidater validateMessageStatusUpdateAPIResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Message Status Update Response
    if ([result isKindOfClass:[WiSeMessageStatusUpdateAPIResponse class]]) { // When model response class exsit
        
        WiSeMessageStatusUpdateAPIResponse * response = (WiSeMessageStatusUpdateAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeMessageServicesResponseValidater getMessageStatusUpdateAPIFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:MessageStatusUpdateErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


# pragma mark --- Notification Status Update ---

- (WiSeCloudAPIRequestRegisteredDetails *) notificationStatusUpdateApiWithRequest : (WiSeNotificationStatusUpdateAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSDictionary * dict                       = [WiSeMessageServicesRequestParser createNotificationStatusUpdateApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:NotificationStatusUpdate]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@%ld",baseURL,(long)request.notificationId];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:NotificationStatusUpdateURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:NotificationStatusUpdate]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (WiSeCloudAPIRequestRegisteredDetails *) notificationUpdateApiWithRequest : (WiSeNotificationStatusUpdateAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * dict                       = [WiSeMessageServicesRequestParser createNotificationUpdateApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:NotificationStatusUpdate]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@%ld",baseURL,(long)request.notificationId];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:NotificationStatusUpdateURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:NotificationStatusUpdate]; // Creating Cloud Request Object
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) notificationStuatsUpdateRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeMessageServicesResponseValidater validateNotificationStatusUpdateAPIResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Message Status Update Response
    if ([result isKindOfClass:[WiSeNotificationStatusUpdateAPIResponse class]]) { // When model response class exsit
        
        WiSeNotificationStatusUpdateAPIResponse * response = (WiSeNotificationStatusUpdateAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else {
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeMessageServicesResponseValidater getNotificationStatusUpdateAPIFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:NotificaitonStatusUpdateErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Get Tracking Alerts ---

- (WiSeCloudAPIRequestRegisteredDetails *) getTrackingAlertsApiWithRequest : (WiSeCloudTrackingAlertAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid

        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];

        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetTrackingAlerts]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * queryParams                    = [NSString stringWithFormat:@"?start=%f&limit=%d&type=%d&infantId=%d&orgId=%d",request.start,request.limit,request.alertType,request.infantCloudId,header.subOrganizationId];
        NSString * strURL                         = [NSString stringWithFormat:@"%@%@",baseURL,queryParams];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetTrackingAlertURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetTrackingAlerts];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
        
    }
    return regDetails;
}

- (void) getTrackingAlertsRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeMessageServicesResponseValidater validateGetTrackingAlertsAPIResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Message Status Update Response
    if ([result isKindOfClass:[WiSeCloudTrackingAlertAPIResponse class]]) { // When model response class exsit
        
        WiSeCloudTrackingAlertAPIResponse * response = (WiSeCloudTrackingAlertAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else {
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeMessageServicesResponseValidater getGetTrackingAlertsAPIFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetTrackingAlertsErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case GetMessageHistory:
            [self getMessageHistoryRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case ResetMessageQueue:
            [self resetMessageQueueRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case OtherMessagesFetch:
            [self messageFetchRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case OperationMessagesUpdate:
            [self messageStuatsUpdateRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case OtherMessagesUpdate:
            [self messageStuatsUpdateRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case NotificationStatusUpdate:
            [self notificationStuatsUpdateRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case OperationMessagesFetch:
            [self messageFetchRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetTrackingAlerts:
            [self getTrackingAlertsRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}


@end
