//
//  WiSeInfantServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeInfantServicesRequestParser.h"
#import "WiSeCloudInfantRequest.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudZoneRules.h"

@implementation WiSeInfantServicesRequestParser

# pragma mark --- Add Infant ---

+ (NSMutableArray *) createAddInfantApiParameters : (WiSeCloudInfantRequest *) request {
    
    NSArray * arrInfantDetails = request.infantList;
    arrInfantDetails = [WiSeNetworkUtil replaceNullValues:arrInfantDetails];
    NSMutableArray * arrJson = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrInfantDetails]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrInfantDetails.count; i++) {
            WiSeCloudInfantDetails * infantInfo = [arrInfantDetails objectAtIndex:i];
            if (infantInfo) {
                NSString * strInfantHosId  = infantInfo.infantHosId?infantInfo.infantHosId:@"";
                NSString * strTagId        = [NSString stringWithFormat:@"%d",infantInfo.tagCloudId];
                NSString * strInfantId     = [NSString stringWithFormat:@"%d",infantInfo.infantCloudId];
                NSString * strOrgId        = [NSString stringWithFormat:@"%d",infantInfo.organizationId];
                NSString * strTempId       = [NSString stringWithFormat:@"%d",infantInfo.tempId];

                infantInfo.infantFirstName = infantInfo.infantFirstName?infantInfo.infantFirstName:@"";
                infantInfo.infantLastName  = infantInfo.infantLastName?infantInfo.infantLastName:@"";
                
                infantInfo.layerId = infantInfo.layerId?infantInfo.layerId:@"";
                
                id zoneRules = nil;
                
                if (infantInfo.zoneList) {
                    zoneRules = [self getZonesList:infantInfo.zoneList];
                }else {
                    zoneRules = @"";
                }
                
                NSArray * keys    = [NSArray arrayWithObjects:INFANT_HOS_ID,
                                     TAG_ID,
                                     INFANT_ID,
                                     INFANT_FNAME,
                                     INFANT_LNAME,
                                     ZONE_RULES,
                                     ORG_ID,
                                     TEMP_ID,
                                     LAYER_ID, nil];

                NSArray * objects = [NSArray arrayWithObjects:strInfantHosId,
                                     strTagId,
                                     strInfantId,
                                     infantInfo.infantFirstName,
                                     infantInfo.infantLastName,
                                     zoneRules,
                                     strOrgId,
                                     strTempId,
                                     infantInfo.layerId, nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrJson addObject:jsonDictionary];
                }
            }
        }
    }
    return arrJson;
}

+ (NSMutableArray *) getZonesList : (NSArray *) zoneList {
    
    zoneList = [WiSeNetworkUtil replaceNullValues:zoneList];
    NSMutableArray * arrJson = nil;
    
    if ([WiSeNetworkUtil isArrayValid:zoneList]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i < zoneList.count; i++) {
            WiSeCloudZoneRules * zoneInfo = [zoneList objectAtIndex:i];
            if (zoneInfo) {
                NSString * strZoneId       = [NSString stringWithFormat:@"%d",zoneInfo.zoneCloudId];
                NSString * strZoneType     = [NSString stringWithFormat:@"%d",zoneInfo.zoneType];
                NSString * strZoneSafeTime = [NSString stringWithFormat:@"%d",zoneInfo.zoneSafeTime];
                NSString * strOrgId        = [NSString stringWithFormat:@"%d",zoneInfo.organizationId];

                NSArray * keys             = [NSArray arrayWithObjects:ZONE_ID,ZONE_TYPE,ZONE_SAFE_TIME,ORG_ID,nil];
                NSArray * objects          = [NSArray arrayWithObjects:strZoneId,strZoneType,strZoneSafeTime,strOrgId,nil];
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrJson addObject:jsonDictionary];
                }
            }
        }
    }
    
    return arrJson;
}


# pragma mark --- Edit Infant ---

+ (NSMutableArray *) createEditInfantApiParameters : (WiSeCloudInfantRequest *) request {
    return [self createAddInfantApiParameters:request];
}


# pragma mark --- Delete Infant ---

+ (NSMutableArray *) createDeleteInfantApiParameters : (WiSeCloudInfantRequest *) request {
    return [self createAddInfantApiParameters:request];
}

# pragma mark --- Infant Tag Assocation ---

+ (NSMutableArray *) createInfantTagAssociationApiParameters : (WiSeCloudInfantRequest *) request {
    return [self createAddInfantApiParameters:request];
}

# pragma mark --- Get Infants From Organizations ---

+ (NSMutableArray *) createGetInfantFromOrganizationApiParameters : (WiSeCloudInfantRequest *) request {
    NSArray * arrOrgDetails = request.organizationList;
    arrOrgDetails = [WiSeNetworkUtil replaceNullValues:arrOrgDetails];
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

# pragma mark --- Add Rule ---

+ (NSMutableArray *) createAddRuleApiParameters : (WiSeCloudInfantRequest *) request {
    return [self createAddInfantApiParameters:request];
}

@end
