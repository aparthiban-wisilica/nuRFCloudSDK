//
//  WiSeFriendManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAddFriendAPI.h"
#import "WiSeGetFriends_UsersAPI.h"
#import "WiSeDeleteFriendAPI.h"
#import "WiSeFriendsRequestAccept_RejectAPI.h"
#import "WiSeShareAccept_RejectAPI.h"
#import "WiSeGetSharedGroupsAPI.h"
#import "WiSeGetSharedDevicesAPI.h"
#import "WiSeShareCreateAPI.h"
#import "WiSeFriendManagerDelegate.h"


@interface WiSeFriendManager : NSObject <WiSeAddFriendAPIDelegate,WiSeGetFriends_UsersAPIDelegate,WiSeDeleteFriendAPIDelegate,WiSeFriendsRequestAccept_RejectAPIDelegate,WiSeShareAccept_RejectAPIDelegate,WiSeGetSharedGroupsAPIDelegate,WiSeGetSharedDevicesAPIDelegate,WiSeShareCreateAPIDelegate>

@property (nonatomic,weak) id <WiSeFriendManagerDelegate> delegate;

@property (nonatomic,strong) WiSeAddFriendAPI * wiSeAddFriendAPIManager;
@property (nonatomic,strong) WiSeGetFriends_UsersAPI * wiSeGetFriends_UsersAPIManager;
@property (nonatomic,strong) WiSeDeleteFriendAPI * wiSeDeleteFriendAPIManager;
@property (nonatomic,strong) WiSeFriendsRequestAccept_RejectAPI * wiSeFriendsRequectAccept_RejectAPIManager;
@property (nonatomic,strong) WiSeShareAccept_RejectAPI * wiSeShareAccept_RejectAPIManager;
@property (nonatomic,strong) WiSeGetSharedGroupsAPI * wiSeGetSharedGroupsAPIManager;
@property (nonatomic,strong) WiSeGetSharedDevicesAPI * wiSeGetSharedDevicesAPIManager;
@property (nonatomic,strong) WiSeShareCreateAPI * wiSeShareCreateAPIManager;

- (WiSeCloudAPIRequestRegisteredDetails *) callAddDeviceApiWithRequest : (WiSeAddFriendAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) callGetFriends_UsersApiWithRequest : (WiSeGetFriends_UsersAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) callDeleteFriendApiWithRequest : (WiSeDeleteFriendAPIRequest *) request;
- (WiSeCloudAPIRequestRegisteredDetails *) callFriendsRequectAccept_RejectApiWithRequest : (WiSeFriendRequestAccept_RejectAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) callShareAccept_RejectApiWithRequest : (WiSeShareAccept_RejectAPIRequest *) request;
- (WiSeCloudAPIRequestRegisteredDetails *) callGetSharedGroupsApiWithRequest : (WiSeGetSharedGroupsAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) callGetSharedDevicesApiWithRequest : (WiSeGetSharedDevicesAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) callCreateShareApiWithRequest : (WiSeShareCreateAPIRequest *) request ;


@end
