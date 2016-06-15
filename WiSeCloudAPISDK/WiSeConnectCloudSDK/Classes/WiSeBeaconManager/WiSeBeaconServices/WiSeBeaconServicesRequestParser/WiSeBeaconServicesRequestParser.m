//
//  WiSeBeaconServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeBeaconServicesRequestParser.h"
#import "WiSeCloudBeaconAPIRequest.h"
#import "WiSeCloudBeaconDetails.h"
#import "WiSeNetworkUtil.h"

@implementation WiSeBeaconServicesRequestParser

# pragma mark --- Add Beacon                ---

+ (NSArray *) createAddBeaconApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    NSArray * arrTemp = request.beaconsList;
    
    NSMutableArray * jsonArray = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrTemp]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrTemp.count; i++) {
            WiSeCloudBeaconDetails * item = [arrTemp objectAtIndex:i];
            if (item) {
                
                item.beaconName             = item.beaconName?item.beaconName:@"";
                item.beaconUUID             = item.beaconUUID?item.beaconUUID:@"";
                NSString * strBeaconMeshId  = [NSString stringWithFormat:@"%d",item.beaconMeshId];
                NSString * strMajor         = [NSString stringWithFormat:@"%d",item.major];
                NSString * strMinor         = [NSString stringWithFormat:@"%d",item.minor];
                NSString * strTempId        = [NSString stringWithFormat:@"%d",item.tempId];
                
                NSString * strBeaconPrefix  = [WiSeNetworkUtil hexadecimalStringFromNsData: item.beaconPrefix];//[item.beaconPrefix base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                strBeaconPrefix             = strBeaconPrefix?strBeaconPrefix:@"";
                NSString * strBeaconData    = [item.beaconData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                strBeaconData               = strBeaconData?strBeaconData:@"";
                
                NSArray *keys               = [NSArray arrayWithObjects:BEACON_NAME,
                                               BEACON_UUID,
                                               BEACON_MESH_ID,
                                               BEACON_MAJOR,
                                               BEACON_MINOR,
                                               BEACON_PREFIX,
                                               BEACON_DATA,
                                               TEMP_ID,nil];
                
                NSArray *objects            = [NSArray arrayWithObjects:item.beaconName,
                                               item.beaconUUID,
                                               strBeaconMeshId,
                                               strMajor,
                                               strMinor,
                                               strBeaconPrefix,
                                               strBeaconData,
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

# pragma mark --- Edit Beacon               ---

+ (NSArray *) createEditBeaconApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    NSArray * arrTemp = request.beaconsList;
    
    NSMutableArray * jsonArray = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrTemp]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrTemp.count; i++) {
            WiSeCloudBeaconDetails * item = [arrTemp objectAtIndex:i];
            if (item) {
                
                item.beaconName             = item.beaconName?item.beaconName:@"";
                
                NSString * strBeaconCloudId  = [NSString stringWithFormat:@"%d",item.beaconCloudId];
                
                NSArray *keys               = [NSArray arrayWithObjects:BEACON_NAME,BEACON_ID,nil];
                NSArray *objects            = [NSArray arrayWithObjects:item.beaconName,strBeaconCloudId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary];
                }
                
            }
        }
    }
    
    return jsonArray;
    
}

# pragma mark --- Delete Beacon             ---

+ (NSArray *) createDeleteBeaconApiParameterWithRequest: (WiSeCloudBeaconAPIRequest *) request {
    NSArray * arrTemp = request.beaconsList;
    
    NSMutableArray * jsonArray = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrTemp]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrTemp.count; i++) {
            WiSeCloudBeaconDetails * item = [arrTemp objectAtIndex:i];
            if (item) {
                
                NSString * strBeaconCloudId  = [NSString stringWithFormat:@"%d",item.beaconCloudId];
                
                NSArray *keys               = [NSArray arrayWithObjects:BEACON_ID,nil];
                NSArray *objects            = [NSArray arrayWithObjects:strBeaconCloudId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary];
                }
                
            }
        }
    }
    
    return jsonArray;
    
}


# pragma mark --- Add Configured Beacon     ---

