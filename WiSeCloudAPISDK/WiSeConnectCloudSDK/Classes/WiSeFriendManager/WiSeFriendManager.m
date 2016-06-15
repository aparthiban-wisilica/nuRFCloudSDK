//
//  WiSeFriendManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeFriendManager.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@implementation WiSeFriendManager

#pragma mark - Fire Callbacks

- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    if (self.delegate && [self.delegate respondsToSelector:@selector(friendManagerAPICallFailedWithError:withRequestDetails:)]) {
        [self.delegate friendManagerAPICallFailedWithError:error withRequestDetails:requestDetails];
    }
}

- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails {
    if (self.delegate && [self.delegate respondsToSelector:@selector(friendManagerAPICallSuccessWithResponse:withRequestDetails:)]) {
        [self.delegate friendManagerAPICallSuccessWithResponse:response withRequestDetails:requestDetails];
    }
}

# pragma mark - Add Friend API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *)callAddDeviceApiWithRequest:(WiSeAddFriendAPIRequest *)request {
    if (!self.wiSeAddFriendAPIManager) {
        self.wiSeAddFriendAPIManager = [WiSeAddFriendAPI new];
    }
    self.wiSeAddFriendAPIManager.delegate = self;
    return [self.wiSeAddFriendAPIManager callAddDeviceApiWithRequest:request];
}

- (void)addFriendFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)addFriendSuccessWithResponse:(WiSeAddFriendAPIResponse *)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

# pragma mark - Get Friend API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *)callGetFriends_UsersApiWithRequest:(WiSeGetFriends_UsersAPIRequest *)request {
    if (!self.wiSeGetFriends_UsersAPIManager) {
        self.wiSeGetFriends_UsersAPIManager = [WiSeGetFriends_UsersAPI new];
    }
    self.wiSeGetFriends_UsersAPIManager.delegate = self;
    return [self.wiSeGetFriends_UsersAPIManager callGetFriends_UsersApiWithRequest:request];
}

- (void)getFriends_UsersFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)getFriends_UsersSuccessWithResponse:(WiSeGetFriends_UsersAPIResponse *)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

# pragma mark - Delete Friend API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) callDeleteFriendApiWithRequest : (WiSeDeleteFriendAPIRequest *) request {
    if (!self.wiSeDeleteFriendAPIManager) {
        self.wiSeDeleteFriendAPIManager = [WiSeDeleteFriendAPI new];
    }
    self.wiSeDeleteFriendAPIManager.delegate = self;
    return [self.wiSeDeleteFriendAPIManager callDeleteFriendApiWithRequest:request];
}

- (void)deleteFriendAPIFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)deleteFriendAPISuccessWithResponse:(WiSeDeleteFriendAPIResponse *)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

# pragma mark - Friend Request Accpect_Reject API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *)callFriendsRequectAccept_RejectApiWithRequest:(WiSeFriendRequestAccept_RejectAPIRequest *)request {
    if (!self.wiSeFriendsRequectAccept_RejectAPIManager) {
        self.wiSeFriendsRequectAccept_RejectAPIManager = [WiSeFriendsRequestAccept_RejectAPI new];
    }
    self.wiSeFriendsRequectAccept_RejectAPIManager.delegate = self;
    return [self.wiSeFriendsRequectAccept_RejectAPIManager callFriendsRequestAccept_RejectApiWithRequest:request];
}

- (void)friendsRequestAccept_RejectFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)friendsRequestAccept_RejectSuccessWithResponse:(WiSeFriendRequestAccept_RejectAPIResponse *)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

# pragma mark - Share Accpect_Reject API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) callShareAccept_RejectApiWithRequest : (WiSeShareAccept_RejectAPIRequest *) request {
    if (!self.wiSeShareAccept_RejectAPIManager) {
        self.wiSeShareAccept_RejectAPIManager = [WiSeShareAccept_RejectAPI new];
    }
    self.wiSeShareAccept_RejectAPIManager.delegate = self;
    return [self.wiSeShareAccept_RejectAPIManager callShareAccept_RejectApiWithRequest:request];
}

- (void)shareAccept_RejectFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)shareAccept_RejectSuccessWithResponse:(WiSeShareAccept_RejectAPIResponse *)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

# pragma mark - Get Shared Groups API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) callGetSharedGroupsApiWithRequest : (WiSeGetSharedGroupsAPIRequest *) request {
    if (!self.wiSeGetSharedGroupsAPIManager) {
        self.wiSeGetSharedGroupsAPIManager = [WiSeGetSharedGroupsAPI new];
    }
    self.wiSeGetSharedGroupsAPIManager.delegate = self;
    return [self.wiSeGetSharedGroupsAPIManager callGetSharedGroupsApiWithRequest:request];
}

- (void)getSharedGroupsFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)getSharedGroupsSuccessWithResponse:(WiSeGetSharedGroupsAPIResponse *)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

# pragma mark - Get Shared Devices API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) callGetSharedDevicesApiWithRequest : (WiSeGetSharedDevicesAPIRequest *) request {
    if (!self.wiSeGetSharedDevicesAPIManager) {
        self.wiSeGetSharedDevicesAPIManager = [WiSeGetSharedDevicesAPI new];
    }
    self.wiSeGetSharedDevicesAPIManager.delegate = self;
    return [self.wiSeGetSharedDevicesAPIManager callGetSharedDevicesApiWithRequest:request];
}

- (void)getSharedDevicesFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)getSharedDevicesSuccessWithResponse:(WiSeGetSharedDevicesAPIResponse *)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

# pragma mark - Create Share API Call and Call back

- (WiSeCloudAPIRequestRegisteredDetails *) callCreateShareApiWithRequest : (WiSeShareCreateAPIRequest *) request {
    if (!self.wiSeShareCreateAPIManager) {
        self.wiSeShareCreateAPIManager = [WiSeShareCreateAPI new];
    }
    self.wiSeShareCreateAPIManager.delegate = self;
    return [self.wiSeShareCreateAPIManager callCreateShareApiWithRequest:request];
}

- (void)createShareFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)createShareSuccessWithResponse:(WiSeShareCreateAPIResponse *)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

@end
