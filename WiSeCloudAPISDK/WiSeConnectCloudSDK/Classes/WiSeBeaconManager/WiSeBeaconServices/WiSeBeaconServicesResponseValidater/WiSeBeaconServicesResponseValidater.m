//
//  WiSeBeaconServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeBeaconServicesResponseValidater.h"
#import "WiSeBeaconServicesResponseParser.h"
#import "WiSeNetworkUtil.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>

#import "WiSeCloudBeaconAPIResponse.h"

@implementation WiSeBeaconServicesResponseValidater

# pragma mark --- Add Beacon                ---

+ (id ) validateAddBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == ADD_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseAddBeaconAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getAddBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getAddBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddBeaconErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getAddBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:AddBeaconErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getAddBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:AddBeaconFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Edit Beacon               ---

+ (id ) validateEditBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == EDIT_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseEditBeaconAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getEditBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getEditBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditBeaconErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getEditBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:EditBeaconErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getEditBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:EditBeaconFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Delete Beacon             ---

+ (id ) validateDeleteBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == DELETE_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseDeleteBeaconAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getDeleteBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getDeleteBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteBeaconErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getDeleteBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:DeleteBeaconErrorCode];
        result                 = error;
    }
    return result;
    
}

+ (WiSeAppError *) getDeleteBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteBeaconFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Get Beacon                ---

+ (id ) validateGetBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == GET_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseGetBeaconAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getGetBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getGetBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetBeaconErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getGetBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:GetBeaconErrorCode];
        result                 = error;
    }
    return result;
    
}


+ (WiSeAppError *) getGetBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetBeaconFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}



# pragma mark --- Add Configured Beacon     ---

+ (id ) validateAddConfiguredBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == ADD_CONFIGURED_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseAddConfiguredBeaconAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getAddConfiguredBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getAddConfiguredBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddConfiguredBeaconErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getAddConfiguredBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:AddConfiguredBeaconErrorCode];
        result                 = error;
    }
    return result;

}


+ (WiSeAppError *) getAddConfiguredBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:AddConfiguredBeaconFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Edit Configured Beacon    ---

+ (id ) validateEditConfiguredBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == EDIT_CONFIGURED_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseEditConfiguredBeaconAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getEditConfiguredBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getEditConfiguredBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditConfiguredBeaconErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getEditConfiguredBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:EditConfiguredBeaconErrorCode];
        result                 = error;
    }
    return result;

}


+ (WiSeAppError *) getEditConfiguredBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:EditConfiguredBeaconFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Delete Configured Beacon  ---

+ (id ) validateDeleteConfiguredBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == DELETE_CONFIGURED_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseDeleteConfiguredBeaconAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getDeleteConfiguredBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getDeleteConfiguredBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteConfiguredBeaconErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getDeleteConfiguredBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:DeleteConfiguredBeaconErrorCode];
        result                 = error;
    }
    return result;
    
}


+ (WiSeAppError *) getDeleteConfiguredBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteConfiguredBeaconFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Get Configured Beacon     ---

+ (id ) validateGetConfiguredBeaconResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == GET_CONFIGURED_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseGetConfiguredBeaconAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getGetConfiguredBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getGetConfiguredBeaconFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetConfiguredBeaconErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getGetConfiguredBeaconFailedErrorWithErrorDes:strErrorDes WithStatusCode:GetConfiguredBeaconErrorCode];
        result                 = error;
    }
    return result;

}


+ (WiSeAppError *) getGetConfiguredBeaconFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetConfiguredBeaconFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Create Beacon Association ---

+ (id ) validateCreateBeaconAssociationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == CREATE_DEVICE_BEACON_ASSOCIATION_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseCreateBeaconAssociationAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getCreateBeaconAssociationFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getCreateBeaconAssociationFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:CreateDeviceBeaconAssociationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getCreateBeaconAssociationFailedErrorWithErrorDes:strErrorDes WithStatusCode:CreateDeviceBeaconAssociationErrorCode];
        result                 = error;
    }
    return result;

}


+ (WiSeAppError *) getCreateBeaconAssociationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:CreateDeviceBeaconAssociationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


# pragma mark --- Get Beacon Association    ---

+ (id ) validateGetBeaconAssociationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == GET_DEVICE_BEACON_ASSOCIATION_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseGetBeaconAssociationAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getGetBeaconAssociationFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getGetBeaconAssociationFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetDeviceBeaconAssociationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getGetBeaconAssociationFailedErrorWithErrorDes:strErrorDes WithStatusCode:GetDeviceBeaconAssociationErrorCode];
        result                 = error;
    }
    return result;

}


+ (WiSeAppError *) getGetBeaconAssociationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetDeviceBeaconAssociationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}



# pragma mark --- Delete Beacon Association ---

+ (id ) validateDeleteBeaconAssociationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == RESET_MESSAGE_QUEUE_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseDeleteBeaconAssociationAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getDeleteBeaconAssociationFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getDeleteBeaconAssociationFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteDeviceBeaconAssociationErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getDeleteBeaconAssociationFailedErrorWithErrorDes:strErrorDes WithStatusCode:DeleteDeviceBeaconAssociationErrorCode];
        result                 = error;
    }
    return result;

}


+ (WiSeAppError *) getDeleteBeaconAssociationFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:DeleteDeviceBeaconAssociationFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark ---Update Beacon Battery Status --- 


+ (id ) validateUpdateBeaconBatteryStatusResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == UPDATE_BEACON_BATTERY_STATUS_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseUpdateBeaconBatteryStatusAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getUpdateBeaconBatteryStatusFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getUpdateBeaconBatteryStatusFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconBatteryLevelErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getUpdateBeaconBatteryStatusFailedErrorWithErrorDes:strErrorDes WithStatusCode:UpdateBeaconBatteryLevelErrorCode];
        result                 = error;
    }
    return result;
 
}

+ (WiSeAppError *) getUpdateBeaconBatteryStatusFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:UpdateBeaconBatteryLevelFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Update Beacon Data Log ---

+ (id ) validateUpdateBeaconDataLogResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == UPDATE_BEACON_DATA_LOG_SUCCESSFULL) {
                requestInfo.requestStatus             = RequestSuccess;
                WiSeCloudBeaconAPIResponse * response = [WiSeBeaconServicesResponseParser parseUpdateBeaconDataLogAPIResponse:responseInfo];
                result                                = response;
            }else {
                NSString * strErrorDes                = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                  = [self getUpdateBeaconDataLogFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                = error;
            }
        }else {
            result = [self getUpdateBeaconDataLogFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:UpdateBeaconDataLogErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getUpdateBeaconDataLogFailedErrorWithErrorDes:strErrorDes WithStatusCode:UpdateBeaconDataLogErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getUpdateBeaconDataLogFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:UpdateBeaconDatatLogFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


@end
