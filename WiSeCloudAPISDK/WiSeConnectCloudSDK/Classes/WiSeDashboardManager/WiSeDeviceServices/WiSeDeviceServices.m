//
//  WiSeDeviceServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 29/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeDeviceServices.h"
#import "WiSeDeviceServicesRequestParser.h"
#import "WiSeDeviceServicesResponseParser.h"
#import "WiSeDeviceServicesResponseValidater.h"

#import "WiSeCloudDeviceAPIRequest.h"
#import "WiSeCloudDeviceAPIResponse.h"

#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>

#import "WiSeAPIHeader.h"
#import "WiSeCloudListenerAPIRequest.h"
#import "WiSeCloudListenerAPIResponse.h"
#import "WiSeCloudAPIURLInfo.h"

@interface WiSeDeviceServices () <WiSeCloudApiRequestDelegate>


@end

@implementation WiSeDeviceServices {
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

#pragma mark --- Add Device ---

- (WiSeCloudAPIRequestRegisteredDetails *) addDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeDeviceServicesRequestParser createAddDeviceApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddDevice]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddDeviceURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddDevice]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (WiSeCloudAPIRequestRegisteredDetails *) addDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeDeviceServicesRequestParser createAddDeviceApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddDevice]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddDeviceURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddDevice]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) addDeviceRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateAddDeviceResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Register App Response
    if ([result isKindOfClass:[WiSeCloudDeviceAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudDeviceAPIResponse * response = (WiSeCloudDeviceAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getAddDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddDeviceErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }

}

#pragma mark --- Edit Device ---

- (WiSeCloudAPIRequestRegisteredDetails *) editDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeDeviceServicesRequestParser createEditDeviceApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditDevice]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:EditDeviceURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditDevice]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (WiSeCloudAPIRequestRegisteredDetails *) editDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeDeviceServicesRequestParser createEditDeviceApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditDevice]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:EditDeviceURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditDevice]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) editDeviceRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateEditDeviceResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit Device Response
    if ([result isKindOfClass:[WiSeCloudDeviceAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudDeviceAPIResponse * response = (WiSeCloudDeviceAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getEditDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditDeviceErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }

}


#pragma mark --- Delete Device ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                       = [WiSeDeviceServicesRequestParser createDeleteDeviceApiParameters:request];
        NSString * baseURL;

        NSString * strURL;
        NSString * strMethod;
        
        
        int apiId = 0;
        if (request.deviceList && request.deviceList.count) { // Delete List of Devices
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteDeviceInBulk]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
            strURL                        = [NSString stringWithFormat:@"%@",baseURL];
            apiId                         = DeleteDeviceInBulk;
        }else {
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteDevice]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
            NSString * strDeviceId        = [NSString stringWithFormat:@"%d",request.deviceCloudId];// Delete A Devices
            strURL                        = [NSString stringWithFormat:@"%@%@",baseURL,strDeviceId];
            apiId                         = DeleteDevice;
        }
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:strMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteDeviceURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (WiSeCloudAPIRequestRegisteredDetails *) deleteDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                       = [WiSeDeviceServicesRequestParser createDeleteDeviceApiParameters:request];
        NSString * baseURL;
        
        NSString * strURL;
        NSString * strMethod;
        int apiId = 0;
        if (request.deviceList && request.deviceList.count) { // Delete List of Devices
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteDeviceInBulk]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
            strURL                        = [NSString stringWithFormat:@"%@",baseURL];
            apiId                         = DeleteDeviceInBulk;
        }else {
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteDevice]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
            NSString * strDeviceId        = [NSString stringWithFormat:@"%d",request.deviceCloudId];// Delete A Devices
            strURL                        = [NSString stringWithFormat:@"%@%@",baseURL,strDeviceId];
            apiId                         = DeleteDevice;
        }
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:strMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteDeviceURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) deleteDeviceRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateDeleteDeviceResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit Device Response
    if ([result isKindOfClass:[WiSeCloudDeviceAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudDeviceAPIResponse * response = (WiSeCloudDeviceAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getEditDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditDeviceErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }

}

#pragma mark --- Get A Device ---

- (WiSeCloudAPIRequestRegisteredDetails *) getADeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    return nil;
}

- (void) getADeviceRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
}

