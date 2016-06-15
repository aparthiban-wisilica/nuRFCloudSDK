//
//  WiSeDeviceServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 29/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeDeviceServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudApiResponse.h"
#import "WiSeCloudDeviceAPIResponse.h"
#import "WiSeCloudDeviceDetails.h"
#import "WiSeGetADeviceAPIResponse.h"
#import "WiSeDeviceGroupAssociationDetails.h"
#import "WiSeCloudListenerAPIResponse.h"
#import "WiSeZoneServicesResponseParser.h"
#import "WiSeListenersInOrganization.h"
#import "WiSeCloudListenerInfo.h"

@implementation WiSeDeviceServicesResponseParser

+ (WiSeCloudDeviceAPIResponse *) appendBasicDetails : (WiSeCloudDeviceAPIResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse {
    
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

#pragma mark --- Add Device ---

+ (WiSeCloudDeviceAPIResponse *) parseAddDeviceAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudDeviceAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudDeviceAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];

            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.deviceList                   = [self getDeviceDetailsListFromResponseData:dictResponse];
            
        }
    }
    return response;
}

// Parsing added device details

+ (NSMutableArray *) getDeviceDetailsListFromResponseData : (NSDictionary *) dictResponse  {
    
    NSMutableArray * arrDeviceDetails = nil;
    if (dictResponse) {
        NSArray * arrOfDevices = [dictResponse objectForKey:DATA];
        
        if ([WiSeNetworkUtil isArrayValid:arrOfDevices]) {
            arrDeviceDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOfDevices.count; i++) {
                NSDictionary * dict = [arrOfDevices objectAtIndex:i];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    if ([dict objectForKey:DEVICEID] || [dict objectForKey:WISE_DEVICE_UUID] || [dict objectForKey:DEVICE_MESH_ID]) {
                        WiSeCloudDeviceDetails * details   = [WiSeCloudDeviceDetails new];
                        details.deviceCloudId              = [[dict objectForKey:DEVICEID] intValue];
                        details.deviceName                 = [dict objectForKey:WISE_DEVICE_NAME];
                        details.deviceUUID                 = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:WISE_DEVICE_UUID]];
                        details.groupCloudId               = [[dict objectForKey:GROUP_ID] intValue];
                        details.devicePairString           = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:WISE_DEVICE_PAIR_INFO]];
                        details.deviceMeshId               = [[dict objectForKey:DEVICE_MESH_ID] intValue];
                        details.dataStatus                 = [[dict objectForKey:_STATUS] intValue];
                        details.message                    = [dict objectForKey:MESSAGE];
                        details.associationMessage         = [dict objectForKey:ASSOCIATION_MESSAGE];
                        details.deviceType                 = [[dict objectForKey:WISE_DEVICE_TYPE] intValue];
                        details.deviceSecurityKey          = [dict objectForKey:DEVICE_SECURITY_KEY];
                        details.devicePairingKey           = [dict objectForKey:DEVICE_PAIRTING_KEY];
                        details.tempId                     = [[dict objectForKey:TEMP_ID] intValue];
                        
                        details.deviceGroupAssociationList = [self getDeviceGroupAssocicationList:[dict objectForKey:GROUP_ASSOCIATION]];
                        
                        [arrDeviceDetails addObject:details];
                    }
                    
                    
                }
            }
        }
        
    }
    
    return arrDeviceDetails;
}


#pragma mark --- Edit Device ---

+ (WiSeCloudDeviceAPIResponse *) parseEditDeviceAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudDeviceAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudDeviceAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.deviceList                   = [self getDeviceDetailsListFromResponseData:dictResponse];
            
        }
    }
    return response;
}

#pragma mark --- Delete Device ---

+ (WiSeCloudDeviceAPIResponse *) parseDeleteDeviceAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudDeviceAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudDeviceAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.deviceList                   = [self getDeviceDetailsListFromResponseData:dictResponse];
            return response;
        }
    }
    return nil;
}

