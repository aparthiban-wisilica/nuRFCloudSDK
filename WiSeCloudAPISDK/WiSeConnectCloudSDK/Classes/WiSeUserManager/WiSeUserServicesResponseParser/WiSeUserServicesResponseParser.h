//
//  WiSeUserServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 27/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

@class WiSeRegisterAppInfoAPIResponse;
@class WiSeLoginApiResponse;
@class WiSeSignUpApiResponse;
@class WiSeChangePasswordApiResponse;
@class WiSeForgotPasswordAPIResponse;
@class WiSeLogoutAPIResponse;
@class WiSeUpdateUserProfileAPIResponse;
@class WiSeUpdateDeviceTokenAPIResponse;
@class WiSeCloudApiResponse;
@class WiSeCloudUserAPIResponse;
@class WiSeListRolesAPIResponse;

@interface WiSeUserServicesResponseParser : NSObject

+ (WiSeRegisterAppInfoAPIResponse *) parseSaveAppInfoAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeLoginApiResponse *) parseLoginAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeSignUpApiResponse *) parseSignUpAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeCloudUserAPIResponse *) parseAddEditUserAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeChangePasswordApiResponse *) parseChangePasswordAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeForgotPasswordAPIResponse *) parseForgotPasswordAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeLogoutAPIResponse *) parseLogoutPasswordAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeUpdateUserProfileAPIResponse *) parseUpdateUserProfilePasswordAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeUpdateDeviceTokenAPIResponse *) parseUpdateDeviceTokenAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeListRolesAPIResponse *) parseListRolesAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeCloudUserAPIResponse *) parseListUsersAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeCloudUserAPIResponse *) parseDeleteUsersAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;


+ (NSArray *) getUserOrgList : (NSArray *) orgList;
+ (NSMutableArray *) getRolesListFromDataArray : (NSArray *) dataArray;
+ (NSMutableArray *) getUsersListFromDataArray : (NSArray *) dataArray;
+ (NSArray *) getAddEditUserList : (NSArray *) dataArray;

@end
