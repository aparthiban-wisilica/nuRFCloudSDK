//
//  WiSeAppServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAppServicesResponseValidater.h"
#import "WiSeAppServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import "WiSeNetworkUtil.h"
#import "WiSeRegisterAppInfoAPIResponse.h"

@implementation WiSeAppServicesResponseValidater

#pragma mark - Save App Info

+ (id) validateRegisterAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeRegisterAppInfoAPIResponse * response = [WiSeAppServicesResponseParser parseSaveAppInfoAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error   = [self getSaveAPPInfoErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                 = error;
            }
        }else {
            result = [self getSaveAPPInfoErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:SaveAppInfoErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getSaveAPPInfoErrorWithErrorDes:strErrorDes WithStatusCode:SaveAppInfoErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getSaveAPPInfoErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:SaveAppInfoFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark - Update Save App Info

+ (id ) validateUpdateRegisterAppResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus = RequestSuccess;
                WiSeRegisterAppInfoAPIResponse * response = [WiSeAppServicesResponseParser parseSaveAppInfoAPIResponse:responseInfo];
                result = response;
            }else {
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error = [self getUpdateSaveAPPInfoErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result = error;
            }
        }else {
            result = [self getUpdateSaveAPPInfoErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateSaveAppInfoErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getUpdateSaveAPPInfoErrorWithErrorDes:strErrorDes WithStatusCode:UpdateSaveAppInfoErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getUpdateSaveAPPInfoErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:UpdateSaveAppInfoFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


@end
