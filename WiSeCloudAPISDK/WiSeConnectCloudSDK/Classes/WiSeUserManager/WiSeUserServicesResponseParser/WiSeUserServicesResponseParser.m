//
//  WiSeUserServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 27/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeUserServicesResponseParser.h"
#import "WiSeRegisterAppInfoAPIResponse.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeLoginApiResponse.h"
#import "WiSeSignUpApiResponse.h"
#import "WiSeChangePasswordApiResponse.h"
#import "WiSeForgotPasswordAPIResponse.h"
#import "WiSeLogoutAPIResponse.h"
#import "WiSeUpdateUserProfileAPIResponse.h"
#import "WiSeUpdateDeviceTokenAPIResponse.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudUserAPIResponse.h"
#import "WiSeListRolesAPIResponse.h"
#import "WiSeCloudOrganizationInfo.h"

@implementation WiSeUserServicesResponseParser


#pragma mark - Save APP Info

+ (WiSeRegisterAppInfoAPIResponse *) parseSaveAppInfoAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            WiSeRegisterAppInfoAPIResponse * response = [WiSeRegisterAppInfoAPIResponse new];
            WiSeCloudApiResponse * statusResponse     = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                    = statusResponse.statusMessage;
            response.apiId                            = statusResponse.apiId;
            response.startTime                        = statusResponse.startTime;
            response.endTime                          = statusResponse.endTime;
            response.executionTime                    = statusResponse.executionTime;
            response.urlResponseStatusCode            = statusResponse.urlResponseStatusCode;
            response.statusCode                       = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            response.appId                            = [[[dictResponse objectForKey:DATA] objectForKey:APPId] intValue];
            return response;
        }
    }
    return nil;
    
}

#pragma mark - Login Info

+ (WiSeLoginApiResponse *) parseLoginAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            WiSeLoginApiResponse * response       = [[WiSeLoginApiResponse alloc] init];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            NSDictionary * dict                   = [dictResponse objectForKey:DATA];
            
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                response.isBridge                     = [[dict objectForKey:IS_BRIDGE] boolValue];
                response.phoneCloudId                 = [[dict objectForKey:PHONE_LONG_ID] intValue];
                response.phoneMeshId                  = [[dict objectForKey:PHONE_MESH_ID] intValue];
                response.messageId                    = [[dict objectForKey:MESSAGE_ID] intValue];
                response.userDefaultGroupCloudId      = [[dict objectForKey:USER_DEFAULT_GROUP_ID] intValue];
                response.token                        = [dict objectForKey:TOKEN];
                response.userDisplayName              = [dict objectForKey:USER_DISPLAY_NAME];
                response.userCloudId                  = [[dict objectForKey:USER_ID] intValue];
                response.emailId                      = [dict objectForKey:USER_EMAIL];
                response.operationMessageTimestamp    = [[dict objectForKey:OPERATION_MESSAGE_TIMESTAMP] doubleValue];
                response.otherMessageTimestamp        = [[dict objectForKey:OTHER_MESSAGE_TIMESTAMP] doubleValue];
                response.userType                     = [[dict objectForKey:USER_TYPE] intValue];
                response.customerKey                  = [dict objectForKey:CUSTOMER_KEY];
                
                NSArray * arrOfOrgs = [dict objectForKey:ORG_DETAILS];
                NSMutableArray * arrOrgDetails = nil;
                arrOfOrgs = [WiSeNetworkUtil replaceNullValues:arrOfOrgs];
                if ([WiSeNetworkUtil isArrayValid:arrOfOrgs]) {
                    arrOrgDetails = [[NSMutableArray alloc] init];
                    for (int i = 0; i < arrOfOrgs.count; i++) {
                        NSDictionary * dict1 = [arrOfOrgs objectAtIndex:i];
                        dict1                = [WiSeNetworkUtil replaceNullValues:dict1];
                        if ([WiSeNetworkUtil isDictionaryValid:dict1]) {
                            WiSeCloudOrganizationInfo * orgInfo = [WiSeCloudOrganizationInfo new];
                            orgInfo.permissionId                = [[dict1 objectForKey:PERMISSION_ID] intValue];
                            orgInfo.rootOrganizationId          = [[dict1 objectForKey:PARENT_ID] intValue];
                            orgInfo.organizationId              = [[dict1 objectForKey:ORG_ID] intValue];
                            [arrOrgDetails addObject:orgInfo];
                        }
                    }
                }
                
                response.organizationsList = arrOrgDetails;
                
                if ([dict valueForKey:PHONE_MESH_ID]!= NULL)
                {
                    response.phoneMeshId    = [[dict objectForKey:PHONE_MESH_ID] intValue];
                }
                
                if ([dict objectForKey:NETWORK_ID]!= NULL)
                {
                    uint16_t networkId = [[dict objectForKey:NETWORK_ID] intValue];
                    networkId = CFSwapInt16(networkId);
                    response.userNetworkID  = [NSData dataWithBytes: &networkId length: sizeof(networkId)];
                }
                
                if ([dict objectForKey:NETWORK_KEY]!= NULL)
                {
                    response.userNetworkKey = [WiSeNetworkUtil convertBase64StringToDataWithString:[dict objectForKey:NETWORK_KEY]];
                }
            }
            
            
            return response;
            
        }
    }
    return nil;
}

