//
//  WiSeGroupServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 28/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeGroupServicesResponseValidater.h"
#import "WiSeGroupServicesResponseParser.h"
#import "WiSeCloudGroupAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>

@implementation WiSeGroupServicesResponseValidater

#pragma mark - Add Group

+ (id) validateAddGroupResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == ADD_GROUP_SUCCESSFULL) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeCloudGroupAPIResponse * response = [WiSeGroupServicesResponseParser parseAddGroupAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result = [self getAddGroupFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getAddGroupFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddGroupErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getAddGroupFailErrorWithErrorDes:strErrorDes WithStatusCode:AddGroupErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getAddGroupFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:AddGroupErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark - Edit Group

+ (id) validateEditGroupResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == EDIT_GROUP_SUCCESSFULL) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeCloudGroupAPIResponse * response = [WiSeGroupServicesResponseParser parseEditGroupAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error = [self getEditGroupFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result = error;
            }
        }else {
            result = [self getEditGroupFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditGroupErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getEditGroupFailErrorWithErrorDes:strErrorDes WithStatusCode:EditGroupErrorCode];
        result = error;
    }
    return result;

}

+ (WiSeAppError *) getEditGroupFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:EditGroupErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark - Delete Group

+ (id) validateDeleteGroupResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == DELETE_GROUP_SUCCESSFULL) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeCloudGroupAPIResponse * response = [WiSeGroupServicesResponseParser parseDeleteGroupAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error = [self getDeleteGroupFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result = error;
            }
        }else {
            result = [self getDeleteGroupFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteGroupErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getDeleteGroupFailErrorWithErrorDes:strErrorDes WithStatusCode:DeleteGroupErrorCode];
        result = error;
    }
    return result;

}

+ (WiSeAppError *) getDeleteGroupFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteGroupFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark - Get Group

+ (id) validateGetGroupResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == GET_GROUP_SUCCESSFULL) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeCloudGroupAPIResponse * response = [WiSeGroupServicesResponseParser parseGetGroupAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error = [self getGetGroupFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result = error;
            }
        }else {
            result = [self getGetGroupFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetGroupErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error = [self getGetGroupFailErrorWithErrorDes:strErrorDes WithStatusCode:GetGroupErrorCode];
        result = error;
    }
    return result;
}


+ (WiSeAppError *) getGetGroupFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetGroupErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

@end
