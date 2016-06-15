//
//  WiSeUserManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 07/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeUserManagerDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeLoginApiRequest;
@class WiSeSignUpApiRequest;
@class WiSeChangePasswordApiRequest;
@class WiSeForgotPasswordAPIRequest;
@class WiSeLogoutAPIRequest;
@class WiSeUpdateUserProfileAPIRequest;
@class WiSeRegisterAppAPIRequest;
@class WiSeUpdateDeviceTokenAPIRequest;
@class WiSeCloudUserAPIRequest;
@class WiSeAPIHeader;
@class WiSeListRolesAPIRequest;

@interface WiSeUserManager : NSObject

@property (nonatomic,weak) id <WiSeUserManagerDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) loginAPIwithRequest : (WiSeLoginApiRequest *) apiRequest;
- (WiSeCloudAPIRequestRegisteredDetails *) registerAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request;
- (WiSeCloudAPIRequestRegisteredDetails *) signUpAPIwithRequest : (WiSeSignUpApiRequest *) apiRequest;
- (WiSeCloudAPIRequestRegisteredDetails *) changePasswordAPIwithRequest : (WiSeChangePasswordApiRequest *) apiRequest;
- (WiSeCloudAPIRequestRegisteredDetails *) forgotPasswordAPIwithRequest : (WiSeForgotPasswordAPIRequest *) apiRequest;
- (WiSeCloudAPIRequestRegisteredDetails *) logoutApiWithRequest : (WiSeLogoutAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) updateDeviceTokenApiWithRequest : (WiSeUpdateDeviceTokenAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) callUpdateUserProfileApiWithRequest : (WiSeUpdateUserProfileAPIRequest *) request;

/*!
 * @brief CMS APIs.
 */

- (WiSeCloudAPIRequestRegisteredDetails *) loginApiWithRequest : (WiSeLoginApiRequest *) request WithHeader : (WiSeAPIHeader *) header;
- (WiSeCloudAPIRequestRegisteredDetails *) addUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;
- (WiSeCloudAPIRequestRegisteredDetails *) editUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;
- (WiSeCloudAPIRequestRegisteredDetails *) changePasswordApiWithRequest : (WiSeChangePasswordApiRequest *) request WithHeader : (WiSeAPIHeader *) header;
- (WiSeCloudAPIRequestRegisteredDetails *) logoutApiWithRequest : (WiSeLogoutAPIRequest *) request WithHeader : (WiSeAPIHeader *) header ;
- (WiSeCloudAPIRequestRegisteredDetails *) listRolesApiWithRequest: (WiSeListRolesAPIRequest *) request WithHeader : (WiSeAPIHeader *) header ;
- (WiSeCloudAPIRequestRegisteredDetails *) getUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;
- (WiSeCloudAPIRequestRegisteredDetails *) deleteOrDisableUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
