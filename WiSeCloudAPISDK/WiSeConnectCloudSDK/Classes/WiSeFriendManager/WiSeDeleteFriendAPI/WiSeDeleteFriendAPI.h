//
//  WiSeDeleteFriendAPI.h
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
@class WiSeDeleteFriendAPIRequest;
@class WiSeDeleteFriendAPIResponse;

@protocol WiSeDeleteFriendAPIDelegate <NSObject>

- (void) deleteFriendAPISuccessWithResponse : (WiSeDeleteFriendAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) deleteFriendAPIFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end


@interface WiSeDeleteFriendAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeDeleteFriendAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callDeleteFriendApiWithRequest : (WiSeDeleteFriendAPIRequest *) request;

@end
