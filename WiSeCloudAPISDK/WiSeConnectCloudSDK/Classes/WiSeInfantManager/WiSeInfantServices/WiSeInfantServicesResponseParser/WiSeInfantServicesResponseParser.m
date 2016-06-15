//
//  WiSeInfantServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeInfantServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudInfantResponse.h"
#import "WiSeCloudInfantDetails.h"
#import "WiSeCloudZoneRules.h"
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import "WiSeInfantInOrganization.h"
#import "WiSeCloudInfantPositionInfo.h"


@implementation WiSeInfantServicesResponseParser

#pragma mark --- Common Methods ---

+ (WiSeCloudInfantResponse *) appendBasicDetails : (WiSeCloudInfantResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse {
    
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

// Parsing Infant details

+ (NSMutableArray *) getInfantDetailsListFromResponseData : (NSArray *) arrOfInfants  {
    
    NSMutableArray * arrOrgDetails = nil;
    if (arrOfInfants) {
        NSArray * arrOrg = arrOfInfants;
        
        if ([WiSeNetworkUtil isArrayValid:arrOrg]) {
            arrOrgDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOrg.count; i++) {
                NSDictionary * dict = [arrOrg objectAtIndex:i];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    if ([dict objectForKey:INFANT_ID]) {
                        WiSeCloudInfantDetails * details = [WiSeCloudInfantDetails new];

                        details.infantCloudId            = [[dict objectForKey:INFANT_ID] intValue];
                        details.infantFirstName          = [dict objectForKey:INFANT_FNAME];
                        details.infantLastName           = [dict objectForKey:INFANT_LNAME];
                        details.infantHosId              = [dict objectForKey:INFANT_HOS_ID];
                        details.message                  = [dict objectForKey:MESSAGE];
                        details.status                   = [[dict objectForKey:_STATUS] intValue];
                        details.timestamp                = [[dict objectForKey:TIMESTAMP] doubleValue];
                        details.tagCloudId               = [[dict objectForKey:TAG_ID] intValue];
                        details.tagMeshId                = [[dict objectForKey:TAG_MESH_ID] intValue];
                        details.tagName                  = [dict objectForKey:TAG_NAME];
                        details.organizationId           = [[dict objectForKey:ORG_ID] intValue];
                        details.checkOutStatus           = [[dict objectForKey:CHECK_OUT_STATUS] intValue];
                        details.tempId                   = [[dict objectForKey:TEMP_ID] intValue];
                        details.layerId                  = [dict objectForKey:LAYER_ID];
                        
                        NSArray * arrOfZones = [dict objectForKey:ZONE_RULES];
                        NSMutableArray * arrZoneDetails = nil;
                        arrOfZones = [WiSeNetworkUtil replaceNullValues:arrOfZones];
                        if ([WiSeNetworkUtil isArrayValid:arrOfZones]) {
                            arrZoneDetails = [[NSMutableArray alloc] init];
                            for (int i = 0; i < arrOfZones.count; i++) {
                                NSDictionary * dict1 = [arrOfZones objectAtIndex:i];
                                dict1                = [WiSeNetworkUtil replaceNullValues:dict1];
                                if ([WiSeNetworkUtil isDictionaryValid:dict1]) {
                                    WiSeCloudZoneRules * zoneInfo = [WiSeCloudZoneRules new];
                                    zoneInfo.zoneCloudId          = [[dict1 objectForKey:ZONE_ID] intValue];
                                    zoneInfo.status               = [[dict1 objectForKey:_STATUS] intValue];
                                    zoneInfo.message              = [dict1 objectForKey:MESSAGE];
                                    [arrZoneDetails addObject:zoneInfo];
                                }
                            }
                        }
                        
                        details.zoneList = arrZoneDetails;

                        [arrOrgDetails addObject:details];
                    }
                    
                }
            }
        }
        
    }
    return arrOrgDetails;
}

# pragma mark --- Add Infant ---

+ (WiSeCloudInfantResponse *) parseAddInfantAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudInfantResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudInfantResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];

            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.infantList                   = [self getInfantDetailsListFromResponseData:[dictResponse objectForKey:DATA]];
        }
    }
    return response;
}

# pragma mark --- Edit Infant ---

+ (WiSeCloudInfantResponse *) parseEditInfantAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return [self parseAddInfantAPIResponse:responseInfo];
}

# pragma mark --- Delete Infant ---

+ (WiSeCloudInfantResponse *) parseDeleteInfantAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return [self parseAddInfantAPIResponse:responseInfo];
}

# pragma mark --- Get Infant ---

+ (WiSeCloudInfantResponse *) parseGetInfantAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudInfantResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudInfantResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            if ([WiSeNetworkUtil isArrayValid:[dictResponse objectForKey:DATA]]) {
                response.infantList = [self getInfantDetailsListFromResponseData:[dictResponse objectForKey:DATA]];
            }else if ([WiSeNetworkUtil isDictionaryValid:[dictResponse objectForKey:DATA]]) {
                NSDictionary * dict = [dictResponse objectForKey:DATA];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    id value = [[dictResponse objectForKey:DATA] objectForKey:INFANT_COUNT];
                    
                    if([value respondsToSelector:@selector(integerValue)]) {
                        int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:INFANT_COUNT] intValue];
                        
                        if (totalCount > 0) {
                            response.infantList       = [self getInfantDetailsListFromResponseData:[[dictResponse objectForKey:DATA] objectForKey:INFANT_DETAILS]];
                            int orgCount              = (int)response.infantList.count;
                            response.remainingInfants = totalCount - orgCount;
                        }
                    }
                    
                }

            }

        }
    }
    return response;
}

