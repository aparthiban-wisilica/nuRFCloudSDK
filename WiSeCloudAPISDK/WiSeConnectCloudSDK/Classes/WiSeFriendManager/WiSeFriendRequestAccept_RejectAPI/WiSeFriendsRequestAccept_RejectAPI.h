//
//  WiSeFriendsRequectAccept_RejectAPI.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>
#import <WiSeNetworkManager/WiSeAppError.h>
@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeFriendRequestAccept_RejectAPIRequest;
@class WiSeFriendRequestAccept_RejectAPIResponse;

@protocol WiSeFriendsRequestAccept_RejectAPIDelegate <NSObject>

- (void) friendsRequestAccept_RejectSuccessWithResponse : (WiSeFriendRequestAccept_RejectAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) friendsRequestAccept_RejectFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
@end

@interface WiSeFriendsRequestAccept_RejectAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeFriendsRequestAccept_RejectAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callFriendsRequestAccept_RejectApiWithRequest : (WiSeFriendRequestAccept_RejectAPIRequest *) request ;

@end
