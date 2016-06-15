//
//  WiSeSocialShareServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

@class WiSeCloudSocialShareResponse;

@interface WiSeSocialShareServicesResponseParser : NSObject

+ (WiSeCloudSocialShareResponse *) parseAddFriendsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSocialShareResponse *) parseGetFriendsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSocialShareResponse *) parseDeleteFriendsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSocialShareResponse *) parseAcceptOrRejectFriendRequestAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSocialShareResponse *) parseGetSharedDevicesAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSocialShareResponse *) parseGetSharedGroupsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSocialShareResponse *) parseAcceptOrRejectShareRequestAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSocialShareResponse *) parseCreateShareAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;


@end