# pragma mark --- Get Archived Infant ---

+ (WiSeCloudInfantResponse *) parseGetArchivedInfantAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudInfantResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudInfantResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            if ([WiSeNetworkUtil isArrayValid:[dictResponse objectForKey:DATA]]) {
                response.infantList = [self getInfantDetailsListFromResponseData:[dictResponse objectForKey:DATA]];
            }else if ([WiSeNetworkUtil isDictionaryValid:[dictResponse objectForKey:DATA]]) {
                NSDictionary * dict = [dictResponse objectForKey:DATA];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    id value = [[dictResponse objectForKey:DATA] objectForKey:INFANT_ARCHIVED_COUNT];
                    
                    if([value respondsToSelector:@selector(integerValue)]) {
                        int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:INFANT_ARCHIVED_COUNT] intValue];
                        
                        if (totalCount > 0) {
                            response.infantList       = [self getInfantDetailsListFromResponseData:[[dictResponse objectForKey:DATA] objectForKey:INFANT_ARCHIVED_DETAILS]];
                            int orgCount              = (int)response.infantList.count;
                            response.remainingInfants = totalCount - orgCount;
                        }
                    }
                    
                }
                
            }
            
        }
    }
    return response;
}

# pragma mark --- Get Infant Tag Association---

+ (WiSeCloudInfantResponse *) parseInfantTagAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return [self parseAddInfantAPIResponse:responseInfo];
}

# pragma mark --- Get Infants From Organizations ---

+ (WiSeCloudInfantResponse *) parseGetInfantsFromOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudInfantResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudInfantResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];

            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.infantsListFromOrganizations = [self getInfantsFromOrganizationFromResponseData:[dictResponse objectForKey:DATA]];
        }
    }
    return response;
}

+ (NSMutableArray *) getInfantsFromOrganizationFromResponseData : (NSArray *) arrOfInfants  {
    
    NSMutableArray * arrInfantsDetails = nil;
    arrOfInfants = [WiSeNetworkUtil replaceNullValues:arrOfInfants];
    if (arrOfInfants) {
        
        if ([WiSeNetworkUtil isArrayValid:arrOfInfants]) {
            arrInfantsDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOfInfants.count; i++) {
                NSDictionary * dict = [arrOfInfants objectAtIndex:i];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    WiSeInfantInOrganization * infant = [WiSeInfantInOrganization new];
                    id value = [dict objectForKey:INFANT_COUNT];
                    
                    if([value respondsToSelector:@selector(integerValue)]) {
                        int totalCount = [[dict objectForKey:INFANT_COUNT] intValue];
                        
                        infant.organizationId     = [[dict objectForKey:ORG_ID] intValue];
                        if (totalCount > 0) {
                            infant.infantsList        = [self getInfantDetailsListFromResponseData:[dict objectForKey:INFANT_DETAILS]];
                            int count                 = (int)infant.infantsList.count;
                            infant.remainingListeners = totalCount - count;
                        }
                        
                        [arrInfantsDetails addObject:infant];
                    }
                }
            }
        }
    }
    return arrInfantsDetails;
}

# pragma mark --- Get Infants Position ---

+ (WiSeCloudInfantResponse *) parseGetInfantPositionAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudInfantResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudInfantResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            if ([WiSeNetworkUtil isDictionaryValid:[dictResponse objectForKey:DATA]]) {
                WiSeCloudInfantPositionInfo * positionInfo = [WiSeCloudInfantPositionInfo new];
                positionInfo.timestamp                     = [[[dictResponse objectForKey:DATA] objectForKey:TIMESTAMP] doubleValue];
                positionInfo.latitude                      = [[[dictResponse objectForKey:DATA] objectForKey:LATITUDE] doubleValue];
                positionInfo.longtitude                    = [[[dictResponse objectForKey:DATA] objectForKey:LONGTITUDE] doubleValue];
                positionInfo.tagId                         = [[[dictResponse objectForKey:DATA] objectForKey:TAG_ID] intValue];
                positionInfo.rssiValue                     = [[[dictResponse objectForKey:DATA] objectForKey:RSSI] intValue];
                positionInfo.listenerCloudId               = [[[dictResponse objectForKey:DATA] objectForKey:LISTENER_ID] intValue];
                positionInfo.confidenceLevel               = [[[dictResponse objectForKey:DATA] objectForKey:CONFIDENT_LEVEL] intValue];
                positionInfo.status                        = [[[dictResponse objectForKey:DATA] objectForKey:_STATUS] intValue];
                positionInfo.message                       = [[dictResponse objectForKey:DATA] objectForKey:MESSAGE];
                
                response.infantPositionInfo                = positionInfo;
            }
        }
    }
    return response;
}


@end