#pragma mark - Sign Up Info

+ (WiSeSignUpApiResponse *) parseSignUpAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            WiSeSignUpApiResponse * response      = [WiSeSignUpApiResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];

            response.userId                       = [[[dictResponse objectForKey:DATA] objectForKey:USER_ID] intValue];
            return response;
            
        }
        
    }
    return nil;
}

#pragma mark - Add & Edit User

+ (WiSeCloudUserAPIResponse *) parseAddEditUserAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            WiSeCloudUserAPIResponse * response   = [WiSeCloudUserAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage           = statusResponse.statusMessage;
            response.apiId                   = statusResponse.apiId;
            response.startTime               = statusResponse.startTime;
            response.endTime                 = statusResponse.endTime;
            response.executionTime           = statusResponse.executionTime;
            response.urlResponseStatusCode   = statusResponse.urlResponseStatusCode;
            response.statusCode              = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            if ([WiSeNetworkUtil isArrayValid:[dictResponse objectForKey:DATA]]) {
//                response.userCloudId              = [[[dictResponse objectForKey:DATA] objectForKey:USER_ID] intValue];
//
//                response.userInfo                 = [WiSeCloudUserInfo new];
//                response.userInfo.userName        = [[dictResponse objectForKey:DATA] objectForKey:USER_NAME];
//                response.userInfo.userCloudId     = [[[dictResponse objectForKey:DATA] objectForKey:USER_ID] intValue];
//                response.userInfo.userType        = [[[dictResponse objectForKey:DATA] objectForKey:USER_TYPE] intValue];
//                response.userInfo.userPassword    = [[dictResponse objectForKey:DATA] objectForKey:USER_PASSWORD];
//                response.userInfo.userDisplayName = [[dictResponse objectForKey:DATA] objectForKey:USER_DISPLAY_NAME];
//                response.userInfo.emailId         = [[dictResponse objectForKey:DATA] objectForKey:USER_EMAIL];
//                response.userInfo.userStatus      = [[[dictResponse objectForKey:DATA] objectForKey:USER_STATUS] intValue];
//                response.tempId                   = [[[dictResponse objectForKey:DATA] objectForKey:TEMP_ID] intValue];
//                response.userInfo.organizationsList  = [self getUserOrgList:[[dictResponse objectForKey:DATA] objectForKey:ORG_DETAILS]];
//
//                response.status                   = [[[dictResponse objectForKey:DATA] objectForKey:_STATUS] intValue];
//                response.message                  = [[dictResponse objectForKey:DATA] objectForKey:MESSAGE];
//                response.userOrganizationDetails  = [self getUserOrgList:[[dictResponse objectForKey:DATA] objectForKey:ORG_DETAILS]];
//                response.usersList = [self getAddEditUserList:[dictResponse objectForKey:DATA]];
                
            }
            
            NSDictionary * dict = [dictResponse objectForKey:DATA];
            dict                = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
//                id value = [[dictResponse objectForKey:DATA] objectForKey:USER_COUNT];
//                
//                if([value respondsToSelector:@selector(integerValue)]) {
//                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:USER_COUNT] intValue];
//                    
//                    if (totalCount > 0) {
//                        
//                        int zoneCount           = (int)response.usersList.count;
//                        response.remainingUsers = totalCount - zoneCount;
//                    }
//                }
                response.usersList      = [self getUsersListFromDataArray:[[dictResponse objectForKey:DATA] objectForKey:USER_DETAILS]];
                
            }


            return response;
            
        }
        
    }
    return nil;
}

