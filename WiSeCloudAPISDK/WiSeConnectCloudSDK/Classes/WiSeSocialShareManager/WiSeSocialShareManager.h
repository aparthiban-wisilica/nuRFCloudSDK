//
//  WiSeSocialShareManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeSocialShareManagerDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeCloudSocialShareRequest;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeSocialShareManager : NSObject

@property (nonatomic,weak) id <WiSeSocialShareManagerDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) addFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) acceptOrRejectFriendRequestApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getSharedDevicesApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getSharedGroupsApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) acceptOrRejectShareRequestApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) createShareApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

@end
