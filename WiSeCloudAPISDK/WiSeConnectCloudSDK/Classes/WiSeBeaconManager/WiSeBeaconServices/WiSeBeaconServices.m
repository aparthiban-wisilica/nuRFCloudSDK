//
//  WiSeBeaconServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeBeaconServices.h"
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import "WiSeNetworkUtil.h"
#import "WiSeCloudBeaconAPIRequest.h"

#import "WiSeBeaconServicesRequestParser.h"
#import "WiSeBeaconServicesResponseParser.h"
#import "WiSeBeaconServicesResponseValidater.h"
#import "WiSeCloudBeaconAPIResponse.h"
#import "WiSeCloudAPIURLInfo.h"

@interface WiSeBeaconServices () <WiSeCloudApiRequestDelegate>

@end

@implementation WiSeBeaconServices {
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


# pragma mark --- Add Beacon                ---

- (WiSeCloudAPIRequestRegisteredDetails *) addBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeBeaconServicesRequestParser createAddBeaconApiParameterWithRequest:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddBeacon]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddBeaconURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddBeacon]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) addBeaconRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateAddBeaconResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getAddConfiguredBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddConfiguredBeaconErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Edit Beacon               ---

- (WiSeCloudAPIRequestRegisteredDetails *) editBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeBeaconServicesRequestParser createEditBeaconApiParameterWithRequest:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditBeacon]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:EditBeaconURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditBeacon]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) editBeaconRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateEditBeaconResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getEditBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditBeaconErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


# pragma mark --- Get Beacon                ---

- (WiSeCloudAPIRequestRegisteredDetails *) getBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        // Header Params
        NSString * token           = request.token?request.token:@"";
        NSString * strPhoneCloudId = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd          = [NSString stringWithFormat:@"%d",request.limit];
        
        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];

        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetBeacon]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetBeaconURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetBeacon]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
    
}

- (void) getBeaconRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateGetBeaconResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getGetBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetBeaconErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Get Archived Beacon       ---

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        // Header Params
        NSString * token           = request.token?request.token:@"";
        NSString * strPhoneCloudId = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd          = [NSString stringWithFormat:@"%d",request.limit];
        
        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];
        
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetArchivedBeacon]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetArchivedBeaconURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetArchivedBeacon]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
    
}

# pragma mark --- Delete Beacon             ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeBeaconServicesRequestParser createDeleteBeaconApiParameterWithRequest:request];
        NSString * baseURL;
        
        NSString * strURL;
        NSString * strMethod;
        int apiId = 0;
        if (request.beaconsList && request.beaconsList.count) { // Delete List of Beacons
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteBeaconInBulk]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
            strURL                        = [NSString stringWithFormat:@"%@",baseURL];
            apiId                         = DeleteBeaconInBulk;
        }else {
            NSString * strDeviceId        = [NSString stringWithFormat:@"%d",request.beaconCloudId];// Delete A Beacon
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteBeacon]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
            strURL                        = [NSString stringWithFormat:@"%@%@",baseURL,strDeviceId];
            apiId                         = DeleteBeacon;
        }

        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:strMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteBeaconURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) deleteBeaconRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateDeleteBeaconResponse:responseInfo WithRequestDetails:requestInfo]; 
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getDeleteBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetBeaconErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


# pragma mark --- Add Configured Beacon     ---

- (WiSeCloudAPIRequestRegisteredDetails *) addConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeBeaconServicesRequestParser createAddEditConfiguredBeaconApiParameterWithRequest:request];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddConfiguredBeacon]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddConfiguredBeaconURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddConfiguredBeacon]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) addConfiguredBeaconRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateAddConfiguredBeaconResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getAddConfiguredBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddConfiguredBeaconErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


# pragma mark --- Edit Configured Beacon    ---

- (WiSeCloudAPIRequestRegisteredDetails *) editConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeBeaconServicesRequestParser createAddEditConfiguredBeaconApiParameterWithRequest:request];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditConfiguredBeacon]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:EditConfiguredBeaconURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditConfiguredBeacon]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) editConfiguredBeaconRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateEditConfiguredBeaconResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getEditConfiguredBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditConfiguredBeaconErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Get Configured Beacon     ---

- (WiSeCloudAPIRequestRegisteredDetails *) getConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        // Header Params
        NSString * token           = request.token?request.token:@"";
        NSString * strPhoneCloudId = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd          = [NSString stringWithFormat:@"%d",request.limit];
        
        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];
        
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetConfiguredBeacon]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetConfiguredBeaconURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetConfiguredBeacon]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getConfiguredBeaconRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateGetConfiguredBeaconResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getGetConfiguredBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetConfiguredBeaconErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


