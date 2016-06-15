//
//  WiSeOperationServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 04/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeOperationServicesResponseValidater.h"
#import "WiSeOperationServicesResponseParser.h"
#import "WiSeNetworkUtil.h"

#import "WiSeUpdateDirectOperationStatusAPIResponse.h"
#import "WiSeRequestForRemoteOperationAPIResponse.h"
#import "WiSeUpdateRemoteOperationFeedbackAPIResponse.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>



@implementation WiSeOperationServicesResponseValidater

# pragma mark --- Update Direct Operation Status ---

+ (id ) validateUpdateDirectOperationStatusResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == DEVICE_OPERATION_LOGGED) {
                requestInfo.requestStatus                             = RequestSuccess;
                WiSeUpdateDirectOperationStatusAPIResponse * response = [WiSeOperationServicesResponseParser parseUpdateDirectOperationStatusAPIResponse:responseInfo];
                result                                                = response;
            }else {
                NSString * strErrorDes                                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                                  = [self getUpdateDirectOperationStatusFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                                = error;
            }
        }else {
            result = [self getUpdateDirectOperationStatusFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateDirectOperationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getUpdateDirectOperationStatusFailedErrorWithErrorDes:strErrorDes WithStatusCode:UpdateDirectOperationErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getUpdateDirectOperationStatusFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:UpdateDirectOperationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Request For Remote Operation ---

+ (id ) validateRequestForRemoteOperationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == DEVICE_OPERATION_LOGGED) {
                requestInfo.requestStatus                           = RequestSuccess;
                WiSeRequestForRemoteOperationAPIResponse * response = [WiSeOperationServicesResponseParser parseRequestForRemoteOperationAPIResponse:responseInfo];
                result                                              = response;
            }else {
                NSString * strErrorDes                              = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                                = [self getUpdateRequestForRemoteOperationFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                              = error;
            }
        }else {
            result = [self getUpdateRequestForRemoteOperationFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:RequestForRemoteOperationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getUpdateRequestForRemoteOperationFailedErrorWithErrorDes:strErrorDes WithStatusCode:RequestForRemoteOperationErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getUpdateRequestForRemoteOperationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:RequestForRemoteOperationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Update Remote Operation Feedback ---

+ (id ) validateUpdateRemoteOperationFeedbackResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == DEVICE_OPERATION_UPDATED) {
                requestInfo.requestStatus                               = RequestSuccess;
                WiSeUpdateRemoteOperationFeedbackAPIResponse * response = [WiSeOperationServicesResponseParser parseUpdateRemoteOperationFeedbackAPIResponse:responseInfo];
                result                                                  = response;
            }else {
                NSString * strErrorDes                                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                                    = [self getUpdateUpdateRemoteOperationFeedbackFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                                  = error;
            }
        }else {
            result = [self getUpdateUpdateRemoteOperationFeedbackFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateRemoteOperationFeedbackErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getUpdateUpdateRemoteOperationFeedbackFailedErrorWithErrorDes:strErrorDes WithStatusCode:UpdateRemoteOperationFeedbackErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getUpdateUpdateRemoteOperationFeedbackFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:UpdateRemoteOperationFeedbackFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


@end
