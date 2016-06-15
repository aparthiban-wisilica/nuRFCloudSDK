//
//  WiSeAddFriendAPI.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>
#import <WiSeNetworkManager/WiSeAppError.h>
@class WiSeAddFriendAPIRequest;
@class WiSeAddFriendAPIResponse;
@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;

@protocol WiSeAddFriendAPIDelegate <NSObject>

- (void) addFriendSuccessWithResponse : (WiSeAddFriendAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) addFriendFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
@end


@interface WiSeAddFriendAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeAddFriendAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callAddDeviceApiWithRequest : (WiSeAddFriendAPIRequest *) request ;

@end
