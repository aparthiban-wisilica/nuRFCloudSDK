//
//  WiSeAlertServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAlertServicesResponseValidater.h"
#import "WiSeAlertServicesResponseParser.h"
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import "WiSeNetworkUtil.h"

#import "WiSeCloudSnoozeSettingResponse.h"
#import "WiSeCheckOutResponse.h"
#import "WiSeSelfAssignResetAPIResponse.h"

@implementation WiSeAlertServicesResponseValidater

#pragma mark --- Set/Upadate Snooze Timing ---

+ (id) validateSetUpdateSnoozeTimingResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus                 = RequestSuccess;
                WiSeCloudSnoozeSettingResponse * response = [WiSeAlertServicesResponseParser parseSetUpdateSnoozeTimingAPIResponse:responseInfo];
                result                                    = response;
            }else {
                NSString * strErrorDes                    = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                    = [self getSetUpdateSnoozeTimingFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getSetUpdateSnoozeTimingFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SetUpdateSnoozeTimingErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getSetUpdateSnoozeTimingFailErrorWithErrorDes:strErrorDes WithStatusCode:SetUpdateSnoozeTimingErrorCode];
    }
    return result;

}

+ (WiSeAppError *) getSetUpdateSnoozeTimingFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:SetUpdateSnoozeTimingFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];;
}

#pragma mark --- Enable/Disable CheckOut API Time ---

+ (id) validateEnableDisableCheckOutResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus       = RequestSuccess;
                WiSeCheckOutResponse * response = [WiSeAlertServicesResponseParser parseEnableDisableCheckOutAPIResponse:responseInfo];
                result                          = response;
            }else {

                NSString * strErrorDes          = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                          = [self getEnableDisableCheckOutFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getEnableDisableCheckOutFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:CheckOutErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getEnableDisableCheckOutFailErrorWithErrorDes:strErrorDes WithStatusCode:CheckOutErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getEnableDisableCheckOutFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:EnableDisableCheckOutFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];;
}

#pragma mark --- Self Assign-Assign Reset API ---

+ (id) validateSelfAssignResetResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus                 = RequestSuccess;
                WiSeSelfAssignResetAPIResponse * response = [WiSeAlertServicesResponseParser parseSelfAssignResetAPIResponse:responseInfo];
                result                                    = response;
            }else {
                NSString * strErrorDes                    = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                    = [self getSelfAssignResetFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getSelfAssignResetFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SelfAssignResetErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getSelfAssignResetFailErrorWithErrorDes:strErrorDes WithStatusCode:SelfAssignResetErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getSelfAssignResetFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:SelfAssignResetFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];;
}

@end
