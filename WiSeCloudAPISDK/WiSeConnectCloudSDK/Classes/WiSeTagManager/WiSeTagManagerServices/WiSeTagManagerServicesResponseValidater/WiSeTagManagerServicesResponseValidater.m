//
//  WiSeTagManagerServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeTagManagerServicesResponseValidater.h"
#import "WiSeTagManagerServicesResponseParser.h"
#import "WiSeCloudTagResponse.h"
#import "WiSeNetworkUtil.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>

@implementation WiSeTagManagerServicesResponseValidater

#pragma mark --- Add Tag ---

+ (id) validateAddTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus       = RequestSuccess;
                WiSeCloudTagResponse * response = [WiSeTagManagerServicesResponseParser parseAddTagAPIResponse:responseInfo];
                result                          = response;
            }else {

                NSString * strErrorDes          = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                          = [self getAddTagFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getAddTagFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddTagErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getAddTagFailErrorWithErrorDes:strErrorDes WithStatusCode:AddTagErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getAddTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:AddTagFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


#pragma mark --- Edit Tag ---

+ (id) validateEditTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudTagResponse * response       = [WiSeTagManagerServicesResponseParser parseEditTagAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getEditTagFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getEditTagFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditTagErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getEditTagFailErrorWithErrorDes:strErrorDes WithStatusCode:EditTagErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getEditTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:EditTagFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


#pragma mark --- Get Tag ---

+ (id) validateGetTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudTagResponse * response       = [WiSeTagManagerServicesResponseParser parseGetTagAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getGetTagFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetTagFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetTagErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetTagFailErrorWithErrorDes:strErrorDes WithStatusCode:GetTagErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetTagFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Get Archived Tag ---

+ (id) validateGetArchivedTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudTagResponse * response       = [WiSeTagManagerServicesResponseParser parseGetArchivedTagAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getGetArchivedTagFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetArchivedTagFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetArchivedTagErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetArchivedTagFailErrorWithErrorDes:strErrorDes WithStatusCode:GetArchivedTagErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetArchivedTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetArchivedTagFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Delete Tag ---

+ (id) validateDeleteTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudTagResponse * response       = [WiSeTagManagerServicesResponseParser parseDeleteTagAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getGetDeleteFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetDeleteFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteTagErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetDeleteFailErrorWithErrorDes:strErrorDes WithStatusCode:DeleteTagErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetDeleteFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteTagFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Secure Tag ---

+ (id) validateSecureTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudTagResponse * response       = [WiSeTagManagerServicesResponseParser parseSecureTagAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getSecureTagFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getSecureTagFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SecureTagErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getSecureTagFailErrorWithErrorDes:strErrorDes WithStatusCode:SecureTagErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getSecureTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:SecureTagFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Delete Secure Tag ---

+ (id) validateDeleteSecureTagResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudTagResponse * response       = [WiSeTagManagerServicesResponseParser parseSecureTagAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getDeleteSecureTagFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getDeleteSecureTagFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteSecureTagErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getDeleteSecureTagFailErrorWithErrorDes:strErrorDes WithStatusCode:DeleteSecureTagErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getDeleteSecureTagFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteSecureTagFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Check Tag ---

+ (id) validateTagCheckResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudTagResponse * response       = [WiSeTagManagerServicesResponseParser parseAddTagAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getTagCheckFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getTagCheckFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:TagCheckErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getTagCheckFailErrorWithErrorDes:strErrorDes WithStatusCode:TagCheckErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getTagCheckFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:CheckTagFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


@end
