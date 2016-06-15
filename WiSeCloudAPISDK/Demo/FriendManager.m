//
//  FriendManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "FriendManager.h"
#import "WiSeAddFriendAPIRequest.h"
#import "AppDelegate.h"
#import "WiSeLoginApiResponse.h"
//#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeGetFriends_UsersAPIRequest.h"
#import "WiSeDeleteFriendAPIRequest.h"
#import "WiSeFriendRequestAccept_RejectAPIRequest.h"
#import "WiSeShareAccept_RejectAPIRequest.h"
#import "WiSeGetSharedGroupsAPIRequest.h"
#import "WiSeGetSharedDevicesAPIRequest.h"
#import "WiSeShareCreateDetails.h"
#import "WiSeShareCreateAPIRequest.h"
#import <WiSeAppLog/WiSeLogManager.h>

@implementation FriendManager {
    WiSeFriendManager * friendManager;
    NSString * strToken;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    friendManager                        = [WiSeFriendManager new];
    friendManager.delegate               = self;

    AppDelegate * mainDelegate           = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;
    strToken                             = loginResponse.token;
    
}

#pragma mark - Friend Manager Call backs

- (void)friendManagerAPICallFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case AddFriends:
            WiSeLogInfo(@"Add Friends Failed : %@",error.localizedDescription);
            break;
        case GetFriends:
            WiSeLogInfo(@"Get Friends Failed : %@",error.localizedDescription);
            break;
        case DeleteFriend:
            WiSeLogInfo(@"Delete Friends Failed : %@",error.localizedDescription);
            break;
        case FriendRequestAccept_Reject:
            WiSeLogInfo(@"FriendRequestAccept_Reject Failed : %@",error.localizedDescription);
            break;
        case ShareAccept_Reject:
            WiSeLogInfo(@"Share Accept_Reject Failed : %@",error.localizedDescription);
            break;
        case GetSharedGroups:
            WiSeLogInfo(@"Get Shared Groups Failed : %@",error.localizedDescription);
            break;
        case GetSharedDevices:
            WiSeLogInfo(@"Get Shared Devices Failed : %@",error.localizedDescription);
            break;
        default:
            break;
    }
}

- (void)friendManagerAPICallSuccessWithResponse:(id)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case AddFriends:
            WiSeLogInfo(@"Add Friends Success : %@",response);
            break;
        case GetFriends:
            WiSeLogInfo(@"Get Friends Success : %@",response);
            break;
        case DeleteFriend:
            WiSeLogInfo(@"Delete Friends Success : %@",response);
            break;
        case FriendRequestAccept_Reject:
            WiSeLogInfo(@"FriendRequestAccept_Reject Success : %@",response);
            break;
        case ShareAccept_Reject:
            WiSeLogInfo(@"Share Accept_Reject Success : %@",response);
            break;
        case GetSharedGroups:
            WiSeLogInfo(@"Get Shared Groups Success : %@",response);
            break;
        case GetSharedDevices:
            WiSeLogInfo(@"Get Shared Devices Success : %@",response);
            break;
        default:
            break;
    }

}



#pragma mark - Add Friends

- (IBAction)btnAddFriendTapped:(id)sender {
    
    WiSeAddFriendAPIRequest * request             = [WiSeAddFriendAPIRequest new];
    request.token                                 = strToken;
    request.friendsIds                            = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:1523],[NSNumber numberWithInt:0], nil];
    WiSeCloudAPIRequestRegisteredDetails * status = [friendManager callAddDeviceApiWithRequest:request];
    WiSeLogInfo(@"Add Friends Status : %u",status.requestRegisteredId);
    
}

#pragma mark - Get Friends

- (IBAction)btnGetFriendTapped:(id)sender {
    WiSeGetFriends_UsersAPIRequest * request      = [WiSeGetFriends_UsersAPIRequest new];
    request.token                                 = strToken;
    request.listType                              = FriendsList;
    WiSeCloudAPIRequestRegisteredDetails * status = [friendManager callGetFriends_UsersApiWithRequest:request];
    WiSeLogInfo(@"Get Friends Status : %u",status.requestRegisteredId);
}

