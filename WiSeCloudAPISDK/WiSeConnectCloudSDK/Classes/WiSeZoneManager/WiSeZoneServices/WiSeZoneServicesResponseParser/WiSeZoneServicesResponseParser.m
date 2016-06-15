//
//  WiSeZoneServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 22/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeZoneServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudZoneAPIResponse.h"
#import "WiSeCloudZoneRules.h"
#import "WiSeCloudApiResponse.h"
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import "WiSeZoneListenerMapping.h"
#import "WiSeZonesInOrganizations.h"

@implementation WiSeZoneServicesResponseParser

#pragma mark --- Common Methods ---

+ (WiSeCloudZoneAPIResponse *) appendBasicDetails : (WiSeCloudZoneAPIResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse {
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

// Parsing Zone details

+ (NSMutableArray *) getZoneDetailsListFromResponseData : (NSArray *) arrOfZone  {
    
    NSMutableArray * arrZoneDetails = nil;
    if (arrOfZone) {
        
        if ([WiSeNetworkUtil isArrayValid:arrOfZone]) {
            arrZoneDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOfZone.count; i++) {
                NSDictionary * dict = [arrOfZone objectAtIndex:i];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    if ([dict objectForKey:ZONE_ID]) {
                        WiSeCloudZoneRules * details = [WiSeCloudZoneRules new];
                        details.zoneCloudId          = [[dict objectForKey:ZONE_ID] intValue];
                        details.zoneName             = [dict objectForKey:ZONE_NAME];
                        details.zoneType             = [[dict objectForKey:ZONE_TYPE] intValue];
                        details.message              = [dict objectForKey:MESSAGE];
                        details.status               = [[dict objectForKey:_STATUS] intValue];
                        details.listenerCloudId      = [[dict objectForKey:LISTENER_ID] intValue];
                        details.organizationId       = [[dict objectForKey:ORG_ID] intValue];
                        details.timestamp            = [[dict objectForKey:TIMESTAMP] doubleValue];
                        details.zoneAction           = [[dict objectForKey:ACTION] intValue];
                        details.mapStatus            = [[dict objectForKey:MAP_STATUS] intValue];
                        details.mapMessage           = [dict objectForKey:MAP_MESSAGE];
                        details.tempId               = [[dict objectForKey:TEMP_ID] intValue];
                        
                        if ([WiSeNetworkUtil isArrayValid:[dict objectForKey:LISTENER_MAP]]) { // While Making the mapping
                            details.zoneListenerMappingList = [self getMappings:[dict objectForKey:LISTENER_MAP]];
                        }
                        
                        [arrZoneDetails addObject:details];
                    }
                }
            }
        }
    }
    return arrZoneDetails;
}

+ (NSArray *) getMappings : (NSArray *) mappingArray {
    NSMutableArray * arrMappingList = nil;
    if (mappingArray) {
        if ([WiSeNetworkUtil isArrayValid:mappingArray]) {
            arrMappingList = [[NSMutableArray alloc] init];
            for (int i = 0; i < mappingArray.count; i++) {
                NSDictionary * dict = [mappingArray objectAtIndex:i];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    WiSeZoneListenerMapping * mapping = [WiSeZoneListenerMapping new];
                    mapping.listenerCloudId           = [[dict objectForKey:LISTENER_ID] intValue];
                    mapping.mappingAction             = [[dict objectForKey:ACTION] intValue];
                    mapping.status                    = [[dict objectForKey:_STATUS] intValue];
                    mapping.message                   = [dict objectForKey:MESSAGE];
                    [arrMappingList addObject:mapping];
                }

            }
        }
    }
    return arrMappingList;
}

# pragma mark --- Add Zone ---

+ (WiSeCloudZoneAPIResponse *) parseAddZoneAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudZoneAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudZoneAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];

            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.zoneList                     = [self getZoneDetailsListFromResponseData:[dictResponse objectForKey:DATA]];
        }
    }
    return response;
}

# pragma mark --- Edit Zone ---

+ (WiSeCloudZoneAPIResponse *) parseEditZoneAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return [self parseAddZoneAPIResponse:responseInfo];
}

# pragma mark --- Delete Zone ---

+ (WiSeCloudZoneAPIResponse *) parseDeleteZoneAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    return [self parseAddZoneAPIResponse:responseInfo];
}

# pragma mark --- Get Zone ---

+ (WiSeCloudZoneAPIResponse *) parseGetZoneAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudZoneAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudZoneAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];

            if ([WiSeNetworkUtil isArrayValid:[dictResponse objectForKey:DATA]]) {
                response.zoneList       = [self getZoneDetailsListFromResponseData:[dictResponse objectForKey:DATA]];
            }
            
            NSDictionary * dict = [dictResponse objectForKey:DATA];
            dict                = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:ZONE_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:ZONE_COUNT] intValue];
                    
                    if (totalCount > 0) {
                        response.zoneList       = [self getZoneDetailsListFromResponseData:[[dictResponse objectForKey:DATA] objectForKey:ZONE_DETAILS]];
                        int zoneCount           = (int)response.zoneList.count;
                        response.remainingZones = totalCount - zoneCount;
                    }
                }
                
            }
        }
    }
    return response;
}

# pragma mark --- Get Zones From Organization ---

+ (WiSeCloudZoneAPIResponse *) parseGetZonesFromOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudZoneAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudZoneAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];

            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.zonesListFromOrganizations   = [self getZonesOfOrganizationListFromResponseData:[dictResponse objectForKey:DATA]];
        }
    }
    return response;
}

// Parsing Zone details

+ (NSMutableArray *) getZonesOfOrganizationListFromResponseData : (NSArray *) arrOfZone  {
    
    NSMutableArray * arrZoneDetails = nil;
    arrOfZone = [WiSeNetworkUtil replaceNullValues:arrOfZone];
    if (arrOfZone) {
        
        if ([WiSeNetworkUtil isArrayValid:arrOfZone]) {
            arrZoneDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOfZone.count; i++) {
                NSDictionary * dict = [arrOfZone objectAtIndex:i];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                    WiSeZonesInOrganizations * zones = [WiSeZonesInOrganizations new];
                    id value = [dict objectForKey:ZONE_COUNT];
                    
                    if([value respondsToSelector:@selector(integerValue)]) {
                        int totalCount = [[dict objectForKey:ZONE_COUNT] intValue];
                        
                        zones.organizationId = [[dict objectForKey:ORG_ID] intValue];
                        if (totalCount > 0) {
                            zones.zoneList       = [self getZoneDetailsListFromResponseData:[dict objectForKey:ZONE_DETAILS]];
                            int zoneCount        = (int)zones.zoneList.count;
                            zones.remainingZones = totalCount - zoneCount;
                        }
                        [arrZoneDetails addObject:zones];
                    }
                }
            }
        }
    }
    return arrZoneDetails;
}


# pragma mark --- Mapp Zone & Listener  ---

+ (WiSeCloudZoneAPIResponse *) parseMapZoneListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudZoneAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudZoneAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.zoneList                     = [self getZoneDetailsListFromResponseData:[dictResponse objectForKey:DATA]];
        }
    }
    return response;
}

@end