+ (NSArray *) getAddEditUserList : (NSArray *) dataArray {
    NSMutableArray * arrUserList = nil;
    
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        arrUserList = [[NSMutableArray alloc] init];
        for (int i =0 ; i< dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                WiSeCloudUserInfo * userInfo = [WiSeCloudUserInfo new];

                userInfo.userName            = [dict objectForKey:USER_NAME];
                userInfo.userCloudId         = [[dict objectForKey:USER_ID] intValue];
                userInfo.userType            = [[dict objectForKey:USER_TYPE] intValue];
                userInfo.userPassword        = [dict objectForKey:USER_PASSWORD];
                userInfo.userDisplayName     = [dict objectForKey:USER_DISPLAY_NAME];
                userInfo.emailId             = [dict objectForKey:USER_EMAIL];
                userInfo.userStatus          = [[dict objectForKey:USER_STATUS] intValue];
                userInfo.tempId              = [[dict objectForKey:TEMP_ID] intValue];
                userInfo.organizationsList   = [self getUserOrgList:[dict objectForKey:ORG_DETAILS]];

                userInfo.status              = [[dict objectForKey:_STATUS] intValue];
                userInfo.message             = [dict objectForKey:MESSAGE];
                [arrUserList addObject:userInfo];

            }
        }
    }
    
    return arrUserList;
}

+ (NSArray *) getUserOrgList : (NSArray *) orgList {
    NSMutableArray * arrOrgDetails = nil;
    if (orgList) {
        orgList = [WiSeNetworkUtil replaceNullValues:orgList];
        
        if ([WiSeNetworkUtil isArrayValid:orgList]) {
            arrOrgDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < orgList.count; i++) {
                NSDictionary * dict = [orgList objectAtIndex:i];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    if ([dict objectForKey:ORG_ID]) {
                        
                        WiSeCloudOrganizationInfo * details = [WiSeCloudOrganizationInfo new];
                        details.message                     = [dict objectForKey:MESSAGE];
                        details.status                      = [[dict objectForKey:_STATUS] intValue];
                        details.organizationId              = [[dict objectForKey:ORG_ID] intValue];
                        details.permissionId                = [[dict objectForKey:PERMISSION_ID] intValue];
                        
                        [arrOrgDetails addObject:details];
                    }
                }
            }
        }
    }
    return arrOrgDetails;
}

#pragma mark - ChangePassword

+ (WiSeChangePasswordApiResponse *) parseChangePasswordAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            WiSeChangePasswordApiResponse * response = [[WiSeChangePasswordApiResponse alloc] init];
            WiSeCloudApiResponse * statusResponse    = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage         = statusResponse.statusMessage;
            response.apiId                 = statusResponse.apiId;
            response.startTime             = statusResponse.startTime;
            response.endTime               = statusResponse.endTime;
            response.executionTime         = statusResponse.executionTime;
            response.urlResponseStatusCode = statusResponse.urlResponseStatusCode;
            response.statusCode            = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            return response;
        }
        
    }
    return nil;
}

#pragma mark - ForgotPassword 

