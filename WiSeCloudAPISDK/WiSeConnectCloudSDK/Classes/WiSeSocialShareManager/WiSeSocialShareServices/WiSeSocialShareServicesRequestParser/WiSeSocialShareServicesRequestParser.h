//
//  WiSeSocialShareServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudSocialShareRequest;

@interface WiSeSocialShareServicesRequestParser : NSObject

+ (NSArray *) createAddFriendsApiParameterWithRequest : (WiSeCloudSocialShareRequest *) request ;

+ (NSArray *) createDeleteFriendsApiParameterWithRequest : (WiSeCloudSocialShareRequest *) request ;

+ (NSArray *) createAcceptOrRejectFriendRequestApiParameterWithRequest : (WiSeCloudSocialShareRequest *) request ;

+ (NSArray *) createAcceptOrRejectShareRequestApiParameterWithRequest : (WiSeCloudSocialShareRequest *) request ;

+ (NSArray *) createCreateShareApiParameterWithRequest : (WiSeCloudSocialShareRequest *) request ;

@end
