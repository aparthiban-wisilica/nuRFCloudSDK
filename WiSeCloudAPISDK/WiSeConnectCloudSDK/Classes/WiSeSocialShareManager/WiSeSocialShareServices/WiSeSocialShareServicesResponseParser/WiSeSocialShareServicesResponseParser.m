//
//  WiSeSocialShareServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSocialShareServicesResponseParser.h"
#import "WiSeCloudSocialShareResponse.h"

#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudApiResponse.h"

@implementation WiSeSocialShareServicesResponseParser

# pragma mark --- Common Methods                  ---

+ (WiSeCloudSocialShareResponse *) getWiSeCloudSocialShareResponseBaseInfoFrom : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudSocialShareResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeCloudSocialShareResponse new];
            WiSeCloudApiResponse * statusResponse                 = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                              = statusResponse.statusMessage;
            response.apiId                                      = statusResponse.apiId;
            response.startTime                                  = statusResponse.startTime;
            response.endTime                                    = statusResponse.endTime;
            response.executionTime                              = statusResponse.executionTime;
            response.urlResponseStatusCode                      = statusResponse.urlResponseStatusCode;
            response.statusCode                                 = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
        }
    }
    return response;
}

# pragma mark --- Add Friends                     ---

+ (WiSeCloudSocialShareResponse *) parseAddFriendsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudSocialShareResponse * response = [self getWiSeCloudSocialShareResponseBaseInfoFrom:responseInfo];
    if (response) {
        
    }
    return response;
}

# pragma mark --- Get Friends                     ---

+ (WiSeCloudSocialShareResponse *) parseGetFriendsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudSocialShareResponse * response = [self getWiSeCloudSocialShareResponseBaseInfoFrom:responseInfo];
    if (response) {
        
    }
    return response;
}

# pragma mark --- Delete Friends                  ---

+ (WiSeCloudSocialShareResponse *) parseDeleteFriendsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudSocialShareResponse * response = [self getWiSeCloudSocialShareResponseBaseInfoFrom:responseInfo];
    if (response) {
        
    }
    return response;
}

# pragma mark --- Friend Request Accept OR Reject ---

+ (WiSeCloudSocialShareResponse *) parseAcceptOrRejectFriendRequestAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudSocialShareResponse * response = [self getWiSeCloudSocialShareResponseBaseInfoFrom:responseInfo];
    if (response) {
        
    }
    return response;
}

# pragma mark --- Get Shared Devices              ---

+ (WiSeCloudSocialShareResponse *) parseGetSharedDevicesAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudSocialShareResponse * response = [self getWiSeCloudSocialShareResponseBaseInfoFrom:responseInfo];
    if (response) {
        
    }
    return response;
}

# pragma mark --- Get Shared Groups               ---

+ (WiSeCloudSocialShareResponse *) parseGetSharedGroupsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudSocialShareResponse * response = [self getWiSeCloudSocialShareResponseBaseInfoFrom:responseInfo];
    if (response) {
        
    }
    return response;
}

# pragma mark --- Share Accept OR Reject          ---

+ (WiSeCloudSocialShareResponse *) parseAcceptOrRejectShareRequestAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudSocialShareResponse * response = [self getWiSeCloudSocialShareResponseBaseInfoFrom:responseInfo];
    if (response) {
        
    }
    return response;
}

# pragma mark --- Share Create                    ---

+ (WiSeCloudSocialShareResponse *) parseCreateShareAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudSocialShareResponse * response = [self getWiSeCloudSocialShareResponseBaseInfoFrom:responseInfo];
    if (response) {
        
    }
    return response;
}


@end
