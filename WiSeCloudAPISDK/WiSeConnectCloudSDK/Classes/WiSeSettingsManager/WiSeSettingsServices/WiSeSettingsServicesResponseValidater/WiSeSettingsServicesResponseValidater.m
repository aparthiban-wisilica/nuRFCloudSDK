//
//  WiSeSettingsServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSettingsServicesResponseValidater.h"
#import "WiSeSettingsServicesResponseParser.h"
#import "WiSeNetworkUtil.h"

#import "WiSeBridgeSet_RemoveAPIResponse.h"
#import "WiSeCloudSubscriptionAPIResponse.h"
#import "WiSeHealthCheckAPIResponse.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>

@implementation WiSeSettingsServicesResponseValidater

#pragma mark - Bridge Set and Remove

+ (id ) validateBridgeSet_RemoveApiResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SET_BRIDGE_SUCCESSFULL) {
                requestInfo.requestStatus                             = RequestSuccess;
                WiSeBridgeSet_RemoveAPIResponse * response            = [WiSeSettingsServicesResponseParser parseBridgeSet_RemoveAPIResponse:responseInfo];
                result                                                = response;
            }else {
                NSString * strErrorDes                                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                                  = [self getBridgeSet_RemoveApiFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                                = error;
            }
        }else {
            result = [self getBridgeSet_RemoveApiFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:BridgeSet_RemoveErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getBridgeSet_RemoveApiFailedErrorWithErrorDes:strErrorDes WithStatusCode:BridgeSet_RemoveErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getBridgeSet_RemoveApiFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:BridgeSet_RemoveFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Create/Update Subscription ---

+ (id ) validateCreateUpdateSubscriptionResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == CREATE_UPDATE_SUBCRIPTION_SUCCESSFULL) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeCloudSubscriptionAPIResponse * response = [WiSeSettingsServicesResponseParser parseCreateUpdateSubscriptionAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getCreateUpdateSubscriptionFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getCreateUpdateSubscriptionFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:CreateUpdateSubscriptionErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getCreateUpdateSubscriptionFailedErrorWithErrorDes:strErrorDes WithStatusCode:CreateUpdateSubscriptionErrorCode];
        result                 = error;
    }
    return result;
    
}

+ (WiSeAppError *) getCreateUpdateSubscriptionFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:CreateUpdateSubscriptionFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Subscription ---

+ (id ) validateGetSubscriptionResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == GET_SUBCRIPTION_SUCCESSFULL) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeCloudSubscriptionAPIResponse * response = [WiSeSettingsServicesResponseParser parseGetSubscriptionAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getGetSubscriptionFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getGetSubscriptionFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetSubcriptionErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getGetSubscriptionFailedErrorWithErrorDes:strErrorDes WithStatusCode:GetSubcriptionErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getGetSubscriptionFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetSubscriptionFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Health Check ---

+ (id ) validateHealthCheckResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == GET_SUBCRIPTION_SUCCESSFULL) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeHealthCheckAPIResponse * response       = [WiSeSettingsServicesResponseParser parseHealthCheckAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getHealthCheckFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getHealthCheckFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:HealthCheckErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getHealthCheckFailedErrorWithErrorDes:strErrorDes WithStatusCode:HealthCheckErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getHealthCheckFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:HealthCheckFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


@end
