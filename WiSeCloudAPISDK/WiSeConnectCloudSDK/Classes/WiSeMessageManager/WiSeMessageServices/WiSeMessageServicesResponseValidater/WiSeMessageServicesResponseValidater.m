//
//  WiSeMessageServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeMessageServicesResponseValidater.h"
#import "WiSeMessageServicesResponseParser.h"
#import "WiSeNetworkUtil.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>

#import "WiSeGetMessageHistoryAPIResponse.h"
#import "WiSeResetMessageQueueAPIResponse.h"
#import "WiSeMessageFetchAPIResponse.h"
#import "WiSeMessageStatusUpdateAPIResponse.h"
#import "WiSeNotificationStatusUpdateAPIResponse.h"
#import "WiSeCloudTrackingAlertAPIResponse.h"

@implementation WiSeMessageServicesResponseValidater

# pragma mark --- Get Message History        ---

+ (id ) validateGetMessageHistoryResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == RESET_MESSAGE_QUEUE_SUCCESSFULL) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeGetMessageHistoryAPIResponse * response = [WiSeMessageServicesResponseParser parseGetMessageHistoryAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getGetMessageHistoryFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getGetMessageHistoryFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetMessageHistoryErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getGetMessageHistoryFailedErrorWithErrorDes:strErrorDes WithStatusCode:GetMessageHistoryErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getGetMessageHistoryFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetMessageHistoryErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Reset Message Queue        ---

+ (id ) validateResetMessageQueueResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == RESET_MESSAGE_QUEUE_SUCCESSFULL) {
                requestInfo.requestStatus                   = RequestSuccess;
                WiSeGetMessageHistoryAPIResponse * response = [WiSeMessageServicesResponseParser parseGetMessageHistoryAPIResponse:responseInfo];
                result                                      = response;
            }else {
                NSString * strErrorDes                      = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                        = [self getResetMessageQueueFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                      = error;
            }
        }else {
            result = [self getResetMessageQueueFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:ResetMessageQueueErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getResetMessageQueueFailedErrorWithErrorDes:strErrorDes WithStatusCode:ResetMessageQueueErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getResetMessageQueueFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:ResetMessageQueueFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Message Fetch              ---

+ (id ) validateMessageFetchAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == GET_MESSAGE_SUCCESSFULL) {
                requestInfo.requestStatus              = RequestSuccess;
                WiSeMessageFetchAPIResponse * response = [WiSeMessageServicesResponseParser parseMessageFetchAPIResponse:responseInfo withRequestDetails:requestInfo];
                result                                 = response;
            }else {
                NSString * strErrorDes                 = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                   = [self getMessageFetchAPIFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                 = error;
            }
        }else {
            result = [self getMessageFetchAPIFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:MessageFetchErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getMessageFetchAPIFailedErrorWithErrorDes:strErrorDes WithStatusCode:MessageFetchErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getMessageFetchAPIFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:MessageFetchFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Message Status Update      ---

+ (id ) validateMessageStatusUpdateAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == MESSAGE_STATUS_UPDATE_SUCCESSFULL) {
                requestInfo.requestStatus                     = RequestSuccess;
                WiSeMessageStatusUpdateAPIResponse * response = [WiSeMessageServicesResponseParser parseMessageStatusUpdateAPIResponse:responseInfo];
                result                                        = response;
            }else {
                NSString * strErrorDes                        = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                          = [self getMessageStatusUpdateAPIFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                        = error;
            }
        }else {
            result = [self getMessageStatusUpdateAPIFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:MessageStatusUpdateErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getMessageStatusUpdateAPIFailedErrorWithErrorDes:strErrorDes WithStatusCode:MessageStatusUpdateErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getMessageStatusUpdateAPIFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:MessageStatusUpdateFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Notification Status Update ---

+ (id ) validateNotificationStatusUpdateAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == MESSAGE_STATUS_UPDATE_SUCCESSFULL) {
                requestInfo.requestStatus                          = RequestSuccess;
                WiSeNotificationStatusUpdateAPIResponse * response = [WiSeMessageServicesResponseParser parseNotificationStatusUpdateAPIResponse:responseInfo];
                result                                             = response;
            }else {
                NSString * strErrorDes                             = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                               = [self getNotificationStatusUpdateAPIFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                             = error;
            }
        }else {
            result = [self getNotificationStatusUpdateAPIFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:NotificaitonStatusUpdateErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getNotificationStatusUpdateAPIFailedErrorWithErrorDes:strErrorDes WithStatusCode:NotificaitonStatusUpdateErrorCode];
        result                 = error;
    }
    return result;

}

+ (WiSeAppError *) getNotificationStatusUpdateAPIFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:NotificationStatusUpdateFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Tracking Alerts ---

+ (id ) validateGetTrackingAlertsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == SUCCESS) {
                requestInfo.requestStatus                    = RequestSuccess;
                WiSeCloudTrackingAlertAPIResponse * response = [WiSeMessageServicesResponseParser parseGetTrackingAlertsAPIResponse:responseInfo];
                result                                       = response;
            }else {
                NSString * strErrorDes                       = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                         = [self getGetTrackingAlertsAPIFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                       = error;
            }
        }else {
            result = [self getGetTrackingAlertsAPIFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetTrackingAlertsErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getGetTrackingAlertsAPIFailedErrorWithErrorDes:strErrorDes WithStatusCode:GetTrackingAlertsErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getGetTrackingAlertsAPIFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetTrackingAlertFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

@end
