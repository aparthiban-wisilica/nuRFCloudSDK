//
//  WiSeSensorServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 03/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSensorServicesResponseValidater.h"
#import "WiSeSensorServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudSensorAPIResponse.h"
#import "WiSeSensorTriggerLogAPIResponse.h"
#import "WiSeSensorTriggerIntervalSetAPIResponse.h"
#import "WiSeMakeMultiSensorAPIResponse.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>



@implementation WiSeSensorServicesResponseValidater

# pragma mark --- Sensor Association ---

+ (id ) validateSensorAssociationAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == DEVICE_LINK_DELINK_SUCCESSFULL) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeCloudSensorAPIResponse * response = [WiSeSensorServicesResponseParser parseSensorAssociationAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getSensorAssociationFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getSensorAssociationFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SensorAssociationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getSensorAssociationFailedErrorWithErrorDes:strErrorDes WithStatusCode:SensorAssociationErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getSensorAssociationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:SensorAssociationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Sensor Association ---

+ (id ) validateGetSensorAssociationAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == GET_DEVICE_LINK_DELINK_SUCCESSFULL) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeCloudSensorAPIResponse * response = [WiSeSensorServicesResponseParser parseGetSensorAssociationAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getSensorAssociationFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getGetSensorAssociationFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetSensorAssociationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getGetSensorAssociationFailedErrorWithErrorDes:strErrorDes WithStatusCode:GetSensorAssociationErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getGetSensorAssociationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetSensorAssociationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Sensor Trigger Log ---

+ (id ) validateSensorTriggerLogAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SENSOR_TRIGGER_LOG_SUCCESSFULL) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeCloudSensorAPIResponse * response = [WiSeSensorServicesResponseParser parseSensorTriggerLogAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getSensorTriggerLogFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getSensorTriggerLogFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SensorTriggerLogErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getSensorTriggerLogFailedErrorWithErrorDes:strErrorDes WithStatusCode:SensorTriggerLogErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getSensorTriggerLogFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerLogFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Sensor Trigger Intervel Set ---

+ (id ) validateSensorTriggerIntervalSetAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SENSOR_TRIGGER_LOG_SUCCESSFULL) {
                requestInfo.requestStatus                          = RequestSuccess;
                WiSeSensorTriggerIntervalSetAPIResponse * response = [WiSeSensorServicesResponseParser parseSensorTriggerIntervelSetAPIResponse:responseInfo];
                result                                             = response;
            }else {
                NSString * strErrorDes                             = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                               = [self getSensorTriggerLogFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                             = error;
            }
        }else {
            result = [self getSensorTriggerLogFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SensorTriggerLogErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getSensorTriggerLogFailedErrorWithErrorDes:strErrorDes WithStatusCode:SensorTriggerLogErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getSensorTriggerIntervalSetFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerIntervalSetErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Make Multisensor ---

+ (id ) validateMakeMultiSensorAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SENSOR_TRIGGER_LOG_SUCCESSFULL) {
                requestInfo.requestStatus                 = RequestSuccess;
                WiSeMakeMultiSensorAPIResponse * response = [WiSeSensorServicesResponseParser parseMakeMultiSensorAPIResponse:responseInfo];
                result                                    = response;
            }else {
                NSString * strErrorDes                    = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                      = [self getMakeMultiSensorFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                    = error;
            }
        }else {
            result = [self getMakeMultiSensorFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:MakeMultiSensorErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getMakeMultiSensorFailedErrorWithErrorDes:strErrorDes WithStatusCode:MakeMultiSensorErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getMakeMultiSensorFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:MakeMultiSensorFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


@end
