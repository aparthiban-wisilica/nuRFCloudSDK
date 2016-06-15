//
//  WiSeMapSettingServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeMapSettingServices.h"
#import "WiSeMapSettingServicesRequestParser.h"
#import "WiSeMapSettingServicesResponseParser.h"
#import "WiSeMapSettingServicesResponseValidater.h"

#import "WiSeCloudMapAPIRequest.h"
#import "WiSeCloudMapAPIResponse.h"
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import "WiSeAPIHeader.h"
#import "WiSeCloudAPIURLInfo.h"

@interface WiSeMapSettingServices () <WiSeCloudApiRequestDelegate>


@end

@implementation WiSeMapSettingServices {
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

#pragma mark --- Get Map Settings ---

- (WiSeCloudAPIRequestRegisteredDetails *) getMapSettingsApiWithRequest : (WiSeCloudMapAPIRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetMapSettings]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetMapSettingsURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetMapSettings]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getMapSettingsRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeMapSettingServicesResponseValidater validateGetMapSettingsResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudMapAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudMapAPIResponse * response = (WiSeCloudMapAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeMapSettingServicesResponseValidater getGetMapSettingsFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetMapSettingsErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case GetMapSettings:
            [self getMapSettingsRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}


@end
