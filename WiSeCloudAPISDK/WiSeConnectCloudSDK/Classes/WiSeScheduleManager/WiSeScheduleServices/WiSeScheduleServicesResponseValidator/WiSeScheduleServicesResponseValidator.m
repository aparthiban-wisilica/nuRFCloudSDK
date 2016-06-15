//
//  WiSeScheduleServicesResponseValidator.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeScheduleServicesResponseValidator.h"
#import "WiSeScheduleServicesResponseParser.h"
#import "WiSeCloudScheduleResponse.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import "WiSeNetworkUtil.h"

@implementation WiSeScheduleServicesResponseValidator

# pragma mark --- Add Schedule ---

+ (id) validateAddScheduleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus            = RequestSuccess;
                WiSeCloudScheduleResponse * response = [WiSeScheduleServicesResponseParser parseAddScheduleAPIResponse:responseInfo];
                result                               = response;
            }else {
                NSString * strErrorDes               = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                               = [self getAddScheduleFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getAddScheduleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddScheduleErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getAddScheduleFailErrorWithErrorDes:strErrorDes WithStatusCode:AddScheduleErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getAddScheduleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:AddScheduleFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Edit Schedule ---

+ (id) validateEditScheduleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus            = RequestSuccess;
                WiSeCloudScheduleResponse * response = [WiSeScheduleServicesResponseParser parseEditScheduleAPIResponse:responseInfo];
                result                               = response;
            }else {
                NSString * strErrorDes               = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                               = [self getEditScheduleFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getEditScheduleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditScheduleErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getEditScheduleFailErrorWithErrorDes:strErrorDes WithStatusCode:EditScheduleErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getEditScheduleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:EditScheduleFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Delete Schedule ---

+ (id) validateDeleteScheduleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus            = RequestSuccess;
                WiSeCloudScheduleResponse * response = [WiSeScheduleServicesResponseParser parseDeleteScheduleAPIResponse:responseInfo];
                result                               = response;
            }else {
                NSString * strErrorDes               = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                               = [self getDeleteScheduleFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getDeleteScheduleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteScheduleErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getDeleteScheduleFailErrorWithErrorDes:strErrorDes WithStatusCode:DeleteScheduleErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getDeleteScheduleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteScheduleFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Schedule ---

+ (id) validateGetScheduleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus            = RequestSuccess;
                WiSeCloudScheduleResponse * response = [WiSeScheduleServicesResponseParser parseGetScheduleAPIResponse:responseInfo];
                result                               = response;
            }else {
                NSString * strErrorDes               = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                               = [self getGetScheduleFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetScheduleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetScheduleErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetScheduleFailErrorWithErrorDes:strErrorDes WithStatusCode:GetScheduleErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetScheduleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetScheduleFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

@end
