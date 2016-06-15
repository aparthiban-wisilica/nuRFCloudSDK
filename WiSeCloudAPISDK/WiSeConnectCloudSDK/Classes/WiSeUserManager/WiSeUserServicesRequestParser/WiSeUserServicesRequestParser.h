//
//  WiSeUserServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 27/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeRegisterAppAPIRequest;
@class WiSeLoginApiRequest;
@class WiSeSignUpApiRequest;
@class WiSeChangePasswordApiRequest;
@class WiSeForgotPasswordAPIRequest;
@class WiSeUpdateUserProfileAPIRequest;
@class WiSeUpdateDeviceTokenAPIRequest;
@class WiSeCloudUserAPIRequest;
@class WiSeCloudUserInfo;

@interface WiSeUserServicesRequestParser : NSObject

+(NSDictionary *) createSaveAPPAPIJson : (WiSeRegisterAppAPIRequest *) request;

+(NSDictionary*)createLoingApiParameters:(WiSeLoginApiRequest*)request;

+(NSDictionary *)createSignUpApiParameters:(WiSeSignUpApiRequest *)request;

+(NSDictionary*)createChangePasswordApiParameters:(WiSeChangePasswordApiRequest*)request;

+(NSDictionary*)createForgotPasswordApiParameters:(WiSeForgotPasswordAPIRequest *)request;

+(NSDictionary*)createUpdateUserProfileApiParameters:(WiSeUpdateUserProfileAPIRequest *)request;

+(NSDictionary*)createUpdateDeviceTokenApiParameters:(WiSeUpdateDeviceTokenAPIRequest *)request;

+(NSDictionary *)createAddUserApiParameters:(WiSeCloudUserAPIRequest *)request;

+(NSArray *)createAddUserApiParameters1:(WiSeCloudUserAPIRequest *)request;

@end