#pragma mark --- Get A Device ---

+ (WiSeGetADeviceAPIResponse *) parseGetADeviceAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return nil;
}

#pragma mark --- Get All Device ---

+ (WiSeCloudDeviceAPIResponse *) parseGetAllDeviceAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudDeviceAPIResponse * response  = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudDeviceAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];

            NSDictionary * dict                   = [dictResponse objectForKey:DATA];
            dict                                  = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:DEVICE_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:DEVICE_COUNT] intValue];
                    
                    if (totalCount > 0) {
                        response.deviceList                   = [self getDeviceDetails:dictResponse];
                        int deviceCount                       = (int)response.deviceList.count;
                        response.remainingDevices             = totalCount - deviceCount;
                    }
                }

            }
            
            
        }
    }
    return response;

}

+ (NSMutableArray *) getDeviceDetails : (NSDictionary *) dataDict {
    
    NSMutableArray * arrDeviceDetails =nil;
    if (dataDict) {
        
        NSArray * arrOfDevices = [[dataDict objectForKey:DATA] objectForKey:DEVICE_DETAILS];

        arrOfDevices = [WiSeNetworkUtil replaceNullValues:arrOfDevices];
        if ([WiSeNetworkUtil isArrayValid:arrOfDevices]) {
            arrDeviceDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOfDevices.count; i++) {
                NSDictionary * dict = [arrOfDevices objectAtIndex:i];
                dict = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    WiSeCloudDeviceDetails * wiSeDashBoardSubItems = nil;
                    
                    if ([dict objectForKey:WISE_DEVICE_UUID]) {
                        wiSeDashBoardSubItems                            = [WiSeCloudDeviceDetails new];

                        wiSeDashBoardSubItems.deviceName                 = [dict objectForKey:WISE_DEVICE_NAME];
                        wiSeDashBoardSubItems.deviceUUID                 = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:WISE_DEVICE_UUID]];
                        wiSeDashBoardSubItems.deviceType                 = [[dict objectForKey:WISE_DEVICE_TYPE] intValue];
                        wiSeDashBoardSubItems.intensityValue             = [[dict objectForKey:INTENSITY] intValue];
                        wiSeDashBoardSubItems.warmCoolValue              = [[dict objectForKey:COOL] intValue];
                        wiSeDashBoardSubItems.devicePairString           = [dict objectForKey:WISE_DEVICE_PAIR_INFO];
                        wiSeDashBoardSubItems.hardwareVersion            = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:HARDWARD_VERSION]];
                        wiSeDashBoardSubItems.softwareVersion            = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:SOFTWARE_VERSION]];
                        wiSeDashBoardSubItems.firmwareVersion            = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:FIRMWARE_VERSION]];
                        wiSeDashBoardSubItems.deviceCloudId              = [[dict objectForKey:DEVICEID] intValue];
                        wiSeDashBoardSubItems.isFeedbackEnabled          = [[dict objectForKey:FEEDBACK] boolValue];
                        wiSeDashBoardSubItems.isConnectable              = [[dict objectForKey:IS_CONNECTABLE] boolValue];
                        wiSeDashBoardSubItems.deviceStatus               = [[dict objectForKey:DEVICE_STATUS] intValue];
                        wiSeDashBoardSubItems.nextStatus                 = [[dict objectForKey:NEXT_STATUS] intValue];
                        wiSeDashBoardSubItems.batteryLevel               = [[dict objectForKey:BATTARY_LEVEL] intValue];
                        wiSeDashBoardSubItems.deviceSequenceNumber       = [[dict objectForKey:WISE_DEVICE_SEQUENCE_NUMBER] intValue];
                        wiSeDashBoardSubItems.timeStamp                  = [[dict objectForKey:TIMESTAMP] doubleValue];
                        wiSeDashBoardSubItems.triggerTimer               = [[dict objectForKey:TIMER] intValue];
                        wiSeDashBoardSubItems.tempId                     = [[dict objectForKey:TEMP_ID] intValue];

                        wiSeDashBoardSubItems.deviceGroupAssociationList = [self getDeviceGroupAssocicationList:[dict objectForKey:GROUP_ASSOCIATION]];
                        