+ (WiSeForgotPasswordAPIResponse *) parseForgotPasswordAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            WiSeForgotPasswordAPIResponse * response = [[WiSeForgotPasswordAPIResponse alloc] init];
            WiSeCloudApiResponse * statusResponse    = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                   = statusResponse.statusMessage;
            response.apiId                           = statusResponse.apiId;
            response.startTime                       = statusResponse.startTime;
            response.endTime                         = statusResponse.endTime;
            response.executionTime                   = statusResponse.executionTime;
            response.urlResponseStatusCode           = statusResponse.urlResponseStatusCode;
            response.statusCode                      = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            return response;
        }
        
    }
    return nil;
}

#pragma mark - Logout

+ (WiSeLogoutAPIResponse *) parseLogoutPasswordAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            WiSeLogoutAPIResponse * response      = [[WiSeLogoutAPIResponse alloc] init];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.executionTime                = statusResponse.executionTime;
            response.endTime                      = statusResponse.endTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            return response;
        }
    }
    return nil;
}

#pragma mark - UpdateUserProfile

+ (WiSeUpdateUserProfileAPIResponse *) parseUpdateUserProfilePasswordAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            WiSeUpdateUserProfileAPIResponse * response = [[WiSeUpdateUserProfileAPIResponse alloc] init];
            WiSeCloudApiResponse * statusResponse       = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                      = statusResponse.statusMessage;
            response.apiId                              = statusResponse.apiId;
            response.startTime                          = statusResponse.startTime;
            response.endTime                            = statusResponse.endTime;
            response.executionTime                      = statusResponse.executionTime;
            response.urlResponseStatusCode              = statusResponse.urlResponseStatusCode;
            response.statusCode                         = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            return response;
        }
        
    }
    return nil;
    
}

#pragma mark - UpdateDeviceToken

+ (WiSeUpdateDeviceTokenAPIResponse *) parseUpdateDeviceTokenAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            WiSeUpdateDeviceTokenAPIResponse * response = [[WiSeUpdateDeviceTokenAPIResponse alloc] init];
            WiSeCloudApiResponse * statusResponse       = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                      = statusResponse.statusMessage;
            response.apiId                              = statusResponse.apiId;
            response.startTime                          = statusResponse.startTime;
            response.endTime                            = statusResponse.endTime;
            response.executionTime                      = statusResponse.executionTime;
            response.urlResponseStatusCode              = statusResponse.urlResponseStatusCode;
            response.statusCode                         = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.appId                              = [[[dictResponse objectForKey:DATA] objectForKey:APPId] intValue];
            
            return response;
        }
        
    }
    return nil;
}

#pragma mark - List Roles

+ (WiSeListRolesAPIResponse *) parseListRolesAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            WiSeListRolesAPIResponse * response   = [[WiSeListRolesAPIResponse alloc] init];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.rolesList                    = [self getRolesListFromDataArray:[dictResponse objectForKey:DATA]];

            return response;
        }
        
    }
    return nil;
}

+ (NSMutableArray *) getRolesListFromDataArray : (NSArray *) dataArray {
    NSMutableArray * arrRolesList = nil;
    dataArray                     = [WiSeNetworkUtil replaceNullValues:dataArray];
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        arrRolesList = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict                = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                if ([dict objectForKey:ROLE_ID]) {
                    WiSeRoleInfo * info = [WiSeRoleInfo new];
                    info.roleId         = [[dict objectForKey:ROLE_ID]intValue];
                    info.permissionId   = [[dict objectForKey:PERMISSION_ID]intValue];
                    info.roleName       = [dict objectForKey:ROLE_NAME];
                    [arrRolesList addObject:info];
                }
            }
        }
    }
    return arrRolesList;
}

#pragma mark - List User

+ (WiSeCloudUserAPIResponse *) parseListUsersAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            WiSeCloudUserAPIResponse * response   = [[WiSeCloudUserAPIResponse alloc] init];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
//            response.usersList                    = [self getUsersListFromDataArray:[dictResponse objectForKey:DATA]];
            
            
            NSDictionary * dict = [dictResponse objectForKey:DATA];
            dict                = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:USER_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:USER_COUNT] intValue];
                    
                    if (totalCount > 0) {
                        response.usersList      = [self getUsersListFromDataArray:[[dictResponse objectForKey:DATA] objectForKey:USER_DETAILS]];
                        int zoneCount           = (int)response.usersList.count;
                        response.remainingUsers = totalCount - zoneCount;
                    }
                }
                
            }
            return response;
        }
    }
    return nil;
}