#pragma mark --- Get All Device under A User ---

- (WiSeCloudAPIRequestRegisteredDetails *) getAllDeviceAgainstUserApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        // Header Params
        NSString * token                           = request.token?request.token:@"";
        NSString * strPhoneCloudId                 = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart                        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd                          = [NSString stringWithFormat:@"%d",request.limit];

        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];

        WiSeCloudAPIURLInfo * urlInfo              = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetAllDevice]];
        NSString * baseURL                         = urlInfo.apiURL;
        NSString * httpMethod                      = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                          = [NSString stringWithFormat:@"%@0",baseURL];

        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetAllDeviceURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetAllDevice];// Creating Cloud Request Object

        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (WiSeCloudAPIRequestRegisteredDetails*) getAllDeviceAgainstUserApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
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

        
        WiSeCloudAPIURLInfo * urlInfo              = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetAllDevice]];
        NSString * baseURL                         = urlInfo.apiURL;
        NSString * httpMethod                      = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                          = [NSString stringWithFormat:@"%@0",baseURL];
        
        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetAllDeviceURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetAllDevice];// Creating Cloud Request Object
        
        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

#pragma mark --- Get All Device ---

- (WiSeCloudAPIRequestRegisteredDetails *) getAllDevicesAgainstAGroupApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];

    if (!regDetails) { // When Reg is nil , that means request is valid
        // Header Params
        NSString * token                           = request.token?request.token:@"";
        NSString * strPhoneCloudId                 = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart                        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd                          = [NSString stringWithFormat:@"%d",request.limit];

        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];


        WiSeCloudAPIURLInfo * urlInfo              = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetAllDevice]];
        NSString * baseURL                         = urlInfo.apiURL;
        NSString * httpMethod                      = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                          = [NSString stringWithFormat:@"%@%d",baseURL,request.groupCloudId];

        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetAllDeviceURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetAllDevice];// Creating Cloud Request Object

        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getAllDeviceRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateGetAllDeviceResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit Device Response
    if ([result isKindOfClass:[WiSeCloudDeviceAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudDeviceAPIResponse * response = (WiSeCloudDeviceAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getAllDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetAllDeviceErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }

}


#pragma mark --- Get Archived Devices ---

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedDevicesApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        // Header Params
        
        NSString * token                           = request.token?request.token:@"";
        NSString * strPhoneCloudId                 = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart                        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd                          = [NSString stringWithFormat:@"%d",request.limit];

        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];


        WiSeCloudAPIURLInfo * urlInfo              = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetArchivedDevice]];
        NSString * baseURL                         = urlInfo.apiURL;
        NSString * httpMethod                      = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                          = [NSString stringWithFormat:@"%@",baseURL];

        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetArchiveDeviceURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetArchivedDevice];// Creating Cloud Request Object

        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
 
}

- (WiSeCloudAPIRequestRegisteredDetails*) getArchivedDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
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

        
        
        WiSeCloudAPIURLInfo * urlInfo              = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetArchivedDevice]];
        NSString * baseURL                         = urlInfo.apiURL;
        NSString * httpMethod                      = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                          = [NSString stringWithFormat:@"%@",baseURL];
        
        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetArchiveDeviceURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetArchivedDevice];// Creating Cloud Request Object
        
        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

#pragma mark --- Get Secure Devices ---

