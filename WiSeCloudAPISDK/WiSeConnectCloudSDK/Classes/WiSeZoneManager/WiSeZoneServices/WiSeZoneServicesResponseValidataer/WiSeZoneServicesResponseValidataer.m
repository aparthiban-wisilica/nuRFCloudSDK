//
//  WiSeZoneServicesResponseValidataer.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 22/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeZoneServicesResponseValidataer.h"
#import "WiSeZoneServicesResponseParser.h"
#import "WiSeCloudZoneAPIResponse.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import "WiSeNetworkUtil.h"

@implementation WiSeZoneServicesResponseValidataer

# pragma mark --- Add Zone ---

+ (id) validateAddZoneResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus           = RequestSuccess;
                WiSeCloudZoneAPIResponse * response = [WiSeZoneServicesResponseParser parseAddZoneAPIResponse:responseInfo];
                result                              = response;
            }else {
                NSString * strErrorDes              = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                              = [self getAddZoneFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getAddZoneFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddZoneErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getAddZoneFailErrorWithErrorDes:strErrorDes WithStatusCode:AddZoneErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getAddZoneFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:AddZoneFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Edit Zone ---

+ (id) validateEditZoneResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus           = RequestSuccess;
                WiSeCloudZoneAPIResponse * response = [WiSeZoneServicesResponseParser parseEditZoneAPIResponse:responseInfo];
                result                              = response;
            }else {
                NSString * strErrorDes              = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                              = [self getEditZoneFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getEditZoneFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditZoneErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getEditZoneFailErrorWithErrorDes:strErrorDes WithStatusCode:EditZoneErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getEditZoneFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:EditZoneFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Delete Zone ---

+ (id) validateDeleteZoneResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus           = RequestSuccess;
                WiSeCloudZoneAPIResponse * response = [WiSeZoneServicesResponseParser parseDeleteZoneAPIResponse:responseInfo];
                result                              = response;
            }else {
                NSString * strErrorDes              = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                              = [self getDeleteZoneFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getDeleteZoneFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteZoneErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getDeleteZoneFailErrorWithErrorDes:strErrorDes WithStatusCode:DeleteZoneErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getDeleteZoneFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteZoneFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Zone ---

+ (id) validateGetZoneResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus           = RequestSuccess;
                WiSeCloudZoneAPIResponse * response = [WiSeZoneServicesResponseParser parseGetZoneAPIResponse:responseInfo];
                result                              = response;
            }else {
                NSString * strErrorDes              = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                              = [self getGetZoneFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetZoneFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetZoneErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetZoneFailErrorWithErrorDes:strErrorDes WithStatusCode:GetZoneErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetZoneFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetZoneFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Archived Zone ---

+ (id) validateGetArchivedZoneResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus           = RequestSuccess;
                WiSeCloudZoneAPIResponse * response = [WiSeZoneServicesResponseParser parseGetZoneAPIResponse:responseInfo];
                result                              = response;
            }else {
                NSString * strErrorDes              = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                              = [self getGetArchivedZoneFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetArchivedZoneFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetArchivedZoneErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetArchivedZoneFailErrorWithErrorDes:strErrorDes WithStatusCode:GetArchivedZoneErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetArchivedZoneFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetArchivedZoneFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Zones From Organizations ---

+ (id) validateGetZonesFromOrganizationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus           = RequestSuccess;
                WiSeCloudZoneAPIResponse * response = [WiSeZoneServicesResponseParser parseGetZonesFromOrganizationAPIResponse:responseInfo];
                result                              = response;
            }else {
                NSString * strErrorDes              = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                              = [self getGetZonesFromOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetZonesFromOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetZoneFromOrganizationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetZonesFromOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:GetZoneFromOrganizationErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetZonesFromOrganizationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetZoneFromOrganizationsFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Zone Listener Mappping ---

+ (id) validateGetZoneListenerMappingResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus           = RequestSuccess;
                WiSeCloudZoneAPIResponse * response = [WiSeZoneServicesResponseParser parseGetZoneAPIResponse:responseInfo];
                result                              = response;
            }else {
                NSString * strErrorDes              = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                              = [self getGetZoneListenerMappingFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetZoneListenerMappingFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetZoneListenerMappingErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetZoneListenerMappingFailErrorWithErrorDes:strErrorDes WithStatusCode:GetZoneListenerMappingErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetZoneListenerMappingFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetZoneListenerMappingFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Map Zone Listener Mappping ---

+ (id) validateMapZoneListenerResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus           = RequestSuccess;
                WiSeCloudZoneAPIResponse * response = [WiSeZoneServicesResponseParser parseMapZoneListenerAPIResponse:responseInfo];
                result                              = response;
            }else {
                NSString * strErrorDes              = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                              = [self getMapZoneListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getMapZoneListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:MapZoneAndListenerErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getMapZoneListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:MapZoneAndListenerErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getMapZoneListenerFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:MapZoneListenerFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

@end
