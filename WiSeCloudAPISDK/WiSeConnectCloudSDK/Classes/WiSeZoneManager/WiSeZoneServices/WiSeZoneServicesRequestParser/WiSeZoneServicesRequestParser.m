//
//  WiSeZoneServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 22/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeZoneServicesRequestParser.h"
#import "WiSeCloudZoneAPIRequest.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudZoneRules.h"
#import "WiSeZoneListenerMapping.h"

@implementation WiSeZoneServicesRequestParser

# pragma mark --- Add Zone ---

+ (NSMutableArray *) createAddZoneApiParameters : (WiSeCloudZoneAPIRequest *) request {
    NSArray * arrZoneDetails = request.zoneList;
    arrZoneDetails = [WiSeNetworkUtil replaceNullValues:arrZoneDetails];
    NSMutableArray * arrJson = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrZoneDetails]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrZoneDetails.count; i++) {
            WiSeCloudZoneRules * zoneInfo = [arrZoneDetails objectAtIndex:i];
            if (zoneInfo) {
                NSString * strZoneType = [NSString stringWithFormat:@"%d",zoneInfo.zoneType];
                NSString * strOrgId    = [NSString stringWithFormat:@"%d",zoneInfo.organizationId];
                NSString * strZoneId   = [NSString stringWithFormat:@"%d",zoneInfo.zoneCloudId];
                NSString * strTempId   = [NSString stringWithFormat:@"%d",zoneInfo.tempId];
                
                NSString * strArrayLayerId = [zoneInfo.listOfLayerIds componentsJoinedByString:@","];

                zoneInfo.zoneName      = zoneInfo.zoneName?zoneInfo.zoneName:@"";

                NSArray * keys         = [NSArray arrayWithObjects:ZONE_TYPE,
                                          ZONE_NAME,
                                          ORG_ID,
                                          ZONE_ID,
                                          TEMP_ID,
                                          LAYER_ID, nil];
                
                NSArray * objects      = [NSArray arrayWithObjects:strZoneType,
                                          zoneInfo.zoneName,
                                          strOrgId,
                                          strZoneId,
                                          strTempId,
                                          strArrayLayerId, nil];
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrJson addObject:jsonDictionary];
                }
            }
        }
    }
    return arrJson;
}

# pragma mark --- Edit Zone ---

+ (NSMutableArray *) createEditZoneApiParameters : (WiSeCloudZoneAPIRequest *) request {
    return [self createAddZoneApiParameters:request];
}


# pragma mark --- Delete Zone ---

+ (NSMutableArray *) createDeleteZoneApiParameters : (WiSeCloudZoneAPIRequest *) request {
    return [self createAddZoneApiParameters:request];
}

# pragma mark --- Get Zones For Organization ---

+ (NSMutableArray *) createGetZonesFromOrganizationApiParameters : (WiSeCloudZoneAPIRequest *) request {
    NSArray * arrOrgDetails  = request.organizationList;
    arrOrgDetails            = [WiSeNetworkUtil replaceNullValues:arrOrgDetails];
    NSMutableArray * arrJson = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrOrgDetails]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrOrgDetails.count; i++) {
    
            NSString * strOrgId    = [NSString stringWithFormat:@"%d",[[arrOrgDetails objectAtIndex:i] intValue]];

            NSArray * keys         = [NSArray arrayWithObjects:ORG_ID, nil];
            
            NSArray * objects      = [NSArray arrayWithObjects:strOrgId, nil];
            
            if (keys.count == objects.count) {
                NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                [arrJson addObject:jsonDictionary];
            }
            
        }
    }
    return arrJson;
}

# pragma mark --- Map Zone and Listener ---

+ (NSMutableArray *) createMapZoneAndListenerApiParameters : (WiSeCloudZoneAPIRequest *) request {
    NSArray * arrZoneDetails = request.zoneList;
    arrZoneDetails = [WiSeNetworkUtil replaceNullValues:arrZoneDetails];
    NSMutableArray * arrJson = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrZoneDetails]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrZoneDetails.count; i++) {
            WiSeCloudZoneRules * zoneInfo = [arrZoneDetails objectAtIndex:i];
            if (zoneInfo) {
                NSString * strZoneId   = [NSString stringWithFormat:@"%d",zoneInfo.zoneCloudId];
                NSString * strOrgId    = [NSString stringWithFormat:@"%d",zoneInfo.organizationId];
                
                id listenerMap;
                if (zoneInfo.zoneListenerMappingList && zoneInfo.zoneListenerMappingList.count) {
                    listenerMap = [self getZoneListenerMappings:zoneInfo.zoneListenerMappingList];
                }else {
                    listenerMap = @"";
                }
                
                NSArray * keys         = [NSArray arrayWithObjects:
                                          ZONE_ID,
                                          ORG_ID,
                                          LISTENER_MAP, nil];
                
                NSArray * objects      = [NSArray arrayWithObjects:strZoneId,
                                          strOrgId,
                                          listenerMap,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrJson addObject:jsonDictionary];
                }
            }
        }
    }
    return arrJson;
}

+ (NSArray *) getZoneListenerMappings : (NSArray *) mappingArray{
    NSMutableArray * arrJson = nil;
    mappingArray = [WiSeNetworkUtil replaceNullValues:mappingArray];
    if ([WiSeNetworkUtil isArrayValid:mappingArray]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i < mappingArray.count; i++) {
            WiSeZoneListenerMapping * mappingInfo = [mappingArray objectAtIndex:i];
            
            if (mappingInfo) {
                
                NSString * strListenerCloudId = [NSString stringWithFormat:@"%d",mappingInfo.listenerCloudId];
                NSString * strMappingAction   = [NSString stringWithFormat:@"%d",mappingInfo.mappingAction];

                NSArray * keys                = [NSArray arrayWithObjects:
                                                 LISTENER_ID,
                                                 ACTION, nil];

                NSArray * objects             = [NSArray arrayWithObjects:strListenerCloudId,
                                                 strMappingAction,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrJson addObject:jsonDictionary];
                }

            }
        }

    }
    return arrJson;
}

@end