# pragma mark --- Delete Configured Beacon  ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
//        NSArray * arr                             = [WiSeBeaconServicesRequestParser createDeleteBeaconApiParameterWithRequest:request];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteConfiguredBeacon]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@%d",baseURL,request.beaconCloudId];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:DeleteConfiguredBeaconURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:DeleteConfiguredBeacon]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) deleteConfiguredBeaconRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateDeleteConfiguredBeaconResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getDeleteConfiguredBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetConfiguredBeaconErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Create Beacon Association ---

- (WiSeCloudAPIRequestRegisteredDetails *) beaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeBeaconServicesRequestParser createCreateBeaconAssociationApiParameterWithRequest:request];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeviceBeaconAssociation]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeviceBeaconAssociationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:DeviceBeaconAssociation]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
    
}

- (void) beaconAssociationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateCreateBeaconAssociationResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getCreateBeaconAssociationFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:CreateDeviceBeaconAssociationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Get Beacon Association    ---

- (WiSeCloudAPIRequestRegisteredDetails *) getBeaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        // Header Params
        NSString * token           = request.token?request.token:@"";
        NSString * strPhoneCloudId = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd          = [NSString stringWithFormat:@"%d",request.limit];
        
        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetDeviceBeaconAssociation]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetDeviceBeaconAssociationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetDeviceBeaconAssociation]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getBeaconAssociationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateGetBeaconAssociationResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getGetBeaconAssociationFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetDeviceBeaconAssociationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Get Archived Beacon Association    ---

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedBeaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        // Header Params
        NSString * token           = request.token?request.token:@"";
        NSString * strPhoneCloudId = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd          = [NSString stringWithFormat:@"%d",request.limit];
        
        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetArchivedDeviceBeaconAssociation]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetArchivedDeviceBeaconAssociationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetArchivedDeviceBeaconAssociation]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
    
}



# pragma mark --- Delete Beacon Association ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteBeaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeBeaconServicesRequestParser createDeleteBeaconAssociationApiParameterWithRequest:request];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteDeviceBeaconAssociation]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteDeviceBeaconAssociationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:DeleteDeviceBeaconAssociation]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

# pragma mark --- Update Beacon Battery Status ---

- (WiSeCloudAPIRequestRegisteredDetails *) updateBeaconBatteryStatusApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeBeaconServicesRequestParser updateBeaconBatteryStatusApiParameterWithRequest:request];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:UpdateBeaconBatteryLevel]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:UpdateBeaconBatteryLevelURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:UpdateBeaconBatteryLevel]; // Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) updateBeaconBatteryStatusRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateUpdateBeaconBatteryStatusResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getUpdateBeaconBatteryStatusFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconBatteryLevelErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Update Beacon Data Log ---

- (WiSeCloudAPIRequestRegisteredDetails *) updateBeaconDataLogApiWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        request.token = request.token?request.token:@"";
        NSString * strPhoneCloudId = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        
        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:@"text/plain" forKey:ContentType];
        [objRequestBodyParams setValue:request.token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        NSData * json                             = [WiSeBeaconServicesRequestParser updateBeaconDataLogApiParameterWithRequest:request];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:UpdateBeaconDataLog]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withRequestBody:json withURLKey:UpdateBeaconDataLogURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:UpdateBeaconDataLog]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) updateBeaconDataLogRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeBeaconServicesResponseValidater validateUpdateBeaconDataLogResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeCloudBeaconAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudBeaconAPIResponse * response = (WiSeCloudBeaconAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeBeaconServicesResponseValidater getUpdateBeaconDataLogFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconDataLogErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case AddBeacon:
            [self addBeaconRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case EditBeacon:
            [self editBeaconRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetBeacon:
            [self getBeaconRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetArchivedBeacon:
            [self getBeaconRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteBeacon:
        case DeleteBeaconInBulk:
            [self deleteBeaconRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case AddConfiguredBeacon:
            [self addConfiguredBeaconRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case EditConfiguredBeacon:
            [self editConfiguredBeaconRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetConfiguredBeacon:
            [self getConfiguredBeaconRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteConfiguredBeacon:
            [self deleteConfiguredBeaconRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeviceBeaconAssociation:
            [self beaconAssociationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetDeviceBeaconAssociation:
            [self getBeaconAssociationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetArchivedDeviceBeaconAssociation:
            [self getBeaconAssociationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteDeviceBeaconAssociation:
            
            break;
        case UpdateBeaconBatteryLevel:
            [self updateBeaconBatteryStatusRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case UpdateBeaconDataLog:
            [self updateBeaconDataLogRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}


@end
