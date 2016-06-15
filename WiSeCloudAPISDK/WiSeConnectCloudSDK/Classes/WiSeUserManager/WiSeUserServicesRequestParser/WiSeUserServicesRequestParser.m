//
//  WiSeUserServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 27/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeUserServicesRequestParser.h"
#import "WiSeRegisterAppAPIRequest.h"
#import "WiSeLoginApiRequest.h"
#import "WiSeSignUpApiRequest.h"
#import "WiSeChangePasswordApiRequest.h"
#import "WiSeForgotPasswordAPIRequest.h"
#import "WiSeUpdateUserProfileAPIRequest.h"
#import "WiSeUpdateDeviceTokenAPIRequest.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudUserAPIRequest.h"
#import "WiSeCloudUserInfo.h"

@implementation WiSeUserServicesRequestParser

#pragma mark --- Register App ---
+ (NSDictionary *) createSaveAPPAPIJson : (WiSeRegisterAppAPIRequest *) request{
    
    request.deviceId    = request.deviceId?request.deviceId:@"";
    request.osInfo      = request.osInfo?request.osInfo:@"";
    request.modelInfo   = request.modelInfo?request.modelInfo:@"";
    request.deviceToken = request.deviceToken?request.deviceToken:@"";
    request.appVersion  = request.appVersion?request.appVersion:@"";
    NSString * strOrgId = [NSString stringWithFormat:@"%d",request.organizationId];

    // create input json string
    NSArray *keys       = [NSArray arrayWithObjects:DEVICEID,
                        OSINFO,
                        MODELINFO,
                        ORGANIZATIONID,
                        DEVICETOKEN,
                        APPVERSION,nil];

    NSArray *objects    = [NSArray arrayWithObjects:request.deviceId,
                        request.osInfo,
                        request.modelInfo,
                        strOrgId,
                        request.deviceToken,
                        request.appVersion, nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    return nil;
}

#pragma mark --- Login ---
+(NSDictionary*)createLoingApiParameters:(WiSeLoginApiRequest*)request
{
    // apply SHA 512 encryption
    NSString * strSha      = [WiSeNetworkUtil createSHA512:request.password];
    strSha                 = [strSha stringByReplacingOccurrencesOfString:@"<" withString:@""];
    strSha                 = [strSha stringByReplacingOccurrencesOfString:@">" withString:@""];
    strSha                 = [strSha stringByReplacingOccurrencesOfString:@" " withString:@""];

    request.userName       = request.userName?request.userName:@"";
    NSString * strOrgId    = [NSString stringWithFormat:@"%d",request.organizationId];
    NSString * strAppId    = [NSString stringWithFormat:@"%d",request.appId];
    NSString * strUserType = [NSString stringWithFormat:@"%d",request.userType];

    // create input json string
    NSArray *keys          = [NSArray arrayWithObjects:USER_NAME,
                              USER_PASSWORD,
                              ORGANIZATION_ID,
                              APPId,
                              USER_TYPE,nil];
    
    NSArray *objects       = [NSArray arrayWithObjects:request.userName,
                              strSha,
                              strOrgId,
                              strAppId,
                              strUserType, nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    return nil;
}

#pragma mark --- Signup ---

+(NSDictionary*)createSignUpApiParameters:(WiSeSignUpApiRequest *)request
{
    // Preparing POST sign up api parameters
    NSString * shaString          = [WiSeNetworkUtil createSHA512:request.userPassword];
    shaString                     = [shaString stringByReplacingOccurrencesOfString:@"<" withString:@""];
    shaString                     = [shaString stringByReplacingOccurrencesOfString:@">" withString:@""];
    shaString                     = [shaString stringByReplacingOccurrencesOfString:@" " withString:@""];

    NSString * strUserEmail       = [request.userEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString * strUserName        = [request.userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString * strUserDisplayName = [request.userDisplayName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];


    NSString * strAppId           = [NSString stringWithFormat:@"%d",request.appId];
    NSString * strUserType        = [NSString stringWithFormat:@"%d",request.userType];
    NSString * strOrgId           = [NSString stringWithFormat:@"%d",request.orgId];

    strUserEmail                  = strUserEmail?strUserEmail:@"";
    strUserName                   = strUserName?strUserName:@"";
    strUserDisplayName            = strUserDisplayName?strUserDisplayName:@"";

    NSArray *keys                 = [NSArray arrayWithObjects: USER_NAME,
                                     USER_EMAIL,
                                     USER_DISPLAY_NAME,
                                     USER_PASSWORD,
                                     ORGANIZATION_ID,
                                     USER_TYPE,
                                     APPId,nil];

    NSArray *objects              = [NSArray arrayWithObjects:strUserName,
                                     strUserEmail,
                                     strUserDisplayName,
                                     shaString,
                                     strOrgId,
                                     strUserType,
                                     strAppId, nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    return nil;
}

#pragma mark --- Add User ---

+(NSDictionary *)createAddUserApiParameters:(WiSeCloudUserAPIRequest *)request {
    // Preparing POST sign up api parameters
    NSString * shaString          = [WiSeNetworkUtil createSHA512:request.userPassword];
    shaString                     = [shaString stringByReplacingOccurrencesOfString:@"<" withString:@""];
    shaString                     = [shaString stringByReplacingOccurrencesOfString:@">" withString:@""];
    shaString                     = [shaString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString * strUserEmail       = [request.userEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString * strUserName        = [request.userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString * strUserDisplayName = [request.userDisplayName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString * strUserType        = [NSString stringWithFormat:@"%d",request.userType];
    NSString * strUserId          = [NSString stringWithFormat:@"%d",request.userCloudId];
    NSString * strTempId          = [NSString stringWithFormat:@"%d",request.tempId];
    
    strUserEmail                  = strUserEmail?strUserEmail:@"";
    strUserName                   = strUserName?strUserName:@"";
    strUserDisplayName            = strUserDisplayName?strUserDisplayName:@"";
    
    id userOrgAss = nil;
    
    if (request.userOrganizationDetails && [request.userOrganizationDetails count]) {
        userOrgAss = [self getUserOrganizationAssociationList:request.userOrganizationDetails];
    }else {
        userOrgAss = @"";
    }
    
    NSArray *keys    = [NSArray arrayWithObjects: USER_NAME,
                        USER_EMAIL,
                        USER_DISPLAY_NAME,
                        USER_PASSWORD,
                        USER_TYPE,
                        ORG_DETAILS,
                        USER_ID,
                        TEMP_ID,nil];

    NSArray *objects = [NSArray arrayWithObjects:strUserName,
                        strUserEmail,
                        strUserDisplayName,
                        shaString,
                        strUserType,
                        userOrgAss,
                        strUserId,
                        strTempId,
                        nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    return nil;
}

+ (NSArray *) getUserOrganizationAssociationList : (NSArray *) list {
    NSMutableArray * arrList = nil;
    list = [WiSeNetworkUtil replaceNullValues:list];
    if ([WiSeNetworkUtil isArrayValid:list]) {
        arrList = [[NSMutableArray alloc] init];
        for (int i = 0; i < list.count; i++) {
            WiSeCloudOrganizationInfo * details = [list objectAtIndex:i];
            if (details) {
                
                NSString * strOrganizationId = [NSString stringWithFormat:@"%d",details.organizationId];
                NSString * strPermissionId   = [NSString stringWithFormat:@"%d",details.permissionId];

                NSDictionary * dict          = [NSDictionary dictionaryWithObjectsAndKeys:strOrganizationId,ORG_ID,strPermissionId,PERMISSION_ID,nil];
                
                [arrList addObject:dict];
            }
        }
    }
    return arrList;
}

+(NSArray *)createAddUserApiParameters1:(WiSeCloudUserAPIRequest *)request { // For Future
    NSMutableArray * arrJson = nil;
    
    NSArray * userLists = request.usersList;
    userLists = [WiSeNetworkUtil replaceNullValues:userLists];
    if ([WiSeNetworkUtil isArrayValid:userLists]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i< userLists.count; i++) {
            WiSeCloudUserInfo * userInfo = [userLists objectAtIndex:i];
            if (userInfo) {
                NSDictionary * dictJson ;//= [self createAddUserApiParameters:userInfo];
                if (dictJson) {
                    [arrJson addObject:dictJson];
                }
            }
        }
    }
    return arrJson;
}

#pragma mark --- Change Password ---

+(NSDictionary*)createChangePasswordApiParameters:(WiSeChangePasswordApiRequest*)request
{
    NSString *shaStringOldPassword = [WiSeNetworkUtil createSHA512:request.oldPassword];
    NSString *shaStringNewPassword = [WiSeNetworkUtil createSHA512:request.changedPassword];

    shaStringOldPassword           = [shaStringOldPassword  stringByReplacingOccurrencesOfString:@"<" withString:@""];
    shaStringNewPassword           = [shaStringNewPassword  stringByReplacingOccurrencesOfString:@"<" withString:@""];
    shaStringOldPassword           = [shaStringOldPassword  stringByReplacingOccurrencesOfString:@">" withString:@""];
    shaStringNewPassword           = [shaStringNewPassword  stringByReplacingOccurrencesOfString:@">" withString:@""];
    shaStringOldPassword           = [shaStringOldPassword  stringByReplacingOccurrencesOfString:@" " withString:@""];
    shaStringNewPassword           = [shaStringNewPassword  stringByReplacingOccurrencesOfString:@" " withString:@""];

    NSArray *keys                  = [NSArray arrayWithObjects:NEW_PASSWORD, OLD_PASSWORD, nil];
    NSArray *objects               = [NSArray arrayWithObjects:shaStringNewPassword, shaStringOldPassword, nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    return nil;
}

#pragma mark --- Forgot Password ---

+(NSDictionary*)createForgotPasswordApiParameters:(WiSeForgotPasswordAPIRequest *)request {
    
    NSString * strOrgId = [NSString stringWithFormat:@"%d",request.organizationId];
    NSString * strAppId = [NSString stringWithFormat:@"%d",request.appId];
    request.userName    = request.userName?request.userName:@"";

    NSArray *keys       = [NSArray arrayWithObjects:ORGANIZATIONID,
                           APPId,
                           USER_NAME,nil];
    
    NSArray *objects    = [NSArray arrayWithObjects:strOrgId,
                           strAppId,
                           request.userName, nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    return nil;
}

#pragma mark --- Update User Profile ---

+(NSDictionary*)createUpdateUserProfileApiParameters:(WiSeUpdateUserProfileAPIRequest *)request {
    request.userName = request.userName?request.userName:@"";
    request.emaiId   = request.emaiId?request.emaiId:@"";
    // Preparing edit profile api parameters
    NSArray *keys    = [NSArray arrayWithObjects:DISPLAY_NAME, USER_EMAIL, nil];
    NSArray *objects = [NSArray arrayWithObjects:request.userName,request.emaiId, nil];
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    return nil;
    
}

#pragma mark --- Update Devive Token ---

+(NSDictionary*)createUpdateDeviceTokenApiParameters:(WiSeUpdateDeviceTokenAPIRequest *)request{
    
    NSString * strOrgId          = [NSString stringWithFormat:@"%d",request.organizationId];
    NSString * strAppId          = [NSString stringWithFormat:@"%d",request.appId];
    request.deviceToken          = request.deviceToken?request.deviceToken:@"";
    NSDictionary *jsonDictionary = nil;
    
    NSArray *keys                = [NSArray arrayWithObjects:ORGANIZATIONID,
                                    APPId,
                                    DEVICE_TOKEN,nil];
    
    NSArray *objects             = [NSArray arrayWithObjects:strOrgId,
                                    strAppId,
                                    request.deviceToken, nil];
    
    if (keys.count == objects.count) {
        jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    }
    
    return jsonDictionary;
}

@end