+ (NSArray *) createAddEditConfiguredBeaconApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    
    NSArray * arrTemp = request.beaconsList;
    
    NSMutableArray * jsonArray = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrTemp]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrTemp.count; i++) {
            WiSeCloudBeaconDetails * item = [arrTemp objectAtIndex:i];
            if (item) {
                
                item.beaconName             = item.beaconName?item.beaconName:@"";
                item.beaconRangeName        = item.beaconRangeName?item.beaconRangeName:@"";
                item.beaconUUID             = item.beaconUUID?item.beaconUUID:@"";
                NSString * strBeaconMeshId  = [NSString stringWithFormat:@"%d",item.beaconMeshId];
                NSString * strDeviceCloudId = [NSString stringWithFormat:@"%d",item.deviceCloudId];
                NSString * strMajor         = [NSString stringWithFormat:@"%d",item.major];
                NSString * strMinor         = [NSString stringWithFormat:@"%d",item.minor];
                NSString * strTxPower       = [NSString stringWithFormat:@"%d",item.txPower];
                NSString * strCapability    = [NSString stringWithFormat:@"%d",item.capability];
                NSString * strBeaconSlot    = [NSString stringWithFormat:@"%d",item.beaconSlot];
                NSString * strRangeRSSI     = [NSString stringWithFormat:@"%d",item.rangerSSI];
                NSString * strBeaconType    = [NSString stringWithFormat:@"%d",item.beaconType];
                NSString * strBeaconStatus  = [NSString stringWithFormat:@"%d",item.beaconStatus];
                NSString * strTempId        = [NSString stringWithFormat:@"%d",item.tempId];
                
                NSString * strCalibaratedValue = [NSString stringWithFormat:@"%d",item.calibratedValue];
                
                
                NSString * strBeaconPrefix  = [WiSeNetworkUtil hexadecimalStringFromNsData: item.beaconPrefix]; // [item.beaconPrefix base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                
                strBeaconPrefix             = strBeaconPrefix?strBeaconPrefix:@"";
                //                NSString * strBeaconData    = [item.beaconData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                //                strBeaconData               = strBeaconData?strBeaconData:@"";
                NSString * strAdvInterval   = [NSString stringWithFormat:@"%d",item.advertisingInterval];
                

                NSArray *keys               = [NSArray arrayWithObjects:BEACON_NAME,
                                               BEACON_UUID,
                                               BEACON_SLOT,
                                               DEVICEID,
                                               BEACON_MESH_ID,
                                               BEACON_MAJOR,
                                               BEACON_MINOR,
                                               TX_POWER,
                                               CAPABILITY,
                                               ADV_INTERVAL,
                                               BEACON_RANGE_NAME,
                                               RANGE_RSSI,
                                               BEACON_TYPE,
                                               BEACON_PREFIX,
                                               BEACON_STATUS,
                                               CALIBRATED_VALUE,
                                               TEMP_ID,nil];
                
                NSArray *objects            = [NSArray arrayWithObjects:item.beaconName,
                                               item.beaconUUID,
                                               strBeaconSlot,
                                               strDeviceCloudId,
                                               strBeaconMeshId,
                                               strMajor,
                                               strMinor,
                                               strTxPower,
                                               strCapability,
                                               strAdvInterval,
                                               item.beaconRangeName,
                                               strRangeRSSI,
                                               strBeaconType,
                                               strBeaconPrefix,
                                               strBeaconStatus,
                                               strCalibaratedValue,
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


# pragma mark --- Edit Configured Beacon    ---

+ (NSArray *) createEditConfiguredBeaconApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    return nil;
}


# pragma mark --- Delete Configured Beacon  ---

+ (NSArray *) createGetConfiguredBeaconApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    return nil;
}


# pragma mark --- Create Beacon Association ---

+ (NSArray *) createCreateBeaconAssociationApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    NSArray * arrOfAssociationDetails = request.beaconsList;    
    NSMutableArray * jsonArray = [[NSMutableArray alloc] init];
    
    if (arrOfAssociationDetails && arrOfAssociationDetails.count) {
        for (int i = 0; i < arrOfAssociationDetails.count; i++) {
            
            WiSeCloudBeaconDetails * details = [arrOfAssociationDetails objectAtIndex:i];
            
            if (details) {
                
                NSDictionary * dictJson = [self getJsonDictWithAssociationDetails:details];
                [jsonArray addObject:dictJson];
                
            }
            
        }
    }
    
    return jsonArray;
    
}