+ (NSMutableArray *) getUsersListFromDataArray : (NSArray *) dataArray {
    NSMutableArray * arrUsersList = nil;
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        arrUsersList = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict                = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                if ([dict objectForKey:USER_ID]) {
                    
                    WiSeCloudUserInfo * info = [WiSeCloudUserInfo new];
                    info.userCloudId         = [[dict objectForKey:USER_ID] intValue];
                    info.userName            = [dict objectForKey:USER_NAME];
                    info.emailId             = [dict objectForKey:USER_EMAIL];
                    info.userType            = [[dict objectForKey:USER_TYPE] intValue];
                    info.userDisplayName     = [dict objectForKey:USER_DISPLAY_NAME];
                    info.userStatus          = [[dict objectForKey:USER_STATUS] intValue];
                    info.timestamp           = [[dict objectForKey:TIMESTAMP] doubleValue];
                    info.status              = [[dict objectForKey:_STATUS] intValue];
                    info.tempId              = [[dict objectForKey:TEMP_ID] intValue];
                    info.message             = [dict objectForKey:MESSAGE];
                    
                    NSArray * arrOfOrgs = [dict objectForKey:ORG_DETAILS];
                    NSMutableArray * arrOrgDetails = nil;
                    arrOfOrgs = [WiSeNetworkUtil replaceNullValues:arrOfOrgs];
                    if ([WiSeNetworkUtil isArrayValid:arrOfOrgs]) {
                        arrOrgDetails = [[NSMutableArray alloc] init];
                        for (int i = 0; i < arrOfOrgs.count; i++) {
                            NSDictionary * dict1 = [arrOfOrgs objectAtIndex:i];
                            dict1                = [WiSeNetworkUtil replaceNullValues:dict1];
                            if ([WiSeNetworkUtil isDictionaryValid:dict1]) {
                                WiSeCloudOrganizationInfo * orgInfo = [WiSeCloudOrganizationInfo new];
                                orgInfo.permissionId                = [[dict1 objectForKey:PERMISSION_ID] intValue];
                                orgInfo.rootOrganizationId          = [[dict1 objectForKey:PARENT_ID] intValue];
                                orgInfo.organizationId              = [[dict1 objectForKey:ORG_ID] intValue];
                                [arrOrgDetails addObject:orgInfo];
                            }
                        }
                    }
                    
                    info.organizationsList = arrOrgDetails;
                    
                    [arrUsersList addObject:info];
                }
            }
        }
    }
    return arrUsersList;
}

#pragma mark - Delete User

+ (WiSeCloudUserAPIResponse *) parseDeleteUsersAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            WiSeCloudUserAPIResponse * response   = [[WiSeCloudUserAPIResponse alloc] init];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];

//            if ([WiSeNetworkUtil isArrayValid:[dictResponse objectForKey:DATA]]) {
//                response.usersList = [self getAddEditUserList:[dictResponse objectForKey:DATA]];            }
            
            NSDictionary * dict = [dictResponse objectForKey:DATA];
            dict                = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
//                id value = [[dictResponse objectForKey:DATA] objectForKey:USER_COUNT];
//                
//                if([value respondsToSelector:@selector(integerValue)]) {
//                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:USER_COUNT] intValue];
//                    
//                    if (totalCount > 0) {
//                        
//                        int zoneCount           = (int)response.usersList.count;
//                        response.remainingUsers = totalCount - zoneCount;
//                    }
//                }
                
                response.usersList      = [self getUsersListFromDataArray:[[dictResponse objectForKey:DATA] objectForKey:USER_DETAILS]];
                
            }

//            
            return response;
        }
    }
    return nil;
}



@end
