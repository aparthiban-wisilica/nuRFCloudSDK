//
//  WiSeSocialShareManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSocialShareManager.h"
#import "WiSeCloudSocialShareRequest.h"
#import "WiSeSocialShareServices.h"
#import "WiSeAPIDefaultDelegate.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@interface WiSeSocialShareManager () <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeSocialShareServices * socialShareServices;

@end

@implementation WiSeSocialShareManager

#pragma mark - Fire Callbacks

- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(socialShareManagerAPICallFailedWithError:withRequestDetails:)]) {
            [self.delegate socialShareManagerAPICallFailedWithError:error withRequestDetails:requestDetails];
        }
    });
}

- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(socialShareManagerAPICallSuccessWithResponse:withRequestDetails:)]) {
            [self.delegate socialShareManagerAPICallSuccessWithResponse:response withRequestDetails:requestDetails];
        }
    });
}

# pragma mark - Default Callbacks

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}


# pragma mark --- Add Friends                     ---

- (WiSeCloudAPIRequestRegisteredDetails *) addFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    return nil;
}

# pragma mark --- Get Friends                     ---

- (WiSeCloudAPIRequestRegisteredDetails *) getFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    return nil;
}


# pragma mark --- Delete Friends                  ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteFriendsApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    return nil;
}


# pragma mark --- Friend Request Accept OR Reject ---

- (WiSeCloudAPIRequestRegisteredDetails *) acceptOrRejectFriendRequestApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    return nil;
}


# pragma mark --- Get Shared Devices              ---

- (WiSeCloudAPIRequestRegisteredDetails *) getSharedDevicesApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    return nil;
}


# pragma mark --- Get Shared Groups               ---

- (WiSeCloudAPIRequestRegisteredDetails *) getSharedGroupsApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    return nil;
}


# pragma mark --- Share Accept OR Reject          ---

- (WiSeCloudAPIRequestRegisteredDetails *) acceptOrRejectShareRequestApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    return nil;
}


# pragma mark --- Share Create                    ---

- (WiSeCloudAPIRequestRegisteredDetails *) createShareApiWithRequest : (WiSeCloudSocialShareRequest *) request {
    return nil;
}


@end
