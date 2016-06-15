//
//  WiSeUserServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 27/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeRegisterAppAPIRequest;
@class WiSeLoginApiRequest;
@class WiSeSignUpApiRequest;
@class WiSeChangePasswordApiRequest;
@class WiSeForgotPasswordAPIRequest;
@class WiSeLogoutAPIRequest;
@class WiSeUpdateUserProfileAPIRequest;
@class WiSeUpdateDeviceTokenAPIRequest;
@class WiSeAPIHeader;
@class WiSeCloudUserAPIRequest;
@class WiSeListRolesAPIRequest;

@interface WiSeUserServices : NSObject 

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) registerAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) loginApiWithRequest : (WiSeLoginApiRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) signUpApiWithRequest : (WiSeSignUpApiRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) changePasswordApiWithRequest : (WiSeChangePasswordApiRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) forgotPasswordApiWithRequest : (WiSeForgotPasswordAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) logoutApiWithRequest : (WiSeLogoutAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) updateUserProfileApiWithRequest : (WiSeUpdateUserProfileAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) updateDeviceTokenApiWithRequest : (WiSeUpdateDeviceTokenAPIRequest *) request ;

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

- (WiSeCloudAPIRequestRegisteredDetails *) deleteUserApiWithRequest : (WiSeCloudUserAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
