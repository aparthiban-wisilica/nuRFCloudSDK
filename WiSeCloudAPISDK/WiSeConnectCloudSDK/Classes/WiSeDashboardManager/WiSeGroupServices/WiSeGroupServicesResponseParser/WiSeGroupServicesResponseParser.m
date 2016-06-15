//
//  WiSeGroupServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 28/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeGroupServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeGroupDetails.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudGroupAPIResponse.h"
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

@implementation WiSeGroupServicesResponseParser

#pragma mark --- Common Methods ---

+ (WiSeCloudGroupAPIResponse *) appendBasicDetails : (WiSeCloudGroupAPIResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse {
    
    if (currentResponse) {
        currentResponse.statusMessage                    = basicResponse.statusMessage;
        currentResponse.apiId                            = basicResponse.apiId;
        currentResponse.startTime                        = basicResponse.startTime;
        currentResponse.endTime                          = basicResponse.endTime;
        currentResponse.executionTime                    = basicResponse.executionTime;
        currentResponse.urlResponseStatusCode            = basicResponse.urlResponseStatusCode;
    }
    return currentResponse;
    
}

+ (NSMutableArray *) getGroupDetailsFromResponseData : (NSDictionary *) dictResponse {
    
    NSMutableArray * arrGroupDetails = nil;

    if (dictResponse) {
        NSArray * arrOfGroups = [dictResponse objectForKey:DATA];
        arrOfGroups           = [WiSeNetworkUtil replaceNullValues:arrOfGroups];
        
        if ([WiSeNetworkUtil isArrayValid:arrOfGroups]) {
            arrGroupDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOfGroups.count; i++) {
                NSDictionary * dict = [arrOfGroups objectAtIndex:i];
                dict = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    if ([dict objectForKey:GROUP_ID]) {
                        WiSeGroupDetails * groupDetails  = [WiSeGroupDetails new];

                        groupDetails.groupCloudId        = [[dict objectForKey:GROUP_ID] intValue];
                        groupDetails.groupName           = [dict objectForKey:WISE_GROUP_NAME];
                        groupDetails.groupIconId         = [[dict objectForKey:WISE_GROUP_ICON_ID] intValue];
                        groupDetails.groupMeshId         = [[dict objectForKey:GROUP_MESH_ID] intValue];
                        groupDetails.groupStatus         = [[dict objectForKey:GROUP_STATUS] intValue];
                        groupDetails.groupSequenceNumber = [[dict objectForKey:WISE_GROUP_SEQUENCE_NUMBER] intValue];
                        groupDetails.timeStamp           = [[dict objectForKey:TIMESTAMP] doubleValue];
                        groupDetails.status              = [[dict objectForKey:_STATUS] intValue];
                        groupDetails.message             = [dict objectForKey:MESSAGE];
                        groupDetails.parentGroupCloudId  = [[dict objectForKey:PARENT_GROUP_ID] intValue];
                        groupDetails.parentGroupMeshId   = [[dict objectForKey:PARENT_GROUP_MESH_ID] intValue];
                        groupDetails.groupPath           = [dict objectForKey:GROUP_PATH];
                        groupDetails.groupLevel          = [[dict objectForKey:GROUP_LEVEL] intValue];
                        groupDetails.tempId              = [[dict objectForKey:TEMP_ID] intValue];
                        
                        [arrGroupDetails addObject:groupDetails];

                    }
                    
                }
            }
        }
        
    }
    
    
    return arrGroupDetails;
}

#pragma mark --- Add Group ---

+ (WiSeCloudGroupAPIResponse *) parseAddGroupAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            WiSeCloudGroupAPIResponse * response  = [WiSeCloudGroupAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];

            response.groupList                    = [self getGroupDetailsFromResponseData:dictResponse];
            return response;
        }
    }
    return nil;
}


#pragma mark --- Edit Group ---

+ (WiSeCloudGroupAPIResponse *) parseEditGroupAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {

            WiSeCloudGroupAPIResponse * response  = [WiSeCloudGroupAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];

            response.groupList                    = [self getGroupDetailsFromResponseData:dictResponse];
            return response;
        }
    }
    return nil;
}

#pragma mark --- Delete Group ---

+ (WiSeCloudGroupAPIResponse *) parseDeleteGroupAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            WiSeCloudGroupAPIResponse * response  = [WiSeCloudGroupAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];

            response.groupList                    = [self getGroupDetailsFromResponseData:dictResponse];
            return response;
        }
    }
    return nil;

}

#pragma mark --- Get Group ---

+ (WiSeCloudGroupAPIResponse *) parseGetGroupAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            WiSeCloudGroupAPIResponse * response  = [WiSeCloudGroupAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            NSDictionary * dict = [dictResponse objectForKey:DATA];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:GROUP_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount           = [[[dictResponse objectForKey:DATA] objectForKey:GROUP_COUNT] intValue];
                    if (totalCount > 0) {
                        response.groupList       = [self getGroupDetailsFromResponseData1:dictResponse];
                        int groupCount           = (int)response.groupList.count;
                        response.remainingGroups = totalCount - groupCount;
                        
                    }
                }  
            }
            
            return response;
        }
    }
    return nil;
}

+ (NSMutableArray *) getGroupDetailsFromResponseData1 : (NSDictionary *) dictResponse {
    
    NSMutableArray * arrGroupDetails = nil;
    
    if (dictResponse) {
        NSArray * arrOfGroups = [[dictResponse objectForKey:DATA] objectForKey:GROUP_DETAILS];
        arrOfGroups           = [WiSeNetworkUtil replaceNullValues:arrOfGroups];
        
        if ([WiSeNetworkUtil isArrayValid:arrOfGroups]) {
            arrGroupDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOfGroups.count; i++) {
                NSDictionary * dict = [arrOfGroups objectAtIndex:i];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    if ([dict objectForKey:GROUP_ID]) {
                        WiSeGroupDetails * groupDetails  = [WiSeGroupDetails new];
                        groupDetails.groupCloudId        = [[dict objectForKey:GROUP_ID] intValue];
                        groupDetails.groupName           = [dict objectForKey:WISE_GROUP_NAME];
                        groupDetails.groupIconId         = [[dict objectForKey:WISE_GROUP_ICON_ID] intValue];
                        groupDetails.groupMeshId         = [[dict objectForKey:GROUP_MESH_ID] intValue];
                        groupDetails.groupStatus         = [[dict objectForKey:GROUP_STATUS] intValue];
                        groupDetails.groupSequenceNumber = [[dict objectForKey:WISE_GROUP_SEQUENCE_NUMBER] intValue];
                        groupDetails.timeStamp           = [[dict objectForKey:TIMESTAMP] doubleValue];
                        groupDetails.status              = [[dict objectForKey:_STATUS] intValue];
                        groupDetails.message             = [dict objectForKey:MESSAGE];
                        groupDetails.parentGroupCloudId  = [[dict objectForKey:PARENT_GROUP_ID] intValue];
                        groupDetails.parentGroupMeshId   = [[dict objectForKey:PARENT_GROUP_MESH_ID] intValue];
                        groupDetails.groupPath           = [dict objectForKey:GROUP_PATH];
                        groupDetails.groupLevel          = [[dict objectForKey:GROUP_LEVEL] intValue];
                        groupDetails.tempId              = [[dict objectForKey:TEMP_ID] intValue];
                        
                        [arrGroupDetails addObject:groupDetails];

                    }
                    
                }
            }
        }
        
    }
    
    
    return arrGroupDetails;
}


@end
