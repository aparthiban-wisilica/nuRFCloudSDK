//
//  WiSeDeviceServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 29/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeDeviceServicesResponseValidater.h"
#import "WiSeDeviceServicesResponseParser.h"
#import "WiSeCloudDeviceAPIResponse.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudListenerAPIResponse.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>

@implementation WiSeDeviceServicesResponseValidater

#pragma mark --- Add Device ---

+ (id) validateAddDeviceResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == ADD_DEVICE_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudDeviceAPIResponse * response = [WiSeDeviceServicesResponseParser parseAddDeviceAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getAddDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getAddDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddDeviceErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result                 = [self getAddDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:AddDeviceErrorCode];
    }
    return result;

}

+ (WiSeAppError *) getAddDeviceFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
     return [WiSeNetworkUtil getErrorWithDomainName:AddDeviceFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Edit Device ---

+ (id) validateEditDeviceResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == EDIT_DEVICE_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudDeviceAPIResponse * response = [WiSeDeviceServicesResponseParser parseEditDeviceAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getEditDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getEditDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditDeviceErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result                 = [self getEditDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:EditDeviceErrorCode];
    }
    return result;

}

+ (WiSeAppError *) getEditDeviceFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:EditDeviceFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Delete Device ---

+ (id) validateDeleteDeviceResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == DEVICE_DELETE_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudDeviceAPIResponse * response = [WiSeDeviceServicesResponseParser parseDeleteDeviceAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getDeleteDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getDeleteDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteFriendErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getDeleteDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:DeleteFriendErrorCode];
    }
    return result;

}

+ (WiSeAppError *) getDeleteDeviceFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteDeviceFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Get A Device ---

+ (id) validateGetADeviceResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    return nil;
}

+ (WiSeAppError *) getADeviceFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetADeviceFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Get All Device ---

+ (id) validateGetAllDeviceResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == DEVICE_GET_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudDeviceAPIResponse * response = [WiSeDeviceServicesResponseParser parseGetAllDeviceAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getAllDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getAllDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetAllDeviceErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getAllDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:GetAllDeviceErrorCode];
    }
    return result;

}

+ (WiSeAppError *) getAllDeviceFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetAllDeviceFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];

}

#pragma mark --- Device Group Association ---

+ (id) validateDeviceGroupAssociationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == DEVICE_GET_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudDeviceAPIResponse * response = [WiSeDeviceServicesResponseParser parseDeviceGroupAssociationAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getDeviceGroupAssociationFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getDeviceGroupAssociationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeviceGroupAssociationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getDeviceGroupAssociationFailErrorWithErrorDes:strErrorDes WithStatusCode:DeviceGroupAssociationErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getDeviceGroupAssociationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeviceGroupAssociationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Get Secure Devices ---

+ (id) validateGetSecureDeviceResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == DEVICE_GET_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudDeviceAPIResponse * response = [WiSeDeviceServicesResponseParser parseAddDeviceAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getSecureDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getSecureDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetSecureDeviceErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getSecureDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:GetSecureDeviceErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getSecureDeviceFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:SecureDevicePairingFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark ---  Clear Secure Devices ---

+ (id) validateClearSecureDeviceResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == DEVICE_GET_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudDeviceAPIResponse * response = [WiSeDeviceServicesResponseParser parseAddDeviceAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getClearSecureDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getClearSecureDeviceFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:ClearSecureDeviceErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getClearSecureDeviceFailErrorWithErrorDes:strErrorDes WithStatusCode:ClearSecureDeviceErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getClearSecureDeviceFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:ClearSecureDevicePairingFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Get Device Group Association ---

+ (id) validateGetDeviceGroupAssociationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == DEVICE_GET_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudDeviceAPIResponse * response = [WiSeDeviceServicesResponseParser parseGetDeviceGroupAssociationAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                = [self getGetDeviceGroupAssociationFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetDeviceGroupAssociationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetDeviceGroupAssociationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetDeviceGroupAssociationFailErrorWithErrorDes:strErrorDes WithStatusCode:GetDeviceGroupAssociationErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetDeviceGroupAssociationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetDeviceGroupAssociationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Get Listeners ---

+ (id) validateGetListenerResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudListenerAPIResponse * response = [WiSeDeviceServicesResponseParser parseGetListenerAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                  = [self getGetListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetListenerErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:GetListenerErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetListenerFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetListenerFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Get Listeners Zone Mapping---

+ (id) validateGetListenerZoneMappingResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudListenerAPIResponse * response = [WiSeDeviceServicesResponseParser parseGetListenerZoneMappingAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                  = [self getGetListenerZoneMappingFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetListenerZoneMappingFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetListenerZoneMappingErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetListenerZoneMappingFailErrorWithErrorDes:strErrorDes WithStatusCode:GetListenerZoneMappingErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetListenerZoneMappingFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetListenerZoneMappingFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Listeners From Organizations ---

+ (id) validateGetListenersFromOrganizationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudListenerAPIResponse * response = [WiSeDeviceServicesResponseParser parseGetListenersFromOrganizationAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                  = [self getGetListenersFromOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetListenersFromOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetListenerFromOrganizationsErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetListenersFromOrganizationFailErrorWithErrorDes:strErrorDes WithStatusCode:GetListenerFromOrganizationsErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getGetListenersFromOrganizationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetListenerFromOrganizationsFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Add Secure Listeners ---

+ (id) validateAddSecureListenerResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudListenerAPIResponse * response = [WiSeDeviceServicesResponseParser parseAddSecureListenerAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                  = [self getAddSecureListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getAddSecureListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddSecureListenerErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getAddSecureListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:AddSecureListenerErrorCode];
    }
    return result;

}

+ (WiSeAppError *) getAddSecureListenerFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
   return [WiSeNetworkUtil getErrorWithDomainName:AddSecureListenerFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Delete Secure Listeners ---

+ (id) validateDeleteSecureListenerResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudListenerAPIResponse * response = [WiSeDeviceServicesResponseParser parseAddSecureListenerAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                  = [self getDeleteSecureListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getDeleteSecureListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteSecureListenerErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getDeleteSecureListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:DeleteSecureListenerErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getDeleteSecureListenerFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteSecureListenerFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Add Listeners ---

+ (id) validateAddListenerResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudListenerAPIResponse * response = [WiSeDeviceServicesResponseParser parseAddListenerAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                  = [self getAddListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getAddListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddListenerErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getAddListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:AddListenerErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getAddListenerFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:AddListenerFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Edit Listeners ---

+ (id) validateEditListenerResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudListenerAPIResponse * response = [WiSeDeviceServicesResponseParser parseEditListenerAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                  = [self getEditListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getEditListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditListenerErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getEditListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:EditListenerErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getEditListenerFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:EditListenerFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Delete Listeners ---

+ (id) validateDeleteListenerResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudListenerAPIResponse * response = [WiSeDeviceServicesResponseParser parseDeleteListenerAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                  = [self getDeleteListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getDeleteListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteListenerErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getDeleteListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:DeleteListenerErrorCode];
    }
    return result;
}

+ (WiSeAppError *) getDeleteListenerFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteListenerFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

#pragma mark --- Get Listeners Archive ---

+ (id) validateGetArchivedListenerResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudListenerAPIResponse * response = [WiSeDeviceServicesResponseParser parseGetListenerAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                result                                  = [self getGetArchivedListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
            }
        }else {
            result = [self getGetArchivedListenerFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetArchivedListenerErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        result = [self getGetArchivedListenerFailErrorWithErrorDes:strErrorDes WithStatusCode:GetArchivedListenerErrorCode];
    }
    return result;

}

+ (WiSeAppError *) getGetArchivedListenerFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetArchivedListenerFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

@end