#pragma mark - Delete Friends

- (IBAction)btnDeleteFriendTapped:(id)sender {
    WiSeDeleteFriendAPIRequest * request          = [WiSeDeleteFriendAPIRequest new];
    request.token                                 = strToken;
    request.friendId                              = 1523;
    WiSeCloudAPIRequestRegisteredDetails * status = [friendManager callDeleteFriendApiWithRequest:request];
    WiSeLogInfo(@"Get Friends Status : %u",status.requestRegisteredId);
}

#pragma mark -  Friend Request Accept_Reject 

- (IBAction)btnFriendRequestAccept_RejectTapped:(id)sender {
    WiSeFriendRequestAccept_RejectAPIRequest * request = [WiSeFriendRequestAccept_RejectAPIRequest new];
    request.token                                      = strToken;
    request.friendId                                   = 1447;
    request.friendRequestAction                        = FriendRequestAccept;
    request.messageId                                  = 0;
    WiSeCloudAPIRequestRegisteredDetails * status      = [friendManager callFriendsRequectAccept_RejectApiWithRequest:request];
    WiSeLogInfo(@"Get Friends Status : %u",status.requestRegisteredId);
}

#pragma mark -  Share Accept_Reject

- (IBAction)btnShareAccept_Reject:(id)sender {
    WiSeShareAccept_RejectAPIRequest * request    = [WiSeShareAccept_RejectAPIRequest new];
    request.token                                 = strToken;
    request.shareAction                           = ShareAccept;
    request.shareUserId                           = 1447;
    request.device_Group_CloudId                  = 14332;
    request.messageId                             = 0;
    request.wiseItemType                          = WiseSubItem;

    WiSeCloudAPIRequestRegisteredDetails * status = [friendManager callShareAccept_RejectApiWithRequest:request];
    WiSeLogInfo(@"Share Accept_Reject Status : %u",status.requestRegisteredId);
}

#pragma mark -  Get Shared Groups 

- (IBAction)btnSharedGroupsTapped:(id)sender {
    WiSeGetSharedGroupsAPIRequest * request       = [WiSeGetSharedGroupsAPIRequest new];
    request.token                                 = strToken;
    WiSeCloudAPIRequestRegisteredDetails * status = [friendManager callGetSharedGroupsApiWithRequest:request];
    WiSeLogInfo(@"Get Shared Groups Status : %u",status.requestRegisteredId);
}

#pragma mark -  Get Shared Devices

- (IBAction)btnGetSharedDevices:(id)sender {
    WiSeGetSharedDevicesAPIRequest * request      = [WiSeGetSharedDevicesAPIRequest new];
    request.token                                 = strToken;
    request.groupCloudId                          = 10;
    WiSeCloudAPIRequestRegisteredDetails * status = [friendManager callGetSharedDevicesApiWithRequest:request];
    WiSeLogInfo(@"Get Shared Devices Status : %u",status.requestRegisteredId);
}

#pragma mark - Create Share 

- (IBAction)btnCreateShare:(id)sender {
    WiSeShareCreateAPIRequest * request           = [WiSeShareCreateAPIRequest new];
    request.token                                 = strToken;

    WiSeShareCreateDetails * details              = [WiSeShareCreateDetails new];
    details.friendId                              = 1523;
    details.groupdCloudId                         = 0;
    details.wiseItemType                          = WiseSubItem;
    details.deviceCloudId                         = 14332;

    WiSeShareCreateDetails * details1             = [WiSeShareCreateDetails new];
    details1.friendId                             = 1523;
    details1.groupdCloudId                        = 4621;
    details1.wiseItemType                         = WiseItem;
    details1.deviceCloudId                        = 0;
    request.shareCreateDetails                    = [[NSArray alloc] initWithObjects:details,details1, nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [friendManager callCreateShareApiWithRequest:request];
    WiSeLogInfo(@"Create Share Status : %u",status.requestRegisteredId);
}

@end
