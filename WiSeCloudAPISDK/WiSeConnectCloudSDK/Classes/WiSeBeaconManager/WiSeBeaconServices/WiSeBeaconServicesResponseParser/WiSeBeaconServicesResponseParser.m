//
//  WiSeBeaconServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeBeaconServicesResponseParser.h"

#import "WiSeCloudBeaconAPIResponse.h"
#import "WiSeCloudBeaconDetails.h"

#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudApiResponse.h"

@implementation WiSeBeaconServicesResponseParser

# pragma mark --- Commmon Methods           ---

+ (WiSeCloudBeaconAPIResponse *)getWiSeCloudBeaconAPIResponseFromResponseDetails : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudBeaconAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeCloudBeaconAPIResponse new];
            WiSeCloudApiResponse * statusResponse                 = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                              = statusResponse.statusMessage;
            response.apiId                                      = statusResponse.apiId;
            response.startTime                                  = statusResponse.startTime;
            response.endTime                                    = statusResponse.endTime;
            response.executionTime                              = statusResponse.executionTime;
            response.urlResponseStatusCode                      = statusResponse.urlResponseStatusCode;
            response.statusCode                                 = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.beaconsList                                = [self getBeaconListFromDataArray:[dictResponse objectForKey:DATA]];
            
            
        }
    }
    return response;
    
}

+ (NSArray *) getBeaconListFromDataArray : (NSArray *) dataArray {
    
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    NSMutableArray * arrBeaconDetails = nil;
    
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        arrBeaconDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                if ([dict objectForKey:BEACON_ID]) {
                    WiSeCloudBeaconDetails * details = [WiSeCloudBeaconDetails new];
                    
                    details.beaconCloudId            = [[dict objectForKey:BEACON_ID] intValue];
                    details.beaconName               = [dict objectForKey:BEACON_NAME];
                    details.beaconUUID               = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:BEACON_UUID]];
                    details.deviceUUID               = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:WISE_DEVICE_UUID]];
                    details.beaconSlot               = [[dict objectForKey:BEACON_SLOT] intValue];
                    details.deviceCloudId            = [[dict objectForKey:DEVICEID] intValue];
                    details.deviceMeshId             = [[dict objectForKey:DEVICE_MESH_ID] intValue];
                    details.beaconMeshId             = [[dict objectForKey:BEACON_MESH_ID] intValue];
                    details.major                    = [[dict objectForKey:BEACON_MAJOR] intValue];
                    details.minor                    = [[dict objectForKey:BEACON_MINOR] intValue];
                    details.status                   = [[dict objectForKey:_STATUS] intValue];
                    details.batteryLevel             = [[dict objectForKey:BATTARY_LEVEL] intValue];
                    details.message                  = [dict objectForKey:MESSAGE];
                    details.timeStamp                = [[dict objectForKey:TIMESTAMP] doubleValue];
                    details.beaconData               = [WiSeNetworkUtil convertBase64StringToDataWithString:[dict objectForKey:BEACON_DATA]];
                    details.beaconPrefix             = [WiSeNetworkUtil convertStringToHexa:[dict objectForKey:BEACON_PREFIX]]; //[WiSeNetworkUtil convertBase64StringToDataWithString:[dict objectForKey:BEACON_PREFIX]];
                    details.beaconStatus             = [[dict objectForKey:LISTEN_STATUS] intValue];
                    details.tempId                   = [[dict objectForKey:TEMP_ID] intValue];
                    
                    [arrBeaconDetails addObject:details];
                    
                }
                
            }
        }
    }
    
    return arrBeaconDetails;
}

