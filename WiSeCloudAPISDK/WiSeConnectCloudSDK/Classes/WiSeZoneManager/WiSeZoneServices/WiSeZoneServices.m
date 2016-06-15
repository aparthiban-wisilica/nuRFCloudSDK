//
//  WiSeZoneServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 22/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeZoneServices.h"
#import "WiSeZoneServicesRequestParser.h"
#import "WiSeZoneServicesResponseParser.h"
#import "WiSeZoneServicesResponseValidataer.h"

#import "WiSeCloudZoneAPIRequest.h"
#import "WiSeCloudZoneAPIResponse.h"
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import "WiSeAPIHeader.h"
#import "WiSeCloudAPIURLInfo.h"

@interface WiSeZoneServices () <WiSeCloudApiRequestDelegate>


@end



@implementation WiSeZoneServices {
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

# pragma mark --- Add Zone ---

- (WiSeCloudAPIRequestRegisteredDetails *) addZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeZoneServicesRequestParser createAddZoneApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddZone]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddZoneURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddZone]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) addZoneRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeZoneServicesResponseValidataer validateAddZoneResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudZoneAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudZoneAPIResponse * response = (WiSeCloudZoneAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeZoneServicesResponseValidataer getAddZoneFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddZoneErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Edit Zone ---

- (WiSeCloudAPIRequestRegisteredDetails *) editZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeZoneServicesRequestParser createEditZoneApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditZone]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:EditZoneURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditZone]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) editZoneRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeZoneServicesResponseValidataer validateEditZoneResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudZoneAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudZoneAPIResponse * response = (WiSeCloudZoneAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeZoneServicesResponseValidataer getEditZoneFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditZoneErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


# pragma mark --- Delete Zone ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeZoneServicesRequestParser createDeleteZoneApiParameters:request];
        NSString * baseURL;
        NSString * strURL;
        NSString * strMethod;
        int apiId = 0;
        if (request.zoneList && request.zoneList.count) { // Delete List of Zones
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteZoneInBulk]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
            strURL                        = [NSString stringWithFormat:@"%@",baseURL];
            apiId                         = DeleteZoneInBulk;
        }else {
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteZone]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
            NSString * strZoneId          = [NSString stringWithFormat:@"%d",request.zoneCloudId];// Delete A Zone
            strURL                        = [NSString stringWithFormat:@"%@%@",baseURL,strZoneId];
            apiId                         = DeleteZone;
        }
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:strMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteZoneURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) deleteZoneRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeZoneServicesResponseValidataer validateDeleteZoneResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudZoneAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudZoneAPIResponse * response = (WiSeCloudZoneAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeZoneServicesResponseValidataer getDeleteZoneFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteZoneErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


# pragma mark --- Get Zone ---

- (WiSeCloudAPIRequestRegisteredDetails *) getZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header{
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
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetZone]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;

        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];

        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetZoneURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetZone]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getZoneRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeZoneServicesResponseValidataer validateGetZoneResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudZoneAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudZoneAPIResponse * response = (WiSeCloudZoneAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeZoneServicesResponseValidataer getGetZoneFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetZoneErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Get Archived Zone ---

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
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
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetArchivedZone]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetArchivedZoneURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetArchivedZone]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getArchivedZoneRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeZoneServicesResponseValidataer validateGetArchivedZoneResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudZoneAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudZoneAPIResponse * response = (WiSeCloudZoneAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeZoneServicesResponseValidataer getGetArchivedZoneFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetArchivedZoneErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Get Zones From Organizations ---

- (WiSeCloudAPIRequestRegisteredDetails *) getZonesFromOrganizationsApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
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
        
        NSArray * arrJson                         = [WiSeZoneServicesRequestParser createGetZonesFromOrganizationApiParameters:request];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetZoneFromOrganization]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arrJson withURLKey:GetZoneFromOrganizationsURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetZoneFromOrganization]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getZonesFromOrganizationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeZoneServicesResponseValidataer validateGetZonesFromOrganizationResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudZoneAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudZoneAPIResponse * response = (WiSeCloudZoneAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeZoneServicesResponseValidataer getGetZoneListenerMappingFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetZoneListenerMappingErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Map Zone and Listener ---

- (WiSeCloudAPIRequestRegisteredDetails *) mapZoneAndListenerApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeZoneServicesRequestParser createMapZoneAndListenerApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:MapZoneAndListener]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:MapZoneListenerURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:MapZoneAndListener]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) mapZoneAndListenerRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeZoneServicesResponseValidataer validateMapZoneListenerResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudZoneAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudZoneAPIResponse * response = (WiSeCloudZoneAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeZoneServicesResponseValidataer getMapZoneListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:MapZoneAndListenerErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Get Zone Listener Mappping ---

- (WiSeCloudAPIRequestRegisteredDetails *) getZoneListenerMappingApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header{
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
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetZoneListenerMapping]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@%d",baseURL,request.zoneCloudId];
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetZoneListenerMappingURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetZoneListenerMapping]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getZoneListenerMappingRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeZoneServicesResponseValidataer validateGetZoneListenerMappingResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudZoneAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudZoneAPIResponse * response = (WiSeCloudZoneAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeZoneServicesResponseValidataer getGetZoneListenerMappingFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetZoneListenerMappingErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case AddZone:
            [self addZoneRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case EditZone:
            [self editZoneRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteZone:
        case DeleteZoneInBulk:
            [self deleteZoneRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetZone:
            [self getZoneRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetZoneListenerMapping:
            [self getZoneListenerMappingRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case MapZoneAndListener:
            [self mapZoneAndListenerRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetZoneFromOrganization:
            [self getZonesFromOrganizationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetArchivedZone:
            [self getArchivedZoneRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}

@end
