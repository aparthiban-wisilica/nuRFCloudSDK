//
//  WiSeSensorServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 03/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSensorServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudSensorAPIResponse.h"
#import "WiSeCloudSensorItems.h"

#import "WiSeCloudSensorAPIResponse.h"
#import "WiSeSensorTriggerIntervalSetAPIResponse.h"
#import "WiSeSensorTriggerLogAPIResponse.h"
#import "WiSeMakeMultiSensorAPIResponse.h"

#import "WiSeSensorLinkIdList.h"

@implementation WiSeSensorServicesResponseParser

+ (WiSeCloudSensorAPIResponse *) appendBasicDetails : (WiSeCloudSensorAPIResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse {
    
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

#pragma mark --- Get Sensor Association ---

+ (WiSeCloudSensorAPIResponse *) parseGetSensorAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    WiSeCloudSensorAPIResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeCloudSensorAPIResponse new];
            WiSeCloudApiResponse * statusResponse       = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                         = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            NSDictionary * dict = [dictResponse objectForKey:DATA];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:SENSOR_ASSOCIATION_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:SENSOR_ASSOCIATION_COUNT]intValue];
                    
                    if (totalCount > 0) {
                        response.wiseSensorItemsList                      = [self getAssociationDetailsForGetWithDataArray:[[dictResponse objectForKey:DATA] objectForKey:SENSOR_ASSOCIATION_DETAILS]];
                        int arrCount                              = (int)response.wiseSensorItemsList.count;
                        response.remainingSensorDeviceAssociation = totalCount - arrCount ;
                    }
                }
            }
        }
    }
    return response;
}

+ (NSMutableArray *) getAssociationDetailsForGetWithDataArray : (NSArray *) dataArray {
    
    NSMutableArray * arrAssociationDetails = [[NSMutableArray alloc] init];
    dataArray                              = [WiSeNetworkUtil replaceNullValues:dataArray];
    
    if (dataArray && ([dataArray isKindOfClass:[NSArray class]])) {
        if (dataArray && dataArray.count) {
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary * dict = [dataArray objectAtIndex:i];
                dict = [WiSeNetworkUtil replaceNullValues:dict];
                
                if (dict && [dict isKindOfClass:[NSDictionary class]]) {
                    
                    if ([dict objectForKey:SENSOR_ID]) {
                        WiSeCloudSensorItems * details = [WiSeCloudSensorItems new];
                        
                        details.sensorCloudId     = [[dict objectForKey:SENSOR_ID] intValue];
                        details.associationAction = AddSensor;
                        details.timeStamp         = [[dict objectForKey:TIMESTAMP] doubleValue];
                        details.channel           = [[dict objectForKey:CHANNAL] intValue];
                        
                        // Check group or device
                        if ([[dict objectForKey:GRP_DVC] intValue] == WiseItem) {
                            details.itemType            = WiseItem;
                            details.device_GroupCloudId = [[dict objectForKey:GROUP_ID] intValue];
                        }else if ([[dict objectForKey:GRP_DVC] intValue] == WiseSubItem) {
                            details.itemType            = WiseSubItem;
                            details.device_GroupCloudId = [[dict objectForKey:DEVICEID] intValue];
                        }
                        
                        [arrAssociationDetails addObject:details];

                    }

                }
                
            }
        }
        
    }
    
    return arrAssociationDetails;
}


#pragma mark --- Sensor Association ---

+ (WiSeCloudSensorAPIResponse *) parseSensorAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudSensorAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeCloudSensorAPIResponse new];
            WiSeCloudApiResponse * statusResponse       = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                         = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.wiseSensorItemsList         = [self getAssociationDetailsWithDataArray:[dictResponse objectForKey:DATA]];
            
        }
    }
    return response;
}

