//
//  WiSeAlertServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAlertServices.h"
#import "WiSeAlertServicesRequestParser.h"
#import "WiSeAlertServicesResponseParser.h"
#import "WiSeAlertServicesResponseValidater.h"
#import "WiSeParsedAPIResponse.h"
#import <WiSeAppLog/WiSeLogManager.h>

#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>

#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

#import "WiSeAPIHeader.h"

#import "WiSeCloudSnoozeSettingRequest.h"
#import "WiSeCloudSnoozeSettingResponse.h"

#import "WiSeCheckOutRequest.h"
#import "WiSeCheckOutResponse.h"

#import "WiSeSelfAssignResetAPIRequest.h"
#import "WiSeSelfAssignResetAPIResponse.h"

#import "WiSeCloudAPIURLInfo.h"

@interface WiSeAlertServices () <WiSeCloudApiRequestDelegate>

@end

@implementation WiSeAlertServices {
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

#pragma mark - Set/Update Snooze Time

- (WiSeCloudAPIRequestRegisteredDetails *) setUpdateSnoozeTimeApiWithRequest : (WiSeCloudSnoozeSettingRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeAlertServicesRequestParser createSetUpdateSnoozeTimeApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:SetUpdateSnoozeTiming]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:SetUpdateSnoozeTimingURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:SetUpdateSnoozeTiming]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) setUpdateSnoozeTimeRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeAlertServicesResponseValidater validateSetUpdateSnoozeTimingResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Register App Response
    if ([result isKindOfClass:[WiSeCloudSnoozeSettingResponse class ]]) { // When model response class exsit
        
        WiSeCloudSnoozeSettingResponse * response = (WiSeCloudSnoozeSettingResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeAlertServicesResponseValidater getSetUpdateSnoozeTimingFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SetUpdateSnoozeTimingErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

#pragma mark - Enable/Disable CheckOut API Time

- (WiSeCloudAPIRequestRegisteredDetails *) enableDisableCheckOutApiWithRequest : (WiSeCheckOutRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * dict                       = [WiSeAlertServicesRequestParser createEnableDisableCheckOutApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:CheckOut]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@%d",baseURL,request.tagId];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:EnableDisableCheckOutURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:CheckOut]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) enableDisableCheckOutRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeAlertServicesResponseValidater validateEnableDisableCheckOutResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCheckOutResponse class ]]) { // When model response class exsit
        
        WiSeCheckOutResponse * response = (WiSeCheckOutResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeAlertServicesResponseValidater getEnableDisableCheckOutFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:CheckOutErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

#pragma mark - Self Assign-Assign Reset API

- (WiSeCloudAPIRequestRegisteredDetails *) selfAssignResetApiWithRequest : (WiSeSelfAssignResetAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * dict                       = [WiSeAlertServicesRequestParser createSelfAssignResetApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:SelfAssignReset]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:SelfAssignResetURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:SelfAssignReset]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
 
}

- (void) selfAssignResetRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeAlertServicesResponseValidater validateSelfAssignResetResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeSelfAssignResetAPIResponse class ]]) { // When model response class exsit
        
        WiSeSelfAssignResetAPIResponse * response = (WiSeSelfAssignResetAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeAlertServicesResponseValidater getSelfAssignResetFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SelfAssignResetErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case SetUpdateSnoozeTiming:
            [self setUpdateSnoozeTimeRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case CheckOut:
            [self enableDisableCheckOutRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case SelfAssignReset:
            [self selfAssignResetRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}

@end