//                        int strSensorType                          = [[dict objectForKey:MULTY_SENSORE_FLAG] intValue];
//                        
//                        switch (strSensorType) {
//                            case PIR:
//                                wiSeDashBoardSubItems.sensorType = PIR;
//                                break;
//                            case LDR:
//                                wiSeDashBoardSubItems.sensorType = LDR;
//                                break;
//                            case NoType:
//                                wiSeDashBoardSubItems.sensorType = NoType;
//                                break;
//                            default:
//                                break;
//                        }
                        
                        NSString * tmp = [dict objectForKey:RGB];
                        tmp = tmp?tmp:@"";
                        NSArray * atmpArryRGB = [tmp componentsSeparatedByString:@","];
                        if (atmpArryRGB && (atmpArryRGB.count == 3)) {
                            atmpArryRGB = [WiSeNetworkUtil replaceNullValues:atmpArryRGB];
                            if (atmpArryRGB && [atmpArryRGB isKindOfClass:[NSArray class]] ) {
                                wiSeDashBoardSubItems.rgbRValue = [[atmpArryRGB objectAtIndex:0] intValue];
                                wiSeDashBoardSubItems.rgbGValue = [[atmpArryRGB objectAtIndex:1] intValue];
                                wiSeDashBoardSubItems.rgbBValue = [[atmpArryRGB objectAtIndex:2] intValue];
                            }
                        }
                        
                        wiSeDashBoardSubItems.deviceMeshId = [[dict objectForKey:DEVICE_MESH_ID]intValue];
                        
                        wiSeDashBoardSubItems.groupCloudId = [[dict objectForKey:GROUP_ID] intValue];
                        [arrDeviceDetails addObject:wiSeDashBoardSubItems];
                        
                    }
                    
                }
            }
        }
        
        
    }
    return arrDeviceDetails;
    
}

+ (NSArray *) getDeviceGroupAssocicationList : (NSArray *) list {
    NSMutableArray * arrList = nil;
    list                     = [WiSeNetworkUtil replaceNullValues:list];
    if ([WiSeNetworkUtil isArrayValid:list]) {
        arrList = [[NSMutableArray alloc] init];
        for (int i = 0; i < list.count; i++) {
            NSDictionary * dict = [list objectAtIndex:i];
            dict                = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                WiSeDeviceGroupAssociationDetails * details = [WiSeDeviceGroupAssociationDetails new];
                details.oldGroupCloudId                     = [[dict objectForKey:OLD_GROUP_ID] intValue];
                details.freshGroupCloudId                   = [[dict objectForKey:FRESH_GROUP_ID] intValue];
                [arrList addObject:details];
            }
        }
    }
    return arrList;
}

#pragma mark --- Device Group Association ---

+ (WiSeCloudDeviceAPIResponse *) parseDeviceGroupAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudDeviceAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudDeviceAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.deviceList                   = [self getDeviceDetailsListFromResponseData:dictResponse];
            
        }
    }
    return response;
}

#pragma mark --- Get Device Group Association ---

+ (WiSeCloudDeviceAPIResponse *) parseGetDeviceGroupAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudDeviceAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudDeviceAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            if ([WiSeNetworkUtil isDictionaryValid:[dictResponse objectForKey:DATA]]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:DEVICE_GROUP_ASSOCIATION_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:DEVICE_GROUP_ASSOCIATION_COUNT] intValue];
                    
                    if (totalCount > 0) {
                        response.deviceList                   = [self getDeviceGroupAssocationListFromResponseData:[dictResponse objectForKey:DATA]];
                        int deviceCount                       = (int)response.deviceList.count;
                        response.remainingDevices             = totalCount - deviceCount;
                    }
                }
                
            }

            
        }
    }
    return response;
}