+ (NSDictionary *) getJsonDictWithAssociationDetails : (WiSeCloudBeaconDetails *) details {
    
    NSDictionary *jsonDictionary = nil;
    
    NSString * strDeviceId       = [NSString stringWithFormat:@"%d",details.deviceCloudId];
    NSString * strBeaconMeshId   = [NSString stringWithFormat:@"%d",details.beaconMeshId];
    NSString * strBeaconId       = [NSString stringWithFormat:@"%d",details.beaconCloudId];
    NSString * strDeviceMeshId   = [NSString stringWithFormat:@"%d",details.deviceMeshId];
    NSString * strMajor          = [NSString stringWithFormat:@"%d",details.major];
    NSString * strMinor          = [NSString stringWithFormat:@"%d",details.minor];
    NSString * strBeaconStatus   = [NSString stringWithFormat:@"%d",details.beaconStatus];
    
    //    NSString * strBeaconData     = [details.beaconData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    //    strBeaconData                = strBeaconData?strBeaconData:@"";
    
    NSString * strBeaconPrefix   = [WiSeNetworkUtil hexadecimalStringFromNsData:details.beaconPrefix]; //[details.beaconPrefix base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    strBeaconPrefix              = strBeaconPrefix?strBeaconPrefix:@"";
    
    details.beaconName           = details.beaconName?details.beaconName:@"";
    NSString * strBeaconUUID     = details.beaconUUID;
    strBeaconUUID                = strBeaconUUID?strBeaconUUID:@"";
    
    details.deviceUUID           = details.deviceUUID?details.deviceUUID:@"";
    NSString * strDeviceUUID     = details.deviceUUID;
    strDeviceUUID                = strDeviceUUID?strDeviceUUID:@"";
    
    
    if (details.beaconCloudId) { // Already added beacon

        NSArray *keys                = [NSArray arrayWithObjects:BEACONID,
                                        DEVICE_MESH_ID,
                                        DEVICEID,
                                        LISTEN_STATUS,
                                        WISE_DEVICE_UUID,
                                        BEACON_MESH_ID, nil];
        
        NSArray *objects             = [NSArray arrayWithObjects:strBeaconId,
                                        strDeviceMeshId,
                                        strDeviceId,
                                        strBeaconStatus,
                                        strDeviceUUID,
                                        strBeaconMeshId,nil];

        if (keys.count == objects.count) {
            jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
            
        }
        
    }else { // New beacon

        NSArray *keys    = [NSArray arrayWithObjects:BEACON_NAME,
                            BEACON_UUID,
                            BEACON_MESH_ID,
                            BEACON_MAJOR,
                            BEACON_MINOR,
                            BEACON_PREFIX,
                            DEVICE_MESH_ID,
                            DEVICEID,
                            LISTEN_STATUS,
                            WISE_DEVICE_UUID, nil];

        NSArray *objects = [NSArray arrayWithObjects:details.beaconName,
                            strBeaconUUID,
                            strBeaconMeshId,
                            strMajor,
                            strMinor,
                            strBeaconPrefix,
                            strDeviceMeshId,
                            strDeviceId,
                            strBeaconStatus,
                            strDeviceUUID,nil];
        
        if (keys.count == objects.count) {
            jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        }
    }
    return jsonDictionary;
}

# pragma mark --- Delete Beacon Association ---

+ (NSArray *) createDeleteBeaconAssociationApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    return nil;
}

# pragma mark ---Update Beacon Battery Status --- 

+ (NSArray *) updateBeaconBatteryStatusApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    NSArray * arrTemp = request.beaconsList;
    
    NSMutableArray * jsonArray = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrTemp]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrTemp.count; i++) {
            WiSeCloudBeaconDetails * item = [arrTemp objectAtIndex:i];
            if (item) {
                
                NSString * strDeviceCloudId = [NSString stringWithFormat:@"%d",item.deviceCloudId];
                NSString * strBatteryLevel  = [NSString stringWithFormat:@"%d",item.batteryLevel];
                NSArray *keys               = [NSArray arrayWithObjects:DEVICEID,BATTARY_LEVEL,nil];
                NSArray *objects            = [NSArray arrayWithObjects:strDeviceCloudId,strBatteryLevel,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary];
                }
                
            }
        }
    }
    return jsonArray;
}


# pragma mark --- Update Beacon Data Log ---

+ (NSData *) updateBeaconDataLogApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    if (request.beaconData) {
        return request.beaconData;
    }
    return nil;
}

+ (NSArray *) createDeleteConfiguredBeaconApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request {
    return nil;
}

@end
