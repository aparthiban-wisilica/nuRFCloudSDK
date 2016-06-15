//
//  WiSeScheduleServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeScheduleServices.h"
#import "WiSeScheduleServicesRequestParser.h"
#import "WiSeScheduleServicesResponseParser.h"
#import "WiSeScheduleServicesResponseValidator.h"

#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import "WiSeAPIHeader.h"
#import "WiSeCloudAPIURLInfo.h"

#import "WiSeCloudScheduleRequest.h"
#import "WiSeCloudScheduleResponse.h"


@interface WiSeScheduleServices () <WiSeCloudApiRequestDelegate>


@end

@implementation WiSeScheduleServices {
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

# pragma mark --- Add Schedule ---

- (WiSeCloudAPIRequestRegisteredDetails *) addScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeScheduleServicesRequestParser createAddScheduleApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddSchedule]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddScheduleURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddSchedule]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) addScheduleRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeScheduleServicesResponseValidator validateAddScheduleResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudScheduleResponse class ]]) { // When model response class exsit
        
        WiSeCloudScheduleResponse * response = (WiSeCloudScheduleResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeScheduleServicesResponseValidator getAddScheduleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddScheduleErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Edit Schedule ---

- (WiSeCloudAPIRequestRegisteredDetails *) editScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeScheduleServicesRequestParser createEditScheduleApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditSchedule]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:EditScheduleURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditSchedule]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) editScheduleRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeScheduleServicesResponseValidator validateEditScheduleResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudScheduleResponse class ]]) { // When model response class exsit
        
        WiSeCloudScheduleResponse * response = (WiSeCloudScheduleResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeScheduleServicesResponseValidator getEditScheduleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditScheduleErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Delete Schedule ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
//    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
//    
//    if (!regDetails) { // When Reg is nil , that means request is valid
//        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
//        NSArray * arr                             = [WiSeScheduleServicesRequestParser createDeleteScheduleApiParameters:request];
//        NSString * baseURL;
//        NSString * strURL;
//        NSString * strMethod;
//        int apiId = 0;
//        if (request.zoneList && request.zoneList.count) { // Delete List of Zones
//            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteZoneInBulk]];
//            baseURL                       = urlInfo.apiURL;
//            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
//            strURL                        = [NSString stringWithFormat:@"%@",baseURL];
//            apiId                         = DeleteZoneInBulk;
//        }else {
//            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteZone]];
//            baseURL                       = urlInfo.apiURL;
//            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
//            NSString * strZoneId          = [NSString stringWithFormat:@"%d",request.zoneCloudId];// Delete A Zone
//            strURL                        = [NSString stringWithFormat:@"%@%@",baseURL,strZoneId];
//            apiId                         = DeleteZone;
//        }
//        
//        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
//        
//        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:strMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteZoneURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
//        
//        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
//    }
    return regDetails;

}

- (void) deleteScheduleRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeScheduleServicesResponseValidator validateDeleteScheduleResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudScheduleResponse class ]]) { // When model response class exsit
        
        WiSeCloudScheduleResponse * response = (WiSeCloudScheduleResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeScheduleServicesResponseValidator getDeleteScheduleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteScheduleErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Get Schedule ---

- (WiSeCloudAPIRequestRegisteredDetails *) getScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        NSMutableDictionary * objRequestBodyParams = nil;
        
        if (header) {
            header.userToken           = header.userToken?header.userToken:@"";
            header.acceptValue         = header.acceptValue?header.acceptValue:AcceptValue;
            header.contentTypeValue    = header.contentTypeValue?header.contentTypeValue:ContentTypeValue;
            NSString * strPhoneCloudId = [NSString stringWithFormat:@"%d",header.phoneCloudId];
            NSString * strOrgCloudId   = [NSString stringWithFormat:@"%d",header.organizationId];
//            NSString * strStart        = [NSString stringWithFormat:@"%f",request.start];
//            NSString * strEnd          = [NSString stringWithFormat:@"%d",request.limit];
            
            objRequestBodyParams       = [[NSMutableDictionary alloc] init];
            [objRequestBodyParams setValue:header.acceptValue forKey:Accept];
            [objRequestBodyParams setValue:header.contentTypeValue forKey:ContentType];
            [objRequestBodyParams setValue:header.userToken forKey:TOKEN];
            [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
            [objRequestBodyParams setValue:strOrgCloudId forKey:ORG_ID];
//            [objRequestBodyParams setValue:strStart forKey:START];
//            [objRequestBodyParams setValue:strEnd forKey:LIMIT];
        }
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetSchedule]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetScheduleURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetSchedule]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getScheduleRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeScheduleServicesResponseValidator validateGetScheduleResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudScheduleResponse class ]]) { // When model response class exsit
        
        WiSeCloudScheduleResponse * response = (WiSeCloudScheduleResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeScheduleServicesResponseValidator getGetScheduleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetScheduleErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case AddSchedule:
            [self addScheduleRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case EditSchedule:
            [self editScheduleRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteSchedule:
            [self deleteScheduleRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetSchedule:
            [self getScheduleRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}


@end