+ (NSMutableArray *) getDeviceGroupAssocationListFromResponseData : (NSDictionary *) dictResponse  {
    
    NSMutableArray * arrDeviceDetails = nil;
    if (dictResponse) {
        NSArray * arrOfDevices = [dictResponse objectForKey:DEVICE_GROUP_ASSOCIATION_DETAILS];
        
        if ([WiSeNetworkUtil isArrayValid:arrOfDevices]) {
            arrDeviceDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOfDevices.count; i++) {
                NSDictionary * dict = [arrOfDevices objectAtIndex:i];
                dict = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    BOOL isDeviceNameThere = NO;
                    for (NSString * str in dict.allKeys) {
                        if ([str isEqualToString:DEVICEID]) {
                            isDeviceNameThere = YES;
                            break;
                        }
                    }
                    
                    if (isDeviceNameThere) {
                        WiSeCloudDeviceDetails * details = [WiSeCloudDeviceDetails new];
                        details.deviceCloudId            = [[dict objectForKey:DEVICEID] intValue];
                        details.groupCloudId             = [[dict objectForKey:GROUP_ID] intValue];
                        details.groupPath                = [dict objectForKey:GROUP_PATH];
                        details.timeStamp                = [[dict objectForKey:TIMESTAMP] doubleValue];
                        details.userId                   = [[dict objectForKey:USER_ID] intValue];

                        [arrDeviceDetails addObject:details];
                    }
                    
                    
                }
            }
        }
        
    }
    
    return arrDeviceDetails;
}

+ (WiSeCloudListenerAPIResponse *) parseGetListenerZoneMappingAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudListenerAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudListenerAPIResponse new];
            
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            NSDictionary * dict = [dictResponse objectForKey:DATA];
            dict                = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:ZONE_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:ZONE_COUNT] intValue];
                    
                    if (totalCount > 0) {
                        response.listenerZoneMappingList            = [WiSeZoneServicesResponseParser getZoneDetailsListFromResponseData:[[dictResponse objectForKey:DATA] objectForKey:MAPPING_DETAILS]];
                        int zoneCount                               = (int)response.listenerZoneMappingList.count;
                        response.remainingListenersZoneMappingCount = totalCount - zoneCount;
                    }
                }
                
            }

            
        }
    }
    return response;
}

#pragma mark --- Get Listeners ---

+ (WiSeCloudListenerAPIResponse *) parseGetListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudListenerAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudListenerAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;

            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];

            NSDictionary * dict                   = [dictResponse objectForKey:DATA];
            dict                                  = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:DEVICE_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:DEVICE_COUNT] intValue];
                    
                    if (totalCount > 0) {
                        response.listenerList       = [self getListenerDetails:[[dictResponse objectForKey:DATA] objectForKey:DEVICE_DETAILS]];
                        int deviceCount             = (int)response.listenerList.count;
                        response.remainingListeners = totalCount - deviceCount;
                    }
                }
                
            }

        }
    }
    return response;
}