- (WiSeCloudAPIRequestRegisteredDetails *) getSecureDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeDeviceServicesRequestParser createGetSecureDeviceApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetSecureDevice]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:SecureDevicePairingURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetSecureDevice]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getSecureDeviceAssociationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateGetSecureDeviceResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit Device Response
    if ([result isKindOfClass:[WiSeCloudDeviceAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudDeviceAPIResponse * response = (WiSeCloudDeviceAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getSecureDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetSecureDeviceErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

#pragma mark --- Clear Secure Devices ---

- (WiSeCloudAPIRequestRegisteredDetails *) clearSecureDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request  {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeDeviceServicesRequestParser createGetSecureDeviceApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:ClearSecureDevice]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;

        NSString * strURL                         = [NSString stringWithFormat:@"%@%@",baseURL,UrlClearSecureDevice];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:ClearSecureDevicePairingURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ClearSecureDevice];
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getClearSecureDeviceAssociationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateClearSecureDeviceResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit Device Response
    if ([result isKindOfClass:[WiSeCloudDeviceAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudDeviceAPIResponse * response = (WiSeCloudDeviceAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getClearSecureDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:ClearSecureDeviceErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


#pragma mark --- Device Group Association ---

- (WiSeCloudAPIRequestRegisteredDetails *) deviceGroupAssociationApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeDeviceServicesRequestParser createDeviceGroupAssociationApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeviceGroupAssociation]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeviceGroupAssociationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:DeviceGroupAssociation]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getDeviceGroupAssociationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateDeviceGroupAssociationResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit Device Response
    if ([result isKindOfClass:[WiSeCloudDeviceAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudDeviceAPIResponse * response = (WiSeCloudDeviceAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getDeviceGroupAssociationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeviceGroupAssociationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


#pragma mark --- Get Device Group Association ---

- (WiSeCloudAPIRequestRegisteredDetails *) getDeviceGroupAssociationApiWithRequest : (WiSeCloudDeviceAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        // Header Params
        
        NSString * token                           = request.token?request.token:@"";
        NSString * strPhoneCloudId                 = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart                        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd                          = [NSString stringWithFormat:@"%d",request.limit];
        
        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];

        NSArray * arr                             = [WiSeDeviceServicesRequestParser createDeviceGroupAssociationApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetDeviceGroupAssociation]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:GetDeviceGroupAssociationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetDeviceGroupAssociation]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getGetDeviceGroupAssociationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateGetDeviceGroupAssociationResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Edit Device Response
    if ([result isKindOfClass:[WiSeCloudDeviceAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudDeviceAPIResponse * response = (WiSeCloudDeviceAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getGetDeviceGroupAssociationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetDeviceGroupAssociationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark --- Get Listeners ---

- (WiSeCloudAPIRequestRegisteredDetails *) getListenersAgainstUserApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
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
        
        
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetListener]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
//        NSString * strURL                          = [NSString stringWithFormat:@"%@%@%d",baseURL,UrlGetListener,request.userCloudId];
        NSString * strURL                          = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetListenerURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetListener]; // Creating Cloud Request Object
        
        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getListenerRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateGetListenerResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudListenerAPIResponse class]]) { // When model response class exsit
        
        WiSeCloudListenerAPIResponse * response = (WiSeCloudListenerAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getGetListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetListenerErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark --- Get Listeners Zone Mapping ---

- (WiSeCloudAPIRequestRegisteredDetails *) getListenerZoneMappingApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
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
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetListenerZoneMapping]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                          = nil;
        if (request.listenerCloudId) { // To get all listener zone mapping
            strURL                                 = [NSString stringWithFormat:@"%@%d",baseURL,request.listenerCloudId];
        }else { // To get only one listener zone mapping
            strURL                                 = [NSString stringWithFormat:@"%@0",baseURL];
        }
        
        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetListenerZoneMappingURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetListenerZoneMapping]; // Creating Cloud Request Object
        
        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getListenerZoneMappingRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateGetListenerZoneMappingResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudListenerAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudListenerAPIResponse * response = (WiSeCloudListenerAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getGetListenerZoneMappingFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetListenerZoneMappingErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Get Listeners From Organizations ---

- (WiSeCloudAPIRequestRegisteredDetails *) getListenersFromOrganizationsApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
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
        
        NSArray * arrJson                         = [WiSeDeviceServicesRequestParser createGetListenersFromOrganizationApiParameters:request];

        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetListenerFromOrganizations]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;

        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];

        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arrJson withURLKey:GetListenerFromOrganizationsURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetListenerFromOrganizations]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getListenersFromOrganizationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateGetListenersFromOrganizationResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudListenerAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudListenerAPIResponse * response = (WiSeCloudListenerAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getGetListenersFromOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetListenerFromOrganizationsErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark --- Add Listeners ---

- (WiSeCloudAPIRequestRegisteredDetails *) addListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * arr                             = [WiSeDeviceServicesRequestParser createAddListenerApiParameters1:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddListener]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:arr withURLKey:AddListenerURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddListener]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) addListenerRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateAddListenerResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudListenerAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudListenerAPIResponse * response = (WiSeCloudListenerAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getAddListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddListenerErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark --- Add Secure Listeners ---

- (WiSeCloudAPIRequestRegisteredDetails *) addSecureListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * arr                             = [WiSeDeviceServicesRequestParser createAddSecureListenerApiParameters1:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddSecureListener]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:arr withURLKey:AddSecureListenerURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddSecureListener]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) addSecureListenerRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateAddSecureListenerResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudListenerAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudListenerAPIResponse * response = (WiSeCloudListenerAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getAddSecureListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddSecureListenerErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark --- Delete Secure Listeners ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteSecureListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeDeviceServicesRequestParser createDeleteSecureListenerApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteSecureListener]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteSecureListenerURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:DeleteSecureListener]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) deleteSecureListenerRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateDeleteSecureListenerResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudListenerAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudListenerAPIResponse * response = (WiSeCloudListenerAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getDeleteSecureListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteSecureListenerErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


#pragma mark --- Edit Listeners ---

- (WiSeCloudAPIRequestRegisteredDetails *) editListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * arr                             = [WiSeDeviceServicesRequestParser createAddListenerApiParameters1:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditListener]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withDictionaryRequestBody:arr withURLKey:EditListenerURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditListener]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) editListenerRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateEditListenerResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudListenerAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudListenerAPIResponse * response = (WiSeCloudListenerAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getEditListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditListenerErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark --- Delete Listeners ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    NSLog(@"Delete Listeners Request Creattion");
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSDictionary * arr                       = [WiSeDeviceServicesRequestParser createDeleteListenerApiParameters1:request];
        NSString * baseURL;
        
        NSString * strURL;
        NSString * strMethod;
        int apiId = 0;
        if (request.listenerList && request.listenerList.count) { // Delete List of Listeners
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteListenerInBulk]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
            strURL                        = [NSString stringWithFormat:@"%@",baseURL];
            apiId                         = DeleteListenerInBulk;
        }else {
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteListener]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
            NSString * strDeviceId        = [NSString stringWithFormat:@"%d",request.listenerCloudId];// Delete A Listener
            strURL                        = [NSString stringWithFormat:@"%@%@",baseURL,strDeviceId];
            apiId                         = DeleteListener;
        }
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:strMethod withHeader:objRequestBodyParams withDictionaryRequestBody:arr withURLKey:DeleteListenerURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) deleteListenerRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateDeleteListenerResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudListenerAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudListenerAPIResponse * response = (WiSeCloudListenerAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getDeleteListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteListenerErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark --- Get Listeners Archive ---

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedListenersApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
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
    
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetArchivedListener]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetArchivedListenerURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetArchivedListener];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getArchivedListenerRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeDeviceServicesResponseValidater validateGetArchivedListenerResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudListenerAPIResponse class]]) { // When model response class exsit
        
        WiSeCloudListenerAPIResponse * response = (WiSeCloudListenerAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeDeviceServicesResponseValidater getGetArchivedListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetArchivedListenerErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark --- Core API Call Back ---

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case AddDevice:
            [self addDeviceRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case EditDevice:
            [self editDeviceRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteDevice:
        case DeleteDeviceInBulk:
            [self deleteDeviceRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetAllDevice:
            [self getAllDeviceRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetArchivedDevice:
            [self getAllDeviceRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeviceGroupAssociation:
            [self getDeviceGroupAssociationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetDeviceGroupAssociation:
            [self getGetDeviceGroupAssociationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetListener:
            [self getListenerRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case AddListener:
            [self addListenerRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case EditListener:
            [self editListenerRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteListener:
        case DeleteListenerInBulk:
            [self deleteListenerRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetListenerZoneMapping:
            [self getListenerZoneMappingRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case AddSecureListener:
            [self addSecureListenerRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteSecureListener:
            [self deleteSecureListenerRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetSecureDevice:
            [self getSecureDeviceAssociationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetListenerFromOrganizations:
            [self getListenersFromOrganizationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetArchivedListener:
            [self getArchivedListenerRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case ClearSecureDevice:
            [self getClearSecureDeviceAssociationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;

        default:
            break;
    }
}


@end
