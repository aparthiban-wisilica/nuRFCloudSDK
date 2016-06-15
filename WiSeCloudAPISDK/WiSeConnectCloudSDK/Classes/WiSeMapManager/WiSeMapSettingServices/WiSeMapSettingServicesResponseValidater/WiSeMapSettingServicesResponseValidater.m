//
//  WiSeMapSettingServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeMapSettingServicesResponseValidater.h"
#import "WiSeMapSettingServicesResponseParser.h"
#import "WiSeCloudZoneAPIResponse.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import "WiSeNetworkUtil.h"
#import "WiSeCloudMapAPIResponse.h"

@implementation WiSeMapSettingServicesResponseValidater

#pragma mark --- Get Map Settings ---

+ (id) validateGetMapSettingsResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus          = RequestSuccess;
                WiSeCloudMapAPIResponse * response = [WiSeMapSettingServicesResponseParser parseGetMapSettingsAPIResponse:responseInfo];
                result                             = response;
            }else {
                NSString * strErrorDes             = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                             = [self getGetMapSettingsFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetMapSettingsFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetMapSettingsErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetMapSettingsFailErrorWithErrorDes:strErrorDes WithStatusCode:GetMapSettingsErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetMapSettingsFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
     return [WiSeNetworkUtil getErrorWithDomainName:GetMapSettingsFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

@end