+ (NSMutableArray *) getListenerDetails : (NSArray *) dataArray {
    
    NSMutableArray * arrDeviceDetails =nil;
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        arrDeviceDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                if ([dict objectForKey:DEVICEID]||[dict objectForKey:WISE_DEVICE_UUID]) {
                    
                    WiSeCloudListenerInfo * listenerDetails = [WiSeCloudListenerInfo new];
                    listenerDetails.deviceCloudId           = [[dict objectForKey:DEVICEID] intValue];
                    listenerDetails.deviceMeshId            = [[dict objectForKey:DEVICE_MESH_ID] intValue];
                    listenerDetails.deviceName              = [dict objectForKey:WISE_DEVICE_NAME];
                    listenerDetails.groupCloudId            = [[dict objectForKey:GROUP_ID] intValue];
                    listenerDetails.organizationId          = [[dict objectForKey:ORG_ID] intValue];
                    listenerDetails.latitude                = [[dict objectForKey:LATITUDE] doubleValue];
                    listenerDetails.longtitude              = [[dict objectForKey:LONGTITUDE] doubleValue];
                    listenerDetails.miniRSSI                = [[dict objectForKey:MIN_RSSI] intValue];
                    listenerDetails.timestamp               = [[dict objectForKey:TIMESTAMP] doubleValue];
                    listenerDetails.status                  = [[dict objectForKey:_STATUS] intValue];
                    listenerDetails.message                 = [dict objectForKey:MESSAGE];
                    listenerDetails.mapStatus               = [[dict objectForKey:MAP_STATUS] intValue];
                    listenerDetails.mapMessage              = [dict objectForKey:MAP_MESSAGE];
                    listenerDetails.deviceType              = [[dict objectForKey:WISE_DEVICE_TYPE] intValue];
                    listenerDetails.intensityValue          = [[dict objectForKey:INTENSITY] intValue];
                    listenerDetails.warmCoolValue           = [[dict objectForKey:COOL] intValue];
                    listenerDetails.devicePairString        = [dict objectForKey:WISE_DEVICE_PAIR_INFO];
                    listenerDetails.deviceUUID              = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:WISE_DEVICE_UUID]];
                    listenerDetails.hardwareVersion         = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:HARDWARD_VERSION]];
                    listenerDetails.softwareVersion         = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:SOFTWARE_VERSION]];
                    listenerDetails.firmwareVersion         = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:FIRMWARE_VERSION]];
                    listenerDetails.isFeedbackEnabled       = [[dict objectForKey:FEEDBACK] boolValue];
                    listenerDetails.isConnectable           = [[dict objectForKey:IS_CONNECTABLE] boolValue];
                    listenerDetails.deviceStatus            = [[dict objectForKey:DEVICE_STATUS] intValue];
                    listenerDetails.nextStatus              = [[dict objectForKey:NEXT_STATUS] intValue];
                    listenerDetails.deviceSequenceNumber    = [[dict objectForKey:WISE_DEVICE_SEQUENCE_NUMBER] intValue];
                    listenerDetails.triggerTimer            = [[dict objectForKey:TIMER] intValue];
                    listenerDetails.ownerShipChangeStatus   = [[dict objectForKey:OWNER_SHIP_CHANGE_STATUS] intValue];
                    listenerDetails.deviceSecurityKey       = [dict objectForKey:DEVICE_SECURITY_KEY];
                    listenerDetails.devicePairingKey        = [dict objectForKey:DEVICE_PAIRTING_KEY];
                    listenerDetails.layerId                 = [dict objectForKey:LAYER_ID];
                    listenerDetails.tempId                  = [[dict objectForKey:TEMP_ID] intValue];
                    
