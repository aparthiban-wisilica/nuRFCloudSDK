//
//  WiSeTagManagerServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeTagManagerServicesRequestParser.h"
#import "WiSeCloudTagRequest.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudTagInfo.h"

@implementation WiSeTagManagerServicesRequestParser

#pragma mark --- Add Tag ---

+ (NSMutableArray *) createAddTagApiParameters : (WiSeCloudTagRequest *)    request {
    NSArray * arrAddTagDetails = request.tagsList;
    arrAddTagDetails = [WiSeNetworkUtil replaceNullValues:arrAddTagDetails];
    NSMutableArray * jsonArray = nil;
    if ([WiSeNetworkUtil isArrayValid:arrAddTagDetails]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrAddTagDetails.count; i++) {
            WiSeCloudTagInfo * details = [arrAddTagDetails objectAtIndex:i];
            if (details) {
                
                NSString * strTagMajor   = [NSString stringWithFormat:@"%d",details.tagMajor];
                NSString * strTagMinor   = [NSString stringWithFormat:@"%d",details.tagMinor];
                NSString * strTagMeshId  = [NSString stringWithFormat:@"%d",details.tagMeshId];
                NSString * strTagName    = [NSString stringWithFormat:@"%@",details.tagName];
                NSString * strTagId      = [NSString stringWithFormat:@"%d",details.tagCloudId];
                NSString * strOrgId      = [NSString stringWithFormat:@"%d",details.organizationId];
                NSString * strAdInterval = [NSString stringWithFormat:@"%d",details.advInterval];
                NSString * strTxPower    = [NSString stringWithFormat:@"%d",details.txPower];
                NSString * strChannel    = [NSString stringWithFormat:@"%d",details.channel];
                NSString * strTempId     = [NSString stringWithFormat:@"%d",details.tempId];

                details.deviceUUID       = details.deviceUUID?details.deviceUUID:@"";
                details.layerId          = details.layerId?details.layerId:@"";

                NSArray *keys            = [NSArray arrayWithObjects:TAG_MESH_ID,
                                           TAG_NAME,
                                           TAG_MAJOR,
                                           TAG_MINOR,
                                           TAG_ID,
                                           ORG_ID,
                                           WISE_DEVICE_UUID,
                                           TX_POWER,
                                           ADV_INTERVAL,
                                           CHANNAL,
                                            TEMP_ID,
                                            LAYER_ID, nil];

                NSArray *objects         = [NSArray arrayWithObjects:strTagMeshId,
                                           strTagName,
                                           strTagMajor,
                                           strTagMinor,
                                           strTagId,
                                           strOrgId,
                                           details.deviceUUID,
                                           strTxPower,
                                           strAdInterval,
                                           strChannel,
                                            strTempId,
                                            details.layerId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary];
                }
            }
        }
    }
    
    return jsonArray;
}

+ (NSDictionary *) createAddTagApiParameters1 : (WiSeCloudTagRequest *)    request {
    NSDictionary * dict = nil;
    NSArray * arr = [self createAddTagApiParameters:request];
    
    if (arr) {
        
        dict = [[NSDictionary alloc] initWithObjectsAndKeys:arr,@"tags", nil];
    }
    
    return dict;
}

#pragma mark --- Edit Tag ---

+ (NSMutableArray *) createEditTagApiParameters : (WiSeCloudTagRequest *)    request {
    return [self createAddTagApiParameters:request];
}

#pragma mark --- Delete Tag ---

+ (NSMutableArray *) createDeleteTagApiParameters : (WiSeCloudTagRequest *)    request {
    return [self createAddTagApiParameters:request];
}

#pragma mark --- Secure Tag ---

+ (NSMutableArray *) createSecureTagApiParameters : (WiSeCloudTagRequest *)    request {
    NSArray * arrAddTagDetails = request.tagsList;
    arrAddTagDetails = [WiSeNetworkUtil replaceNullValues:arrAddTagDetails];
    NSMutableArray * jsonArray = nil;
    if ([WiSeNetworkUtil isArrayValid:arrAddTagDetails]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrAddTagDetails.count; i++) {
            WiSeCloudTagInfo * details = [arrAddTagDetails objectAtIndex:i];
            if (details) {
                
                NSString * strdeviceUUID = details.deviceUUID?details.deviceUUID:@"";


                NSArray *keys            = [NSArray arrayWithObjects:WISE_DEVICE_UUID, nil];

                NSArray *objects         = [NSArray arrayWithObjects:strdeviceUUID,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary];
                }
            }
        }
    }
    
    return jsonArray;
}

+ (NSDictionary *) createSecureTagApiParameters1 : (WiSeCloudTagRequest *)    request {
    NSDictionary * dict = nil;
    NSArray * arr = [self createSecureTagApiParameters:request];
    
    if (arr) {
        
        dict = [[NSDictionary alloc] initWithObjectsAndKeys:arr,@"needTagPairingDetailsFor", nil];
    }
    
    return dict;
}

#pragma mark --- Delete Secure Tag ---

+ (NSMutableArray *) createDeleteSecureTagApiParameters : (WiSeCloudTagRequest *) request {
    return [self createSecureTagApiParameters:request];
}

@end