+ (NSArray *) getBeaconListForGetFromDataArray : (NSArray *) dataArray {
    
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    NSMutableArray * arrBeaconDetails = nil;
    
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        arrBeaconDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                if ([dict objectForKey:BEACON_ID]) {
                    WiSeCloudBeaconDetails * details = [WiSeCloudBeaconDetails new];
                    
                    details.beaconCloudId            = [[dict objectForKey:BEACON_ID] intValue];
                    details.beaconName               = [dict objectForKey:BEACON_NAME];
                    details.beaconUUID               = [dict objectForKey:BEACON_UUID];
                    details.beaconSlot               = [[dict objectForKey:BEACON_SLOT] intValue];
                    details.deviceCloudId            = [[dict objectForKey:DEVICEID] intValue];
                    details.beaconMeshId             = [[dict objectForKey:BEACON_MESH_ID] intValue];
                    details.status                   = [[dict objectForKey:_STATUS] intValue];
                    details.message                  = [dict objectForKey:MESSAGE];
                    
                    details.beaconUUID               = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:BEACON_UUID]];
                    details.deviceUUID               = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:WISE_DEVICE_UUID]];
                    
                    details.deviceCloudId            = [[dict objectForKey:DEVICEID] intValue];
                    details.major                    = [[dict objectForKey:BEACON_MAJOR] intValue];
                    details.minor                    = [[dict objectForKey:BEACON_MINOR] intValue];
                    details.beaconMeshId             = [[dict objectForKey:BEACON_MESH_ID] intValue];
                    details.txPower                  = [[dict objectForKey:TX_POWER] intValue];
                    details.capability               = [[dict objectForKey:CAPABILITY] intValue];
                    details.advertisingInterval      = [[dict objectForKey:ADV_INTERVAL] intValue];
                    details.beaconPrefix             =  [WiSeNetworkUtil convertStringToHexa:[dict objectForKey:BEACON_PREFIX]];
                    //[WiSeNetworkUtil convertBase64StringToDataWithString:[dict objectForKey:BEACON_PREFIX]];
                    details.beaconSlot               = [[dict objectForKey:BEACON_SLOT] intValue];
                    details.beaconRangeName          = [dict objectForKey:BEACON_RANGE_NAME];
                    details.beaconType               = [[dict objectForKey:BEACON_TYPE] intValue];
                    details.calibratedValue          = [[dict objectForKey:CALIBRATED_VALUE] intValue];
                    details.rangerSSI                = [[dict objectForKey:RANGE_RSSI] intValue];
                    details.beaconData               = [WiSeNetworkUtil convertBase64StringToDataWithString:[dict objectForKey:BEACON_DATA]];
                    details.beaconStatus             = [[dict objectForKey:BEACON_STATUS] intValue];
                    details.batteryLevel             = [[dict objectForKey:BATTARY_LEVEL] intValue];
                    details.timeStamp                = [[dict objectForKey:TIMESTAMP] doubleValue];
                    details.tempId                   = [[dict objectForKey:TEMP_ID] intValue];
                    
                    [arrBeaconDetails addObject:details];
                    
                }
                
            }
        }
    }
    
    return arrBeaconDetails;
}



# pragma mark --- Add Beacon                ---

+ (WiSeCloudBeaconAPIResponse *) parseAddBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudBeaconAPIResponse * respones = [self getWiSeCloudBeaconAPIResponseFromResponseDetails:responseInfo];
    return respones;
}

# pragma mark --- Edit Beacon               ---

+ (WiSeCloudBeaconAPIResponse *) parseEditBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudBeaconAPIResponse * respones = [self getWiSeCloudBeaconAPIResponseFromResponseDetails:responseInfo];
    return respones;
}


# pragma mark --- Get Beacon                ---

+ (WiSeCloudBeaconAPIResponse *) parseGetBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    
    WiSeCloudBeaconAPIResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudBeaconAPIResponse new];
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
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:BEACON_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:BEACON_COUNT]intValue];
                    
                    if (totalCount > 0) {
                        response.beaconsList    = [self getBeaconListFromDataArray:[[dictResponse objectForKey:DATA] objectForKey:BEACON_DETAILS]];
                        int arrCount            = (int)response.beaconsList.count;
                        response.remainingCount = totalCount - arrCount ;
                    }
                }
                
            }
            
            
            
        }
    }
    return response;
}


# pragma mark --- Delete Beacon             ---

+ (WiSeCloudBeaconAPIResponse *) parseDeleteBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudBeaconAPIResponse * respones = [self getWiSeCloudBeaconAPIResponseFromResponseDetails:responseInfo];
    return respones;
}


# pragma mark --- Add Configured Beacon     ---