//                    if ([WiSeNetworkUtil isDictionaryValid:[dict objectForKey:ZONE_DETAILS]]) {
//                        
//                        id value = [[dict objectForKey:ZONE_DETAILS] objectForKey:ZONE_COUNT];
//                        
//                        if([value respondsToSelector:@selector(integerValue)]) {
//                            int totalCount = [[[dict objectForKey:ZONE_DETAILS] objectForKey:ZONE_COUNT] intValue];
//                            
//                            if (totalCount > 0) {
//                                listenerDetails.zoneList       = [WiSeZoneServicesResponseParser getZoneDetailsListFromResponseData:[[dict objectForKey:ZONE_DETAILS] objectForKey:ZONE_MAPPING]];
//                                int zoneCount                  = (int)listenerDetails.zoneList.count;
//                                listenerDetails.remainingZones = totalCount - zoneCount;
//                            }
//                        }
//                        
//                    }

                    
                    if ([WiSeNetworkUtil isArrayValid:[dict objectForKey:ZONE_MAPPING]]) {
                        listenerDetails.zoneList = [WiSeZoneServicesResponseParser getZoneDetailsListFromResponseData:[dict objectForKey:ZONE_MAPPING]];
                    }

                    NSString * tmp = [dict objectForKey:RGB];
                    tmp = tmp?tmp:@"";
                    NSArray * atmpArryRGB = [tmp componentsSeparatedByString:@","];
                    if (atmpArryRGB && (atmpArryRGB.count == 3)) {
                        atmpArryRGB = [WiSeNetworkUtil replaceNullValues:atmpArryRGB];
                        if (atmpArryRGB && [atmpArryRGB isKindOfClass:[NSArray class]] ) {
                            listenerDetails.rgbRValue = [[atmpArryRGB objectAtIndex:0] intValue];
                            listenerDetails.rgbGValue = [[atmpArryRGB objectAtIndex:1] intValue];
                            listenerDetails.rgbBValue = [[atmpArryRGB objectAtIndex:2] intValue];
                        }
                    }

                    [arrDeviceDetails addObject:listenerDetails];
                }
                
            }
        }
    }
    return arrDeviceDetails;
}

# pragma mark --- Get Listeners From Organizations ---

+ (WiSeCloudListenerAPIResponse *) parseGetListenersFromOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudListenerAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudListenerAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;
            
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.listenersListFromOrganizations   = [self getListenersFromOrganizationFromResponseData:[dictResponse objectForKey:DATA]];
        }
    }
    return response;
}

+ (NSMutableArray *) getListenersFromOrganizationFromResponseData : (NSArray *) arrOfListeners  {
    
    NSMutableArray * arrListenerDetails = nil;
    arrOfListeners = [WiSeNetworkUtil replaceNullValues:arrOfListeners];
    if (arrOfListeners) {
        
        if ([WiSeNetworkUtil isArrayValid:arrOfListeners]) {
            arrListenerDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOfListeners.count; i++) {
                NSDictionary * dict = [arrOfListeners objectAtIndex:i];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    WiSeListenersInOrganization * listeners = [WiSeListenersInOrganization new];
                    id value = [dict objectForKey:LISTENER_COUNT];
                    
                    if([value respondsToSelector:@selector(integerValue)]) {
                        int totalCount = [[dict objectForKey:LISTENER_COUNT] intValue];
                        
                        listeners.organizationId     = [[dict objectForKey:ORG_ID] intValue];
                        if (totalCount > 0) {
                            listeners.listenersList      = [self getListenerDetails:[dict objectForKey:LISTENER_DETAILS]];
                            int count                    = (int)listeners.listenersList.count;
                            listeners.remainingListeners = totalCount - count;
                        }
                        
                        [arrListenerDetails addObject:listeners];
                    }
                }
            }
        }
    }
    return arrListenerDetails;
}


#pragma mark --- Add Listeners ---

+ (WiSeCloudListenerAPIResponse *) parseAddListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudListenerAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudListenerAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;
            
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.listenerList                 = [self getListenerDetails:[dictResponse objectForKey:DATA]];
        }
    }
    return response;
}

#pragma mark --- Add  Listeners ---

+ (WiSeCloudListenerAPIResponse *) parseAddSecureListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return [self parseAddListenerAPIResponse:responseInfo];
}

#pragma mark --- Edit Listeners ---

+ (WiSeCloudListenerAPIResponse *) parseEditListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
 
    return [self parseAddListenerAPIResponse:responseInfo];
}

#pragma mark --- Delete Listeners ---

+ (WiSeCloudListenerAPIResponse *) parseDeleteListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return [self parseAddListenerAPIResponse:responseInfo];
}

#pragma mark --- Get Listeners Archive ---

+ (WiSeCloudListenerAPIResponse *) parseGetArchivedListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return nil;
}


@end
