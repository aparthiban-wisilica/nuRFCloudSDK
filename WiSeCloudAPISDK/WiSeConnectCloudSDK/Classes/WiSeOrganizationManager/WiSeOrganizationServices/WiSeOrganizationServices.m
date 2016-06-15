//
//  WiSeOrganizationServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeOrganizationServices.h"
#import "WiSeOrganizationServicesRequestParser.h"
#import "WiSeOrganizationServicesResponseParser.h"
#import "WiSeOrganizationServicesResponseValidater.h"

#import "WiSeCloudOrganizationRequest.h"
#import "WiSeCloudOrganizationResponse.h"

#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import "WiSeCloudSDKInitializer.h"
#import "WiSeAPIHeader.h"
#import "WiSeCloudAPIURLInfo.h"

@interface WiSeOrganizationServices () <WiSeCloudApiRequestDelegate>


@end


@implementation WiSeOrganizationServices {
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


#pragma mark --- Add Sub Organization ---

- (WiSeCloudAPIRequestRegisteredDetails *) addOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request  WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeOrganizationServicesRequestParser createAddOrganizationApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddOrganization]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddOrganizationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddOrganization]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) addOrganizationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeOrganizationServicesResponseValidater validateAddOrganizationResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Register App Response
    if ([result isKindOfClass:[WiSeCloudOrganizationResponse class ]]) { // When model response class exsit
        
        WiSeCloudOrganizationResponse * response = (WiSeCloudOrganizationResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeOrganizationServicesResponseValidater getAddOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddOrganizationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


#pragma mark --- Edit Sub Organization ---

- (WiSeCloudAPIRequestRegisteredDetails *) editOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeOrganizationServicesRequestParser createEditOrganizationApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditOrganization]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:EditOrganizationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditOrganization]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) editOrganizationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeOrganizationServicesResponseValidater validateEditOrganizationResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Register App Response
    if ([result isKindOfClass:[WiSeCloudOrganizationResponse class ]]) { // When model response class exsit
        
        WiSeCloudOrganizationResponse * response = (WiSeCloudOrganizationResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeOrganizationServicesResponseValidater getEditOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditOrganizationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


#pragma mark --- Get Sub Organization ---

- (WiSeCloudAPIRequestRegisteredDetails*) getOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header{
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
            NSString * strStart        = [NSString stringWithFormat:@"%f",request.start];
            NSString * strEnd          = [NSString stringWithFormat:@"%d",request.limit];
            
            objRequestBodyParams       = [[NSMutableDictionary alloc] init];
            [objRequestBodyParams setValue:header.acceptValue forKey:Accept];
            [objRequestBodyParams setValue:header.contentTypeValue forKey:ContentType];
            [objRequestBodyParams setValue:header.userToken forKey:TOKEN];
            [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
            [objRequestBodyParams setValue:strOrgCloudId forKey:ORG_ID];
            [objRequestBodyParams setValue:strStart forKey:START];
            [objRequestBodyParams setValue:strEnd forKey:LIMIT];
        }
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetOrganization]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                          = [NSString stringWithFormat:@"%@",baseURL];
        
        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetOrganizationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetOrganization]; // Creating Cloud Request Object
        
        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getOrganizationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeOrganizationServicesResponseValidater validateGetOrganizationResponse:responseInfo WithRequestDetails:requestInfo]; // 
    if ([result isKindOfClass:[WiSeCloudOrganizationResponse class ]]) { // When model response class exsit
        
        WiSeCloudOrganizationResponse * response = (WiSeCloudOrganizationResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeOrganizationServicesResponseValidater getOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetOrganizationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


#pragma mark --- Delete Sub Organization ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                       = [WiSeOrganizationServicesRequestParser createDeleteOrganizationApiParameters:request];
        NSString * baseURL;
        NSString * strURL;
        NSString * strMethod;
        int apiId = 0;
        
        if (request.organizationList && request.organizationList.count) { // Delete List of Orgs
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteOrganizationInBulk]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
            strURL                        = [NSString stringWithFormat:@"%@",baseURL];
            apiId                         = DeleteOrganizationInBulk;
        }else {
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteOrganization]];
            NSString * strOrgId           = [NSString stringWithFormat:@"%d",request.organizationId];// Delete A Org
            strURL                        = [NSString stringWithFormat:@"%@%@",baseURL,strOrgId];
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
            apiId                         = DeleteOrganization;
        }
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:strMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteOrganizationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) deleteOrganizationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeOrganizationServicesResponseValidater validateDeleteOrganizationResponse:responseInfo WithRequestDetails:requestInfo]; //
    if ([result isKindOfClass:[WiSeCloudOrganizationResponse class ]]) { // When model response class exsit
        
        WiSeCloudOrganizationResponse * response = (WiSeCloudOrganizationResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeOrganizationServicesResponseValidater getDeleteOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteOrganizationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


#pragma mark --- Core API Call Back ---

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case AddOrganization:
            [self addOrganizationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case EditOrganization:
            [self editOrganizationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetOrganization:
            [self getOrganizationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteOrganization:
        case DeleteOrganizationInBulk:
            [self deleteOrganizationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}



@end
