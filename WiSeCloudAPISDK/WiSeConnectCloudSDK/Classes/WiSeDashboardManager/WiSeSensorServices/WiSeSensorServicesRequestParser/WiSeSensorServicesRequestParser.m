//
//  WiSeSensorServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 03/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSensorServicesRequestParser.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudSensorAPIRequest.h"
#import "WiSeCloudSensorItems.h"

#import "WiSeSensorTriggerIntervalSetAPIRequest.h"
#import "WiSeSensorTriggerLogAPIRequest.h"
#import "WiSeMakeMultiSensorAPIRequest.h"

@implementation WiSeSensorServicesRequestParser

#pragma mark --- Sensor Association ---

+ (NSMutableArray *) createSensorAssociationApiParameters : (WiSeCloudSensorAPIRequest *) request {
    
    NSArray * arrTemp          = request.wiseSensorItemsList;
    arrTemp                    = [WiSeNetworkUtil replaceNullValues:arrTemp];
    NSMutableArray * jsonArray = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrTemp]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i<arrTemp.count; i++) {
            WiSeCloudSensorItems * item = [arrTemp objectAtIndex:i];
            if (item) {
                
                NSString * strdevice_GroupCloudId = [NSString stringWithFormat:@"%d",item.device_GroupCloudId];
                NSString * strSensorId            = [NSString stringWithFormat:@"%d",item.sensorCloudId];
                NSString * strAction              = [NSString stringWithFormat:@"%d",item.associationAction];
                NSString * strItemType            = [NSString stringWithFormat:@"%d",item.itemType];
                NSString * strSequenceNumber      = [NSString stringWithFormat:@"%d",item.sequenceNumber];
                NSString * strChannel             = [NSString stringWithFormat:@"%d",item.channel];

                NSArray * deviceIds               = item.deviceIds;
                NSMutableArray * arrofDevices     = nil;
                
                if (deviceIds && [deviceIds isKindOfClass:[NSArray class]])
                {
                    if (deviceIds.count)
                    {
                        arrofDevices = [[NSMutableArray alloc] init];
                        for (int i = 0; i < item.deviceIds.count; i++)
                        {
                            NSString * strDeviceId = [[deviceIds objectAtIndex:i] stringValue];
                            strDeviceId            = strDeviceId?strDeviceId:@"";

                            NSDictionary * dict    = [NSDictionary dictionaryWithObjectsAndKeys:strDeviceId,DEVICEID,nil];

                            [arrofDevices addObject:dict];
                        }
                    }
                }
                
                NSDictionary *jsonDictionary =  [NSDictionary new];
                if (item.itemType == WiseSubItem || !arrofDevices)
                { // If it is Device Or If group has no devices
                    NSArray *keys    = [NSArray arrayWithObjects:GRPDVCID,
                                        SENSOR_ID,
                                        ACTION,
                                        GRP_DVC,
                                        SEQUENCENUMBER,
                                        CHANNAL, nil];
                    
                    NSArray *objects = [NSArray arrayWithObjects:strdevice_GroupCloudId,
                                        strSensorId,
                                        strAction,
                                        strItemType,
                                        strSequenceNumber,
                                        strChannel,nil];
                    
                    if (keys.count == objects.count) {
                    jsonDictionary   = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    }
                    
                }
                else
                { // If is a group and having some devices
                    NSArray *keys    = [NSArray arrayWithObjects:GRPDVCID,
                                        SENSOR_ID,
                                        ACTION,
                                        GRP_DVC,
                                        SEQUENCENUMBER,
                                        SENSOR_LINK_ID,
                                        CHANNAL, nil];
                    
                    NSArray *objects = [NSArray arrayWithObjects:strdevice_GroupCloudId,
                                        strSensorId,
                                        strAction,
                                        strItemType,
                                        strSequenceNumber,
                                        arrofDevices,
                                        strChannel,nil];
                    
                    if (keys.count == objects.count) {
                        jsonDictionary   = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    }
                }
                
                [jsonArray addObject:jsonDictionary];
                
            }
        }
    }
    
    return jsonArray;

}

#pragma mark --- Sensor Trigger Log ---

+ (NSMutableArray *) createSensorTriggerLogApiParameters : (WiSeCloudSensorAPIRequest *) request {
    NSArray * arrTemp          = request.wiseSensorItemsList;
    arrTemp                    = [WiSeNetworkUtil replaceNullValues:arrTemp];
    NSMutableArray * jsonArray = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrTemp]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i<arrTemp.count; i++) {
            WiSeCloudSensorItems * item = [arrTemp objectAtIndex:i];
            if (item) {
                
                NSString * strSequenceNumber = [NSString stringWithFormat:@"%d",item.sequenceNumber];
                NSString * strSensorMeshId   = [NSString stringWithFormat:@"%d",item.sensorMeshId];
                NSString * strTriggerAction  = [WiSeNetworkUtil convertDataToBase64StringWithData:item.triggerData];
                
                NSArray *keys    = [NSArray arrayWithObjects:SENSOR_MESH_ID,
                                    TRIGGER,
                                    SEQUENCENUMBER, nil];
                
                NSArray *objects = [NSArray arrayWithObjects:strSensorMeshId,
                                    strTriggerAction,
                                    strSequenceNumber,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary   = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary];
                
            }
        }
    }
    
    
    }
    
    return jsonArray;
}

#pragma mark --- Sensor Trigger Intervalset ---

+ (NSMutableArray *) createSensorTriggerIntervalSetApiParameters: (WiSeSensorTriggerIntervalSetAPIRequest *) request {
    return nil;
}

#pragma mark --- Make MultiSensor ---

+ (NSMutableArray *) createMakeMultiSensorApiParameters : (WiSeMakeMultiSensorAPIRequest *) request{
    return nil;
}

@end
