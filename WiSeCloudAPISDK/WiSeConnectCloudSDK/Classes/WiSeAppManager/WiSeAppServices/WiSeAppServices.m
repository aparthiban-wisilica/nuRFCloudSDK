//
//  WiSeAppServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAppServices.h"
#import "WiSeAppServicesRequestParser.h"
#import "WiSeAppServicesResponseParser.h"
#import "WiSeAppServicesResponseValidater.h"
#import "WiSeParsedAPIResponse.h"

#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>

#import "WiSeRegisterAppAPIRequest.h"
#import "WiSeRegisterAppInfoAPIResponse.h"
#import "WiSeAPIHeader.h"
#import "WiSeCloudAPIURLInfo.h"

@interface WiSeAppServices () <WiSeCloudApiRequestDelegate>

@end

@implementation WiSeAppServices {
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

#pragma mark - Register APP Info

- (WiSeCloudAPIRequestRegisteredDetails *)registerAppAPIWithRequest:(WiSeRegisterAppAPIRequest *)request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequest];
        NSDictionary * dictParams                 = [WiSeAppServicesRequestParser createSaveAPPAPIJson:request];
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

- (WiSeCloudAPIRequestRegisteredDetails *) registerAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * dictParams                 = [WiSeAppServicesRequestParser createSaveAPPAPIJson:request];
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
    
    id result = [WiSeAppServicesResponseValidater validateRegisterAppResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Register App Response
    if ([result isKindOfClass:[WiSeRegisterAppInfoAPIResponse class ]]) { // When model response class exsit
        
        WiSeRegisterAppInfoAPIResponse * response = (WiSeRegisterAppInfoAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeAppServicesResponseValidater getSaveAPPInfoErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SaveAppInfoErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

#pragma mark - Update Register APP Info

- (WiSeCloudAPIRequestRegisteredDetails *) updateRegisterAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSDictionary * dictParams                 = [WiSeAppServicesRequestParser createUpdateSaveAPPAPIJson:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:UpdateSaveAppInfo]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dictParams withURLKey:UpdateSaveAppInfoURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:UpdateSaveAppInfo]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (WiSeCloudAPIRequestRegisteredDetails *) updateRegisterAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * dictParams                 = [WiSeAppServicesRequestParser createUpdateSaveAPPAPIJson:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:UpdateSaveAppInfo]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:dictParams withURLKey:UpdateSaveAppInfoURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:UpdateSaveAppInfo]; // Creating Cloud Request Object

        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getUpdateSaveAppInfoRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeAppServicesResponseValidater validateUpdateRegisterAppResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Update Register App Response
    if ([result isKindOfClass:[WiSeRegisterAppInfoAPIResponse class ]]) { // When model response class exsit
        
        WiSeRegisterAppInfoAPIResponse * response = (WiSeRegisterAppInfoAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeAppServicesResponseValidater getUpdateSaveAPPInfoErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateSaveAppInfoErrorCode];
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
        case UpdateSaveAppInfo:
            [self getUpdateSaveAppInfoRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}

//NSString *data = [NSString stringWithFormat:@"%@",responseInfo.responseData];
//NSLog(@"\n\n%@",data);


@end
