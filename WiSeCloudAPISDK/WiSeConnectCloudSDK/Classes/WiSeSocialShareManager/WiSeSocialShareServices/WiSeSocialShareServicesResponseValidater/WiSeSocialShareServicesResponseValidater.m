//
//  WiSeSocialShareServicesResponseValidater.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSocialShareServicesResponseValidater.h"
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>

#import "WiSeSocialShareServicesResponseParser.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudSocialShareResponse.h"

@implementation WiSeSocialShareServicesResponseValidater

# pragma mark --- Add Friends                     ---

+ (id ) validateAddFriendsResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == ADD_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudSocialShareResponse * response = [WiSeSocialShareServicesResponseParser parseAddFriendsAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                    = [self getAddFriendsFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                  = error;
            }
        }else {
            result = [self getAddFriendsFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddFriendsErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getAddFriendsFailedErrorWithErrorDes:strErrorDes WithStatusCode:AddFriendsErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getAddFriendsFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:AddFriendFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Friends                     ---

+ (id ) validateGetFriendsResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == ADD_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudSocialShareResponse * response = [WiSeSocialShareServicesResponseParser parseGetFriendsAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                    = [self getGetFriendsFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                  = error;
            }
        }else {
            result = [self getGetFriendsFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetFriendsErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getGetFriendsFailedErrorWithErrorDes:strErrorDes WithStatusCode:GetFriendsErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getGetFriendsFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetFriend_UsersFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Delete Friends                  ---

+ (id ) validateDeleteFriendsResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == ADD_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudSocialShareResponse * response = [WiSeSocialShareServicesResponseParser parseDeleteFriendsAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                    = [self getDeleteFriendsFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                  = error;
            }
        }else {
            result = [self getDeleteFriendsFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetFriendsErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getDeleteFriendsFailedErrorWithErrorDes:strErrorDes WithStatusCode:GetFriendsErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getDeleteFriendsFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetFriend_UsersFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Friend Request Accept OR Reject ---

+ (id ) validateAcceptOrRejectFriendRequestResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == ADD_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudSocialShareResponse * response = [WiSeSocialShareServicesResponseParser parseAcceptOrRejectFriendRequestAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                    = [self getAcceptOrRejectFriendRequestFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                  = error;
            }
        }else {
            result = [self getAcceptOrRejectFriendRequestFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:FriendRequestAccept_RejectErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getAcceptOrRejectFriendRequestFailedErrorWithErrorDes:strErrorDes WithStatusCode:FriendRequestAccept_RejectErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getAcceptOrRejectFriendRequestFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:FriendsRequestAccept_RejectFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Shared Devices              ---

+ (id ) validateGetSharedDevicesResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
        id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
        
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary * dictResponse = (NSDictionary *) result;
            if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
                int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
                if (statusCode == ADD_BEACON_SUCCESSFULL) {
                    requestInfo.requestStatus               = RequestSuccess;
                    WiSeCloudSocialShareResponse * response = [WiSeSocialShareServicesResponseParser parseGetSharedDevicesAPIResponse:responseInfo];
                    result                                  = response;
                }else {
                    NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                    WiSeAppError * error                    = [self getGetSharedDevicesFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                    result                                  = error;
                }
            }else {
                result = [self getGetSharedDevicesFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetSharedDevicesErrorCode];
            }
        }else {
            NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
            WiSeAppError * error   = [self getGetSharedDevicesFailedErrorWithErrorDes:strErrorDes WithStatusCode:GetSharedDevicesErrorCode];
            result                 = error;
        }
        return result;
}

+ (WiSeAppError *) getGetSharedDevicesFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetSharedDevicesFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Get Shared Groups               ---

+ (id ) validateGetSharedGroupsResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == ADD_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudSocialShareResponse * response = [WiSeSocialShareServicesResponseParser parseGetSharedDevicesAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                    = [self getGetSharedGroupsFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                  = error;
            }
        }else {
            result = [self getGetSharedGroupsFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetSharedGroupsErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getGetSharedGroupsFailedErrorWithErrorDes:strErrorDes WithStatusCode:GetSharedGroupsErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getGetSharedGroupsFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:GetSharedGroupsFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Share Accept OR Reject          ---

+ (id ) validateAcceptOrRejectShareRequestResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == ADD_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudSocialShareResponse * response = [WiSeSocialShareServicesResponseParser parseAcceptOrRejectShareRequestAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                    = [self getAcceptOrRejectShareRequestFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                  = error;
            }
        }else {
            result = [self getAcceptOrRejectShareRequestFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:ShareAccept_RejectErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getAcceptOrRejectShareRequestFailedErrorWithErrorDes:strErrorDes WithStatusCode:ShareAccept_RejectErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getAcceptOrRejectShareRequestFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:ShareAccept_RejectFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}

# pragma mark --- Share Create                    ---

+ (id ) validateCreateShareResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo{
    id result = [WiSeNetworkUtil parseAPIResponse:responseInfo];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dictResponse = (NSDictionary *) result;
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) { // True
            int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            if (statusCode == ADD_BEACON_SUCCESSFULL) {
                requestInfo.requestStatus               = RequestSuccess;
                WiSeCloudSocialShareResponse * response = [WiSeSocialShareServicesResponseParser parseCreateShareAPIResponse:responseInfo];
                result                                  = response;
            }else {
                NSString * strErrorDes                  = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                WiSeAppError * error                    = [self getCreateShareFailedErrorWithErrorDes:strErrorDes WithStatusCode:statusCode];
                result                                  = error;
            }
        }else {
            result = [self getCreateShareFailedErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:ShareAccept_RejectErrorCode];
        }
    }else {
        NSString * strErrorDes = [WiSeNetworkUtil getValidErrorMessageFromError:result AndResponseInfo:responseInfo];
        WiSeAppError * error   = [self getCreateShareFailedErrorWithErrorDes:strErrorDes WithStatusCode:CreateShareErrorCode];
        result                 = error;
    }
    return result;
}

+ (WiSeAppError *) getCreateShareFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode {
    return [WiSeNetworkUtil getErrorWithDomainName:CreateShareFailedErrorDomain withErrorDescription:errDes withDomainCode:statusCode];
}


@end
