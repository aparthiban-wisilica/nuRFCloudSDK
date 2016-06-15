//
//  WiSeOrganizationServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeOrganizationServicesResponseValidater.h"
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import "WiSeNetworkUtil.h"

#import "WiSeCloudOrganizationResponse.h"
#import "WiSeOrganizationServicesResponseParser.h"

@implementation WiSeOrganizationServicesResponseValidater

#pragma mark --- Add Sub Organization ---

+ (id) validateAddOrganizationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus                = RequestSuccess;
                WiSeCloudOrganizationResponse * response = [WiSeOrganizationServicesResponseParser parseAddOrganizationAPIResponse:responseInfo];
                result                                   = response;
            }else {

                NSString * strErrorDes                   = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                   = [self getAddOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getAddOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddOrganizationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result                 = [self getAddOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:AddOrganizationErrorCode];
    }
    return result;

}
+ (WiSeAppError *) getAddOrganizationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:AddOrganizationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];;
}


#pragma mark --- Edit Sub Organization ---

+ (id) validateEditOrganizationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus                = RequestSuccess;
                WiSeCloudOrganizationResponse * response = [WiSeOrganizationServicesResponseParser parseEditOrganizationAPIResponse:responseInfo];
                result                                   = response;
            }else {

                NSString * strErrorDes                   = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                   = [self getEditOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getEditOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditOrganizationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result                 = [self getEditOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:EditOrganizationErrorCode];
    }
    return result;

}

+ (WiSeAppError *) getEditOrganizationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:EditOrganizationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


#pragma mark --- Get Sub Organization ---

+ (id) validateGetOrganizationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus                = RequestSuccess;
                WiSeCloudOrganizationResponse * response = [WiSeOrganizationServicesResponseParser parseGetOrganizationAPIResponse:responseInfo];
                result                                   = response;
            }else {

                NSString * strErrorDes                   = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                   = [self getOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetOrganizationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result                 = [self getOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:GetOrganizationErrorCode];
    }
    return result;

}

+ (WiSeAppError *) getOrganizationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetOrganizationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


#pragma mark --- Delete Sub Organization ---

+ (id) validateDeleteOrganizationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudOrganizationResponse * response = [WiSeOrganizationServicesResponseParser parseDeleteOrganizationAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getDeleteOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getDeleteOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteOrganizationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result                 = [self getDeleteOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:DeleteOrganizationErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getDeleteOrganizationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteOrganizationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

@end
