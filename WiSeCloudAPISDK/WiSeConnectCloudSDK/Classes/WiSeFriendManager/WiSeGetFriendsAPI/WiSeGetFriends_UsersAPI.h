//
//  WiSeGetFriendsAPI.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>
#import <WiSeNetworkManager/WiSeAppError.h>
@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeGetFriends_UsersAPIRequest;
@class WiSeGetFriends_UsersAPIResponse;

@protocol WiSeGetFriends_UsersAPIDelegate <NSObject>

- (void) getFriends_UsersSuccessWithResponse : (WiSeGetFriends_UsersAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) getFriends_UsersFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end


@interface WiSeGetFriends_UsersAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeGetFriends_UsersAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callGetFriends_UsersApiWithRequest : (WiSeGetFriends_UsersAPIRequest *) request ;

@end
