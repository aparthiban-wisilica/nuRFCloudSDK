//
//  WiSeInfantServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeInfantServicesResponseValidater.h"
#import "WiSeInfantServicesResponseParser.h"
#import "WiSeCloudInfantResponse.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import "WiSeNetworkUtil.h"

@implementation WiSeInfantServicesResponseValidater

# pragma mark --- Add Infant ---

+ (id) validateAddInfantResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus          = RequestSuccess;
                WiSeCloudInfantResponse * response = [WiSeInfantServicesResponseParser parseAddInfantAPIResponse:responseInfo];
                result                             = response;
            }else {
                NSString * strErrorDes             = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                             = [self getAddInfantFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getAddInfantFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddInfantErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getAddInfantFailErrorWithErrorDes:strErrorDes WithStatusCode:AddInfantErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getAddInfantFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode{
    return [WiSeNetworkUtil getErrorWithDomainName:AddInfantFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Edit Infant ---

+ (id) validateEditInfantResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudInfantResponse * response    = [WiSeInfantServicesResponseParser parseEditInfantAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getEditInfantFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getEditInfantFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditInfantErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getEditInfantFailErrorWithErrorDes:strErrorDes WithStatusCode:EditInfantErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getEditInfantFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode{
    return [WiSeNetworkUtil getErrorWithDomainName:
            EditInfantFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Delete Infant ---

+ (id) validateDeleteInfantResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudInfantResponse * response    = [WiSeInfantServicesResponseParser parseDeleteInfantAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getDeleteInfantFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getDeleteInfantFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteInfantErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getDeleteInfantFailErrorWithErrorDes:strErrorDes WithStatusCode:DeleteInfantErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getDeleteInfantFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode{
    return [WiSeNetworkUtil getErrorWithDomainName:
            DeleteInfantFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Get Infant ---

+ (id) validateGetInfantResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudInfantResponse * response    = [WiSeInfantServicesResponseParser parseGetInfantAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getGetInfantFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetInfantFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetInfantErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetInfantFailErrorWithErrorDes:strErrorDes WithStatusCode:GetInfantErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetInfantFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode{
    return [WiSeNetworkUtil getErrorWithDomainName:
            GetInfantFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Infant Tag Assocation ---

+ (id) validateInfantTagAssociationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudInfantResponse * response    = [WiSeInfantServicesResponseParser parseInfantTagAssociationAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getInfantTagAssociationFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getInfantTagAssociationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:InfantTagAssociationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getInfantTagAssociationFailErrorWithErrorDes:strErrorDes WithStatusCode:InfantTagAssociationErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getInfantTagAssociationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:
            InfantTagAssociationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Add Zone Rule ---

+ (id) validateAddRuleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudInfantResponse * response    = [WiSeInfantServicesResponseParser parseInfantTagAssociationAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getAddRuleFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getAddRuleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddRuleErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getAddRuleFailErrorWithErrorDes:strErrorDes WithStatusCode:AddRuleErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getAddRuleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:
            AddRuleFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Edit Zone Rule ---

+ (id) validateEditRuleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudInfantResponse * response    = [WiSeInfantServicesResponseParser parseInfantTagAssociationAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getEditRuleFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getEditRuleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditRuleErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getEditRuleFailErrorWithErrorDes:strErrorDes WithStatusCode:EditRuleErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getEditRuleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:
            AddRuleFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Infants From Organizations ---

+ (id) validateGetInfantFromOrganizationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudInfantResponse * response    = [WiSeInfantServicesResponseParser parseGetInfantsFromOrganizationAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getGetInfantFromOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetInfantFromOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetInfantsFromOrganizationsErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetInfantFromOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:GetInfantsFromOrganizationsErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetInfantFromOrganizationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode  {
    return [WiSeNetworkUtil getErrorWithDomainName:GetInfantFromOrganizationsFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Archived Infant ---

+ (id) validateGetArchivedInfantResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudInfantResponse * response    = [WiSeInfantServicesResponseParser parseGetArchivedInfantAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getGetArchivedInfantFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetArchivedInfantFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetArchivedInfantErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetArchivedInfantFailErrorWithErrorDes:strErrorDes WithStatusCode:GetArchivedInfantErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetArchivedInfantFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:
            GetArchivedInfantFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Infant Position ---

+ (id) validateGetInfantPositionResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudInfantResponse * response    = [WiSeInfantServicesResponseParser parseGetInfantPositionAPIResponse:responseInfo];
                result                                = response;
            }else {
                
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getGetInfantPositionFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetInfantPositionFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetInfantPositionErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetInfantPositionFailErrorWithErrorDes:strErrorDes WithStatusCode:GetInfantPositionErrorCode];
    }
    return result;

}

+ (WiSeAppError *) getGetInfantPositionFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:
            GetInfantPositionFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

@end
