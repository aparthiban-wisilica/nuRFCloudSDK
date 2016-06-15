//
//  WiSeSensorServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 03/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSensorServices.h"
#import "WiSeSensorServicesRequestParser.h"
#import "WiSeSensorServicesResponseParser.h"
#import "WiSeSensorServicesResponseValidater.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudSensorAPIRequest.h"
#import "WiSeCloudSensorAPIResponse.h"

#import "WiSeSensorTriggerLogAPIRequest.h"
#import "WiSeSensorTriggerLogAPIResponse.h"

#import "WiSeSensorTriggerIntervalSetAPIRequest.h"
#import "WiSeSensorTriggerIntervalSetAPIResponse.h"

#import "WiSeMakeMultiSensorAPIRequest.h"
#import "WiSeMakeMultiSensorAPIResponse.h"

#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import "WiSeCloudAPIURLInfo.h"

@interface WiSeSensorServices () <WiSeCloudApiRequestDelegate>


@end


@implementation WiSeSensorServices {
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

# pragma mark --- Sensor Association ---

- (WiSeCloudAPIRequestRegisteredDetails *) sensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeSensorServicesRequestParser createSensorAssociationApiParameters:request];

        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:SensorAssociation]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:SensorAssociationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:SensorAssociation];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
    
}

- (void) sensorAssociationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSensorServicesResponseValidater validateSensorAssociationAppResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Sensor Association Response
    if ([result isKindOfClass:[WiSeCloudSensorAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudSensorAPIResponse * response = (WiSeCloudSensorAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSensorServicesResponseValidater getSensorAssociationFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SensorAssociationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}


# pragma mark --- Get Sensor Association ---

- (WiSeCloudAPIRequestRegisteredDetails *) getSensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request {
    
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


        WiSeCloudAPIURLInfo * urlInfo              = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetSensorAssociation]];
        NSString * baseURL                         = urlInfo.apiURL;
        NSString * httpMethod                      = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;

        NSString * strURL                          = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetSensorAssociationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetSensorAssociation];// Creating Cloud Request Object

        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) getSensorAssociationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSensorServicesResponseValidater validateGetSensorAssociationAppResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Sensor Association Response
    if ([result isKindOfClass:[WiSeCloudSensorAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudSensorAPIResponse * response = (WiSeCloudSensorAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSensorServicesResponseValidater getGetSensorAssociationFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetSensorAssociationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Get Archived Sensor Association ---

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedSensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request {
    
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


        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetArchivedSensorAssociation]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        
        NSString * strURL                          = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetArchivedSensorAssociationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetArchivedSensorAssociation];// Creating Cloud Request Object
        
        regDetails = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
    
}

# pragma mark --- Sensor Trigger Log ---

- (WiSeCloudAPIRequestRegisteredDetails *) sensorTriggerLogApiWithRequest : (WiSeCloudSensorAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeSensorServicesRequestParser createSensorTriggerLogApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:SensorTriggerLog]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:SensorTriggerLogURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:SensorTriggerLog];// Creating Cloud Request Object
        
        regDetails = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
    
}

- (void) sensorTriggerLogRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSensorServicesResponseValidater validateSensorTriggerLogAppResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Sensor Trigger Log Response
    if ([result isKindOfClass:[WiSeCloudSensorAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudSensorAPIResponse * response = (WiSeCloudSensorAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSensorServicesResponseValidater getSensorTriggerLogFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SensorTriggerLogErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Sensor Trigger Intervel Set ---

- (WiSeCloudAPIRequestRegisteredDetails *) sensorTriggerIntervelSetApiWithRequest : (WiSeSensorTriggerIntervalSetAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeSensorServicesRequestParser createSensorTriggerIntervalSetApiParameters:request];

        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:SensorTriggerIntervalSet]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;

        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:SensorTriggerLogURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:SensorTriggerIntervalSet];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) sensorTriggerIntervelSetRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSensorServicesResponseValidater validateSensorTriggerIntervalSetAppResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Sensor Trigger Interval Set Response
    if ([result isKindOfClass:[WiSeSensorTriggerIntervalSetAPIResponse class ]]) { // When model response class exsit
        
        WiSeSensorTriggerIntervalSetAPIResponse * response = (WiSeSensorTriggerIntervalSetAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSensorServicesResponseValidater getSensorTriggerIntervalSetFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SensorTriggerIntervalSetErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }

}

# pragma mark --- Make MultiSensor ---

- (WiSeCloudAPIRequestRegisteredDetails *)makeMultiSensorApiWithRequest:(WiSeMakeMultiSensorAPIRequest *)request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                       = [WiSeSensorServicesRequestParser createMakeMultiSensorApiParameters:request];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:MakeMultiSensor]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        
        NSString * strURL                   = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                  = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:MakeMultiSensorURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:MakeMultiSensor]; // Creating Cloud Request Object
        
        regDetails = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) makeMultiSensorRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeSensorServicesResponseValidater validateMakeMultiSensorAppResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Make MultiSensor Response
    if ([result isKindOfClass:[WiSeMakeMultiSensorAPIResponse class ]]) { // When model response class exsit
        
        WiSeMakeMultiSensorAPIResponse * response = (WiSeMakeMultiSensorAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeSensorServicesResponseValidater getMakeMultiSensorFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:MakeMultiSensorErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }

}

#pragma mark --- Core API Call Back ---

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case SensorAssociation:
            [self sensorAssociationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetSensorAssociation:
            [self getSensorAssociationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case SensorTriggerLog:
            [self sensorTriggerLogRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case SensorTriggerIntervalSet:
            [self sensorTriggerLogRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case MakeMultiSensor:
            [self makeMultiSensorRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetArchivedSensorAssociation:
            [self getSensorAssociationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;

        default:
            break;
    }
}


@end
