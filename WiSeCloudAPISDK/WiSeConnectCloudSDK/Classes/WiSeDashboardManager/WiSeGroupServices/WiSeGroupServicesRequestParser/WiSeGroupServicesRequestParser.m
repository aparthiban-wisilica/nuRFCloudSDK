//
//  WiSeGroupServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 28/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeGroupServicesRequestParser.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudGroupAPIRequest.h"
#import "WiSeDashBoardItems.h"


@implementation WiSeGroupServicesRequestParser

#pragma mark --- Add Group ---

+ (NSMutableArray *) createAddGroupApiParameters : (WiSeCloudGroupAPIRequest *) request {
    
    NSArray * arrAddGroupDetails = request.groupList;
    arrAddGroupDetails = [WiSeNetworkUtil replaceNullValues:arrAddGroupDetails];
    NSMutableArray * jsonArray = nil;
    if ([WiSeNetworkUtil isArrayValid:arrAddGroupDetails]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrAddGroupDetails.count; i++) {
            WiSeDashBoardItems * details = [arrAddGroupDetails objectAtIndex:i];
            if (details) {
                
                NSString * strMeshId            = [NSString stringWithFormat:@"%d",details.groupMeshId];

                details.groupName               = details.groupName?details.groupName:@"";
                details.parentGroupPath         = details.parentGroupPath?details.parentGroupPath:@"";

                NSString * strGroupIconId       = [NSString stringWithFormat:@"%d",details.groupIconId];
                NSString * strSequenceNumber    = [NSString stringWithFormat:@"%d",details.groupSequenceNumber];
                NSString * strParentGroupId     = [NSString stringWithFormat:@"%d",details.parentGroupCloudId];
                NSString * strParentGroupMeshId = [NSString stringWithFormat:@"%d",details.parentGroupMeshId];
                NSString * strGroupLevel        = [NSString stringWithFormat:@"%d",details.groupLevel];
                NSString * strTempId            = [NSString stringWithFormat:@"%d",details.tempId];

                NSArray *keys                   = [NSArray arrayWithObjects:WISE_GROUP_NAME,
                                                   WISE_GROUP_ICON_ID,
                                                   GROUP_MESH_ID,
                                                   WISE_GROUP_SEQUENCE_NUMBER,
                                                   PARENT_GROUP_ID,
                                                   PARENT_GROUP_MESH_ID,
                                                   PARENT_GROUP_PATH,
                                                   GROUP_LEVEL,
                                                   TEMP_ID, nil];

                NSArray *objects                = [NSArray arrayWithObjects:details.groupName,
                                                   strGroupIconId,
                                                   strMeshId,
                                                   strSequenceNumber,
                                                   strParentGroupId,
                                                   strParentGroupMeshId,
                                                   details.parentGroupPath,
                                                   strGroupLevel,
                                                   strTempId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary];
                }
                
            }
        }
    }
    
    return jsonArray;
}

#pragma mark --- Edit Group ---

+ (NSMutableArray *) createEditGroupApiParameters : (WiSeCloudGroupAPIRequest *) request {
    NSArray * arrEditGroupDetails = request.groupList;
    arrEditGroupDetails = [WiSeNetworkUtil replaceNullValues:arrEditGroupDetails];
    NSMutableArray * jsonArray = nil;
    if ([WiSeNetworkUtil isArrayValid:arrEditGroupDetails]) {
        jsonArray = [[NSMutableArray alloc] init];
        for ( int i = 0; i<arrEditGroupDetails.count; i++) {
            WiSeDashBoardItems * details = [arrEditGroupDetails objectAtIndex:i];
            if (details) {
                details.groupName               = details.groupName?details.groupName:@"";
                NSString * strGroupIconId       = [NSString stringWithFormat:@"%d",details.groupIconId];
                NSString * strGroupCloudId      = [NSString stringWithFormat:@"%d",details.groupCloudId];
                NSString * strMeshId            = [NSString stringWithFormat:@"%d",details.groupMeshId];
                NSString * strSequenceNumber    = [NSString stringWithFormat:@"%d",details.groupSequenceNumber];

                NSString * strParentGroupId     = [NSString stringWithFormat:@"%d",details.parentGroupCloudId];
                NSString * strParentGroupMeshId = [NSString stringWithFormat:@"%d",details.parentGroupMeshId];
                details.parentGroupPath         = details.parentGroupPath?details.parentGroupPath:@"";
                NSString * strGroupLevel        = [NSString stringWithFormat:@"%d",details.groupLevel];
                NSString * strTempId            = [NSString stringWithFormat:@"%d",details.tempId];

                NSArray *keys                   = [NSArray arrayWithObjects:WISE_GROUP_NAME,
                                                   WISE_GROUP_ICON_ID,
                                                   GROUP_ID,
                                                   GROUP_MESH_ID,
                                                   WISE_GROUP_SEQUENCE_NUMBER,
                                                   PARENT_GROUP_ID,
                                                   PARENT_GROUP_MESH_ID,
                                                   PARENT_GROUP_PATH,
                                                   GROUP_LEVEL,
                                                   TEMP_ID,nil];

                NSArray *objects                = [NSArray arrayWithObjects:details.groupName,
                                                   strGroupIconId,
                                                   strGroupCloudId,
                                                   strMeshId,
                                                   strSequenceNumber,
                                                   strParentGroupId,
                                                   strParentGroupMeshId,
                                                   details.parentGroupPath,
                                                   strGroupLevel,
                                                   strTempId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary];
                }
                
            }
        }
    }
    return jsonArray;
}

#pragma mark --- Delete Group ---

+ (NSMutableArray *) createDeleteGroupApiParameters : (WiSeCloudGroupAPIRequest *) request {
    NSArray * arrEditGroupDetails = request.groupList;
    arrEditGroupDetails = [WiSeNetworkUtil replaceNullValues:arrEditGroupDetails];
    NSMutableArray * jsonArray = nil;
    if ([WiSeNetworkUtil isArrayValid:arrEditGroupDetails]) {
        jsonArray = [[NSMutableArray alloc] init];
        for ( int i = 0; i<arrEditGroupDetails.count; i++) {
            WiSeDashBoardItems * details = [arrEditGroupDetails objectAtIndex:i];
            if (details) {
    
                NSString * strGroupCloudId = [NSString stringWithFormat:@"%d",details.groupCloudId];
                
                NSArray *keys = [NSArray arrayWithObjects:GROUP_ID,nil];
                
                NSArray *objects = [NSArray arrayWithObjects:strGroupCloudId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary];
                }
                
            }
        }
    }
    return jsonArray;
}

//#pragma mark --- Get Group ---
//
//+ (NSMutableArray *) createGetGroupApiParameters : (WiSeGetGroupAPIRequest *) request {
//    return nil;
//}

@end