+ (WiSeCloudBeaconAPIResponse *) parseAddConfiguredBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudBeaconAPIResponse * respones = [self getWiSeCloudBeaconAPIResponseFromResponseDetails:responseInfo];
    return respones;
}


# pragma mark --- Edit Configured Beacon    ---

+ (WiSeCloudBeaconAPIResponse *) parseEditConfiguredBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    
    WiSeCloudBeaconAPIResponse * respones = [self getWiSeCloudBeaconAPIResponseFromResponseDetails:responseInfo];
    return respones;
    
}


# pragma mark --- Get Configured Beacon     ---

+ (WiSeCloudBeaconAPIResponse *) parseGetConfiguredBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    
    WiSeCloudBeaconAPIResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudBeaconAPIResponse new];
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
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:BEACON_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:BEACON_COUNT]intValue];
                    
                    if (totalCount > 0) {
                        response.beaconsList    = [self getBeaconListForGetFromDataArray:[[dictResponse objectForKey:DATA] objectForKey:BEACON_DETAILS]];
                        int arrCount            = (int)response.beaconsList.count;
                        response.remainingCount = totalCount - arrCount ;
                    }
                }
            }
            
        }
    }
    return response;
    
}


# pragma mark --- Delete Configured Beacon  ---

+ (WiSeCloudBeaconAPIResponse *) parseDeleteConfiguredBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudBeaconAPIResponse * respones = [self getWiSeCloudBeaconAPIResponseFromResponseDetails:responseInfo];
    return respones;
}


# pragma mark --- Create Beacon Association ---

+ (WiSeCloudBeaconAPIResponse *) parseCreateBeaconAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudBeaconAPIResponse * respones = [self getWiSeCloudBeaconAPIResponseFromResponseDetails:responseInfo];
    return respones;
}


# pragma mark --- Get Beacon Association    ---

+ (WiSeCloudBeaconAPIResponse *) parseGetBeaconAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    WiSeCloudBeaconAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeCloudBeaconAPIResponse new];
            WiSeCloudApiResponse * statusResponse                 = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage         = statusResponse.statusMessage;
            response.apiId                 = statusResponse.apiId;
            response.startTime             = statusResponse.startTime;
            response.endTime               = statusResponse.endTime;
            response.executionTime         = statusResponse.executionTime;
            response.urlResponseStatusCode = statusResponse.urlResponseStatusCode;
            response.statusCode            = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            NSDictionary * dict            = [dictResponse objectForKey:DATA];
            dict                           = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:BEACON_DEVICE_ASSOCIATION_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:BEACON_DEVICE_ASSOCIATION_COUNT]intValue];
                    
                    if (totalCount > 0) {
                        response.beaconsList    = [self getBeaconListFromDataArray:[[dictResponse objectForKey:DATA] objectForKey:BEACON_DEVICE_ASSOCIATION_DETAILS]];
                        int arrCount            = (int)response.beaconsList.count;
                        response.remainingCount = totalCount - arrCount ;
                    }
                    
                }
                
                
                
            }
            
            
        }
    }
    return response;
    
}



# pragma mark --- Delete Beacon Association ---

+ (WiSeCloudBeaconAPIResponse *) parseDeleteBeaconAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    return nil;
}

# pragma mark ---Update Beacon Battery Status --- 

+ (WiSeCloudBeaconAPIResponse *) parseUpdateBeaconBatteryStatusAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudBeaconAPIResponse * respones = [self getWiSeCloudBeaconAPIResponseFromResponseDetails:responseInfo];
    return respones;
}

# pragma mark --- Update Beacon Data Log ---

+ (WiSeCloudBeaconAPIResponse *) parseUpdateBeaconDataLogAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    WiSeCloudBeaconAPIResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeCloudBeaconAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            response.phoneCloudId                 = [[[dictResponse objectForKey:DATA] objectForKey:PHONEID] intValue];
            response.status                       = [[[dictResponse objectForKey:DATA] objectForKey:_STATUS] intValue];
            response.message                      = [[dictResponse objectForKey:DATA] objectForKey:MESSAGE];
            
            
        }
    }
    return response;
}

@end