+ (NSMutableArray *) getAssociationDetailsWithDataArray : (NSArray *) dataArray {
    
    NSMutableArray * arrAssociationDetails = [[NSMutableArray alloc] init];
    dataArray                              = [WiSeNetworkUtil replaceNullValues:dataArray];
    
    if (dataArray && ([dataArray isKindOfClass:[NSArray class]])) {
        if (dataArray && dataArray.count) {
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary * dict = [dataArray objectAtIndex:i];
                dict = [WiSeNetworkUtil replaceNullValues:dict];
                
                if (dict && [dict isKindOfClass:[NSDictionary class]]) {

                    if ([dict objectForKey:SENSOR_ID] || [dict objectForKey:SENSOR_MESH_ID]) {
                        WiSeCloudSensorItems * details = [WiSeCloudSensorItems new];
                        details.device_GroupCloudId    = [[dict objectForKey:GRPDVCID] intValue];
                        details.sensorCloudId          = [[dict objectForKey:SENSOR_ID] intValue];
                        details.message                = [dict objectForKey:MESSAGE];
                        details.status                 = [[dict objectForKey:_STATUS] intValue];
                        details.sequenceNumber = [[dict objectForKey:SEQUENCENUMBER]intValue];
                        details.timeStamp              = [[dict objectForKey:TIMESTAMP]doubleValue];
                        details.channel                = [[dict objectForKey:CHANNAL] intValue];
                        
                        // Check add or remove action
                        if ([[dict objectForKey:ACTION] intValue] == AddSensor) {
                            details.associationAction = AddSensor;
                        }else if ([[dict objectForKey:ACTION] intValue] == RemoveSensor) {
                            details.associationAction = RemoveSensor;
                        }
                        if (details.itemType == WiseItem) { // Link Id Status
                            details.sensorLinkIds = [self getSensorLinkedInStatusFromDataArray:[dict objectForKey:SENSOR_LINKID_STATUS]];
                        }
                        
                        details.sensorMeshId = [[dict objectForKey:SENSOR_MESH_ID] intValue];
                        details.triggerData  = [WiSeNetworkUtil convertBase64StringToDataWithString:[dict objectForKey:TRIGGER]];
                        
                        if (!details.sensorMeshId) {
                            // Check group or device
                            if ([[dict objectForKey:GRP_DVC] intValue] == WiseItem) {
                                details.itemType     = WiseItem;
                            }else if ([[dict objectForKey:GRP_DVC] intValue] == WiseSubItem) {
                                details.itemType     = WiseSubItem;
                            }
                        }else {
                            details.itemType     = -1;
                        }
                        
                        [arrAssociationDetails addObject:details];

                    }
                    
                }
                
            }
        }
        
    }
    
    return arrAssociationDetails;
}

+ (NSMutableArray * ) getSensorLinkedInStatusFromDataArray : (NSArray *) dataArray {
    
    dataArray                                  = [WiSeNetworkUtil replaceNullValues:dataArray];
    NSMutableArray * sensorLinkedInStatusArray = nil;
    
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        sensorLinkedInStatusArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < dataArray.count; i++) {
            
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                WiSeSensorLinkIdList * linkedDetails = [WiSeSensorLinkIdList new];
                linkedDetails.deviceId               = [[dict objectForKey:DEVICEID] intValue];
                linkedDetails.status                 = [[dict objectForKey:_STATUS] boolValue];
                linkedDetails.message                = [dict objectForKey:MESSAGE];
                [sensorLinkedInStatusArray addObject:linkedDetails];
                
            }
            
        }
    }
    return sensorLinkedInStatusArray;
    
}

#pragma mark --- Sensor Trigger Log ---

+ (WiSeCloudSensorAPIResponse *) parseSensorTriggerLogAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudSensorAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeCloudSensorAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.wiseSensorItemsList          = [self getAssociationDetailsWithDataArray:[dictResponse objectForKey:DATA]];
            
            return response;
        }
    }
    return nil;
}

#pragma mark --- Sensor Trigger Intervel Set ---

+ (WiSeSensorTriggerIntervalSetAPIResponse *) parseSensorTriggerIntervelSetAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeSensorTriggerIntervalSetAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeSensorTriggerIntervalSetAPIResponse new];
            WiSeCloudApiResponse * statusResponse       = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                      = statusResponse.statusMessage;
            response.apiId                              = statusResponse.apiId;
            response.startTime                          = statusResponse.startTime;
            response.endTime                            = statusResponse.endTime;
            response.executionTime                      = statusResponse.executionTime;
            response.urlResponseStatusCode              = statusResponse.urlResponseStatusCode;
            response.statusCode                         = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            
        }
    }
    return response;
}

#pragma mark --- Make MultiSensor ---

+ (WiSeMakeMultiSensorAPIResponse *) parseMakeMultiSensorAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeMakeMultiSensorAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeMakeMultiSensorAPIResponse new];
            WiSeCloudApiResponse * statusResponse       = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                      = statusResponse.statusMessage;
            response.apiId                              = statusResponse.apiId;
            response.startTime                          = statusResponse.startTime;
            response.endTime                            = statusResponse.endTime;
            response.executionTime                      = statusResponse.executionTime;
            response.urlResponseStatusCode              = statusResponse.urlResponseStatusCode;
            response.statusCode                         = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
        }
    }
    return response;
}


@end
