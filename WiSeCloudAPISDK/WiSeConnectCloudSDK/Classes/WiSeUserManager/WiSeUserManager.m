//
//  WiSeUserManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 07/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeUserManager.h"
#import "WiSeUserServices.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import "WiSeAPIDefaultDelegate.h"

@interface WiSeUserManager ()  <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeUserServices * userServices;

@end


@implementation WiSeUserManager {
   
}


#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(userManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate userManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(userManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate userManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
        }
    });
    
}

# pragma mark - Login API Call

- (WiSeCloudAPIRequestRegisteredDetails *) loginAPIwithRequest : (WiSeLoginApiRequest *) apiRequest {
    
    if (!self.userServices) { // Init the manager
        self.userServices = [WiSeUserServices new];
    }
    self.userServices.delegate = self;
    return [self.userServices loginApiWithRequest:apiRequest];
}

- (WiSeCloudAPIRequestRegisteredDetails *) loginApiWithRequest : (WiSeLoginApiRequest *) request WithHeader : (WiSeAPIHeader *) header{
    if (!self.userServices) { // Init the manager
        self.userServices = [WiSeUserServices new];
    }
    self.userServices.delegate = self;
    return [self.userServices loginApiWithRequest:request WithHeader:header];
}

# pragma mark - Sign Up API Call 

- (WiSeCloudAPIRequestRegisteredDetails *) signUpAPIwithRequest : (WiSeSignUpApiRequest *) apiRequest {
    
    if (!self.userServices) { // Init the manager
        self.userServices = [WiSeUserServices new];
    }
    self.userServices.delegate = self;
    return [self.userServices signUpApiWithRequest:apiRequest];
    
}

# pragma mark - Add User API Call

- (WiSeCloudAPIRequestRegisteredDetails *) addUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.userServices) { // Init the manager
        self.userServices = [WiSeUserServices new];
    }
    self.userServices.delegate = self;
    return [self.userServices addUserApiWithRequest:request WithHeader:header];
}

# pragma mark - Edit User API Call

- (WiSeCloudAPIRequestRegisteredDetails *) editUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.userServices) { // Init the manager
        self.userServices = [WiSeUserServices new];
    }
    self.userServices.delegate = self;
    return [self.userServices editUserApiWithRequest:request WithHeader:header];
}

# pragma mark - Change Password API Call 

- (WiSeCloudAPIRequestRegisteredDetails *) changePasswordAPIwithRequest : (WiSeChangePasswordApiRequest *) apiRequest {
    
    if (!self.userServices) {
        self.userServices = [WiSeUserServices new]; // Init the manager
    }
    self.userServices.delegate = self;
    return [self.userServices changePasswordApiWithRequest:apiRequest];
}

- (WiSeCloudAPIRequestRegisteredDetails *) changePasswordApiWithRequest : (WiSeChangePasswordApiRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.userServices) {
        self.userServices = [WiSeUserServices new]; // Init the manager
    }
    self.userServices.delegate = self;
    return [self.userServices changePasswordApiWithRequest:request WithHeader:header];
}


# pragma mark - Forgot Password API Call 

- (WiSeCloudAPIRequestRegisteredDetails *)forgotPasswordAPIwithRequest:(WiSeForgotPasswordAPIRequest *)apiRequest {
    
    if (!self.userServices) { // Init the manager
        self.userServices = [WiSeUserServices new];
    }
    self.userServices.delegate = self;
    return [self.userServices forgotPasswordApiWithRequest:apiRequest];
}

# pragma mark - Logout API Call 

- (WiSeCloudAPIRequestRegisteredDetails *) logoutApiWithRequest : (WiSeLogoutAPIRequest *) request {
    
    if (!self.userServices) {
        self.userServices = [WiSeUserServices new]; // Init the manager
    }
    self.userServices.delegate = self;
    return [self.userServices logoutApiWithRequest:request];
}

- (WiSeCloudAPIRequestRegisteredDetails *) logoutApiWithRequest : (WiSeLogoutAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.userServices) {
        self.userServices = [WiSeUserServices new]; // Init the manager
    }
    self.userServices.delegate = self;
    return [self.userServices logoutApiWithRequest:request WithHeader:header];
}

# pragma mark - Update Device Token API Call 

- (WiSeCloudAPIRequestRegisteredDetails *) updateDeviceTokenApiWithRequest : (WiSeUpdateDeviceTokenAPIRequest *) request {
    if (!self.userServices) {
        self.userServices = [WiSeUserServices new]; // Init the manager
    }
    self.userServices.delegate = self;
    return [self.userServices updateDeviceTokenApiWithRequest:request];
}


# pragma mark - Update User Profile API Call 

- (WiSeCloudAPIRequestRegisteredDetails *) callUpdateUserProfileApiWithRequest : (WiSeUpdateUserProfileAPIRequest *) request {
    
    if (!self.userServices) {
        self.userServices = [WiSeUserServices new]; // Init the manager
    }
    
    self.userServices.delegate = self;
    return [self.userServices updateUserProfileApiWithRequest:request];
}


# pragma mark - Save App Info API Call 

- (WiSeCloudAPIRequestRegisteredDetails *) registerAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request {
    if (!self.userServices) {
        self.userServices = [WiSeUserServices new]; // Init the manager
    }
    self.userServices.delegate = self;
    return [self.userServices registerAppAPIWithRequest:request];
}

# pragma mark - List Roles API Call

- (WiSeCloudAPIRequestRegisteredDetails *) listRolesApiWithRequest: (WiSeListRolesAPIRequest *) request WithHeader : (WiSeAPIHeader *) header  {
    if (!self.userServices) {
        self.userServices = [WiSeUserServices new]; // Init the manager
    }
    self.userServices.delegate = self;
    return [self.userServices listRolesApiWithRequest:request WithHeader:header];
}

# pragma mark - List Users API Call

- (WiSeCloudAPIRequestRegisteredDetails *) getUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.userServices) {
        self.userServices = [WiSeUserServices new]; // Init the manager
    }
    self.userServices.delegate = self;
    return [self.userServices getUserApiWithRequest:request WithHeader:header];
}

# pragma mark - Delete Users API Call

- (WiSeCloudAPIRequestRegisteredDetails *) deleteOrDisableUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    if (!self.userServices) {
        self.userServices = [WiSeUserServices new]; // Init the manager
    }
    self.userServices.delegate = self;
    return [self.userServices deleteUserApiWithRequest:request WithHeader:header];
}

# pragma mark - Default Callbacks 

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
     [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}

@end
