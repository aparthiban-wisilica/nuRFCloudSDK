//
//  WiSeSocialShareServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeCloudSocialShareRequest;

@interface WiSeSocialShareServices : NSObject

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) addFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) acceptOrRejectFriendRequestApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getSharedDevicesApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getSharedGroupsApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) acceptOrRejectShareRequestApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) createShareApiWithRequest : (WiSeCloudSocialShareRequest *) request ;

@end
