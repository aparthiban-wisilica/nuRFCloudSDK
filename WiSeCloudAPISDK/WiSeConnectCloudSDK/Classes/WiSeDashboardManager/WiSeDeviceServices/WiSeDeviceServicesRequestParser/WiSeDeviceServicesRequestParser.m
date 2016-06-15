//
//  WiSeDeviceServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 29/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeDeviceServicesRequestParser.h"

#import "WiSeCloudDeviceAPIRequest.h"
#import "WiSeCloudDeviceDetails.h"
#import "WiSeGetDevicesAPIRequest.h"
#import "WiSeNetworkUtil.h"
#import "WiSeDeviceGroupAssociationDetails.h"
#import "WiSeCloudListenerAPIRequest.h"

@implementation WiSeDeviceServicesRequestParser

#pragma mark --- Add Device ---

+ (NSMutableArray *) createAddDeviceApiParameters : (WiSeCloudDeviceAPIRequest *) request {
    
    NSArray * arrDeviceDetails  = request.deviceList;
    arrDeviceDetails            = [WiSeNetworkUtil replaceNullValues:arrDeviceDetails];
    NSMutableArray * arrDetails = nil;
    if ([WiSeNetworkUtil isArrayValid:arrDeviceDetails]) {
        arrDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i <arrDeviceDetails.count; i++) {
            WiSeCloudDeviceDetails * device = [arrDeviceDetails objectAtIndex:i];
            if (device) {
                NSString * strGroupId              = [NSString stringWithFormat:@"%d",device.groupCloudId];
                NSString * isConnectableStr        = [NSString stringWithFormat:@"%ld",(long)device.isConnectable];
                NSString * deviceTypeStr           = [NSString stringWithFormat:@"%ld",(long)device.deviceType];
                NSString * strDeviceMeshId         = [NSString stringWithFormat:@"%ld",(long)device.deviceMeshId];
                NSString * strFeedBack             = [NSString stringWithFormat:@"%d",device.isFeedbackEnabled];
                NSString * strStatus               = [NSString stringWithFormat:@"%ld",(long)device.deviceStatus];
                NSString * strDeviceSequenceNumber = [NSString stringWithFormat:@"%ld",(long)device.deviceSequenceNumber];
                NSString * strTriggerTimer         = [NSString stringWithFormat:@"%ld",(long)device.triggerTimer];
                NSString * strRGB                  = [NSString stringWithFormat:@"%ld,%ld,%ld",(long)device.rgbRValue,(long)device.rgbGValue,(long)device.rgbBValue];
                NSString * strIntensity            = [NSString stringWithFormat:@"%ld",(long)device.intensityValue];
                NSString * strCool                 = [NSString stringWithFormat:@"%ld",(long)device.warmCoolValue];
                NSString * strOrgId                = [NSString stringWithFormat:@"%d",device.organizationId];
                NSString * strTempId               = [NSString stringWithFormat:@"%d",device.tempId];

                device.deviceName                  = device.deviceName?device.deviceName:@"";
                device.deviceUUID                  = device.deviceUUID?device.deviceUUID:@"";
                device.hardwareVersion             = device.hardwareVersion?device.hardwareVersion:@"";
                device.softwareVersion             = device.softwareVersion?device.softwareVersion:@"";
                device.firmwareVersion             = device.firmwareVersion?device.firmwareVersion:@"";
                device.devicePairString            = device.devicePairString?device.devicePairString:@"";
                
                
                NSString * strDeviceCloudId        = [NSString stringWithFormat:@"%ld",(long)device.deviceCloudId];
                
                id devGrpAss;
                
                if (device.deviceGroupAssociationList && [device.deviceGroupAssociationList count]) {
                    devGrpAss = [self getDeviceGroupAssociationList:device.deviceGroupAssociationList];
                }else {
                    devGrpAss = @"";
                }
                
                NSArray *keys    = [NSArray arrayWithObjects: WISE_DEVICE_NAME,
                                    WISE_DEVICE_UUID,
                                    GROUP_ID,
                                    WISE_DEVICE_TYPE,
                                    WISE_DEVICE_PAIR_INFO,
                                    DEVICE_MESH_ID,
                                    WISE_DEVICE_SEQUENCE_NUMBER,
                                    HARDWARD_VERSION,
                                    SOFTWARE_VERSION,
                                    FIRMWARE_VERSION,
                                    IS_CONNECTABLE,
                                    FEEDBACK,
                                    _STATUS,
                                    TIMER,
                                    COOL,
                                    INTENSITY,
                                    RGB,
                                    DEVICEID,
                                    GROUP_ASSOCIATION,
                                    ORG_ID,
                                    TEMP_ID, nil];

                NSArray *objects = [NSArray arrayWithObjects:device.deviceName,
                                    device.deviceUUID,
                                    strGroupId,
                                    deviceTypeStr,
                                    device.devicePairString,
                                    strDeviceMeshId,
                                    strDeviceSequenceNumber,
                                    device.hardwareVersion,
                                    device.softwareVersion,
                                    device.firmwareVersion,
                                    isConnectableStr,
                                    strFeedBack,
                                    strStatus,
                                    strTriggerTimer,
                                    strCool,
                                    strIntensity,
                                    strRGB,
                                    strDeviceCloudId,
                                    devGrpAss,
                                    strOrgId,
                                    strTempId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrDetails addObject:jsonDictionary];
                }
            }
            
        }
    }
    return arrDetails;
    
}

+ (NSArray *) getDeviceGroupAssociationList : (NSArray *) list {
    NSMutableArray * arrList = nil;
    list = [WiSeNetworkUtil replaceNullValues:list];
    if ([WiSeNetworkUtil isArrayValid:list]) {
        arrList = [[NSMutableArray alloc] init];
        for (int i = 0; i < list.count; i++) {
            WiSeDeviceGroupAssociationDetails * details = [list objectAtIndex:i];
            if (details) {
                
                NSString * strOldGroupCloudId   = [NSString stringWithFormat:@"%d",details.oldGroupCloudId];
                NSString * strFreshGroupCloudId = [NSString stringWithFormat:@"%d",details.freshGroupCloudId];

                NSDictionary * dict             = [NSDictionary dictionaryWithObjectsAndKeys:strOldGroupCloudId,OLD_GROUP_ID,
                                          strFreshGroupCloudId,FRESH_GROUP_ID,nil];

                [arrList addObject:dict];
            }
        }
    }
    return arrList;
}

#pragma mark --- Edit Device ---

+ (NSMutableArray *) createEditDeviceApiParameters : (WiSeCloudDeviceAPIRequest *) request {
    
    return [self createAddDeviceApiParameters:request];

}

#pragma mark --- Delete Device ---

+ (NSMutableArray *) createDeleteDeviceApiParameters : (WiSeCloudDeviceAPIRequest *) request {
    NSArray * arrDeviceDetails = request.deviceList;
    arrDeviceDetails           = [WiSeNetworkUtil replaceNullValues:arrDeviceDetails];
    NSMutableArray * arrDetails = nil;
    if ([WiSeNetworkUtil isArrayValid:arrDeviceDetails]) {
        arrDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i <arrDeviceDetails.count; i++) {
            WiSeCloudDeviceDetails * device = [arrDeviceDetails objectAtIndex:i];
            if (device) {
                
                NSString * strDeviceCloudId = [NSString stringWithFormat:@"%ld",(long)device.deviceCloudId];
                NSString * strOrgId         = [NSString stringWithFormat:@"%d",device.organizationId];

                NSArray *keys               = [NSArray arrayWithObjects: DEVICEID,ORG_ID, nil];
                NSArray *objects            = [NSArray arrayWithObjects:strDeviceCloudId,strOrgId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrDetails addObject:jsonDictionary];
                }
            }
            
        }
    }
    return arrDetails;
}

#pragma mark --- Device Group Association ---

+ (NSMutableArray *) createDeviceGroupAssociationApiParameters : (WiSeCloudDeviceAPIRequest *) request {
    return nil;
}

#pragma mark --- Add Listener ---

+ (NSMutableArray *) createAddListenerApiParameters : (WiSeCloudListenerAPIRequest *) request {
    NSArray * arrDeviceDetails  = request.listenerList;
    arrDeviceDetails            = [WiSeNetworkUtil replaceNullValues:arrDeviceDetails];
    NSMutableArray * arrDetails = nil;
    if ([WiSeNetworkUtil isArrayValid:arrDeviceDetails]) {
        arrDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i <arrDeviceDetails.count; i++) {
            WiSeCloudListenerInfo * device = [arrDeviceDetails objectAtIndex:i];
            if (device) {
                NSString * strGroupId              = [NSString stringWithFormat:@"%d",device.groupCloudId];
                NSString * isConnectableStr        = [NSString stringWithFormat:@"%ld",(long)device.isConnectable];
                NSString * deviceTypeStr           = [NSString stringWithFormat:@"%ld",(long)device.deviceType];
                NSString * strDeviceMeshId         = [NSString stringWithFormat:@"%ld",(long)device.deviceMeshId];
                NSString * strFeedBack             = [NSString stringWithFormat:@"%d",device.isFeedbackEnabled];
                NSString * strStatus               = [NSString stringWithFormat:@"%ld",(long)device.deviceStatus];
                NSString * strDeviceSequenceNumber = [NSString stringWithFormat:@"%ld",(long)device.deviceSequenceNumber];
                NSString * strTriggerTimer         = [NSString stringWithFormat:@"%ld",(long)device.triggerTimer];
                NSString * strRGB                  = [NSString stringWithFormat:@"%ld,%ld,%ld",(long)device.rgbRValue,(long)device.rgbGValue,(long)device.rgbBValue];
                NSString * strIntensity            = [NSString stringWithFormat:@"%ld",(long)device.intensityValue];
                NSString * strCool                 = [NSString stringWithFormat:@"%ld",(long)device.warmCoolValue];
                NSString * strOrgId                = [NSString stringWithFormat:@"%d",device.organizationId];
                NSString * strTempId               = [NSString stringWithFormat:@"%d",device.tempId];

                device.deviceName                  = device.deviceName?device.deviceName:@"";
                device.deviceUUID                  = device.deviceUUID?device.deviceUUID:@"";
                device.hardwareVersion             = device.hardwareVersion?device.hardwareVersion:@"";
                device.softwareVersion             = device.softwareVersion?device.softwareVersion:@"";
                device.firmwareVersion             = device.firmwareVersion?device.firmwareVersion:@"";
                device.devicePairString            = device.devicePairString?device.devicePairString:@"";
                device.layerId                     = device.layerId?device.layerId:@"";

                NSString * strMiniRSSI             = [NSString stringWithFormat:@"%d",device.miniRSSI];
                NSString * strLatitude             = [NSString stringWithFormat:@"%f",device.latitude];
                NSString * strLongtitude           = [NSString stringWithFormat:@"%f",device.longtitude];
                
                id  zoneMap;
                
                if (device.zoneList && device.zoneList.count) {
                    zoneMap = [self getZoneDetails:device];
                }else {
                    zoneMap = @"";
                }
                
                NSString * strDeviceCloudId        = [NSString stringWithFormat:@"%ld",(long)device.deviceCloudId];
                
                NSArray *keys    = [NSArray arrayWithObjects: WISE_DEVICE_NAME,
                                    WISE_DEVICE_UUID,
                                    GROUP_ID,
                                    WISE_DEVICE_TYPE,
                                    WISE_DEVICE_PAIR_INFO,
                                    DEVICE_MESH_ID,
                                    WISE_DEVICE_SEQUENCE_NUMBER,
                                    HARDWARD_VERSION,
                                    SOFTWARE_VERSION,
                                    FIRMWARE_VERSION,
                                    IS_CONNECTABLE,
                                    FEEDBACK,
                                    _STATUS,
                                    TIMER,
                                    COOL,
                                    INTENSITY,
                                    RGB,
                                    DEVICEID,
                                    ORG_ID,
                                    MIN_RSSI,
                                    LATITUDE,
                                    LONGTITUDE,
                                    ZONE_MAPPING,
                                    TEMP_ID,
                                    LAYER_ID, nil];
                
                NSArray *objects = [NSArray arrayWithObjects:device.deviceName,
                                    device.deviceUUID,
                                    strGroupId,
                                    deviceTypeStr,
                                    device.devicePairString,
                                    strDeviceMeshId,
                                    strDeviceSequenceNumber,
                                    device.hardwareVersion,
                                    device.softwareVersion,
                                    device.firmwareVersion,
                                    isConnectableStr,
                                    strFeedBack,
                                    strStatus,
                                    strTriggerTimer,
                                    strCool,
                                    strIntensity,
                                    strRGB,
                                    strDeviceCloudId,
                                    strOrgId,
                                    strMiniRSSI,
                                    strLatitude,
                                    strLongtitude,
                                    zoneMap,
                                    strTempId,
                                    device.layerId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrDetails addObject:jsonDictionary];
                }
            }
            
        }
    }
    return arrDetails;
}

+ (NSMutableArray *) getZoneDetails : (WiSeCloudListenerInfo *) listenerInfo {
    NSArray * arrZoneDetails = listenerInfo.zoneList;
    arrZoneDetails = [WiSeNetworkUtil replaceNullValues:arrZoneDetails];
    NSMutableArray * arrJson = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrZoneDetails]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrZoneDetails.count; i++) {
            WiSeCloudZoneRules * zoneInfo = [arrZoneDetails objectAtIndex:i];
            if (zoneInfo) {
                NSString * strZoneAction = [NSString stringWithFormat:@"%d",zoneInfo.zoneAction];
                NSString * strZoneId     = [NSString stringWithFormat:@"%d",zoneInfo.zoneCloudId];

                NSArray * keys           = [NSArray arrayWithObjects:ZONE_ID,ACTION, nil];

                NSArray * objects        = [NSArray arrayWithObjects:strZoneId,strZoneAction, nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrJson addObject:jsonDictionary];
                }
            }
        }
    }
    return arrJson;
}

+ (NSDictionary *) createAddListenerApiParameters1 : (WiSeCloudListenerAPIRequest *) request {
    NSDictionary * dict = nil;
    NSArray * arr = [self createAddSecureListenerApiParameters:request];
    
    if (arr) {
        
        dict = [[NSDictionary alloc] initWithObjectsAndKeys:arr,@"devices", nil];
    }
    
    return dict;
}


#pragma mark --- Edit Listener ---

+ (NSMutableArray *) createEditListenerApiParameters : (WiSeCloudListenerAPIRequest *) request {
//    NSArray * arrDeviceDetails = request.listenerList;
//    arrDeviceDetails           = [WiSeNetworkUtil replaceNullValues:arrDeviceDetails];
//    NSMutableArray * arrDetails = nil;
//    if ([WiSeNetworkUtil isArrayValid:arrDeviceDetails]) {
//        arrDetails = [[NSMutableArray alloc] init];
//        for (int i = 0; i <arrDeviceDetails.count; i++) {
//            WiSeCloudListenerInfo * device = [arrDeviceDetails objectAtIndex:i];
//            if (device) {
//                
//                NSString * strListenerCloudId = [NSString stringWithFormat:@"%d",device.listenerCloudId];
//                NSString * strZoneId          = [NSString stringWithFormat:@"%d",device.zoneId];
//                NSString * strOrgId           = [NSString stringWithFormat:@"%d",device.organizationId];
//                NSString * strMiniRSSI        = device.miniRSSI?device.miniRSSI:@"";
//                NSString * strLatitude        = [NSString stringWithFormat:@"%f",device.latitude];
//                NSString * strLongtitude      = [NSString stringWithFormat:@"%f",device.longtitude];
//
//                NSArray *keys                 = [NSArray arrayWithObjects:LISTENER_ID,ZONE_ID,MIN_RSSI,LATITUDE,LONGTITUDE,ORG_ID, nil];
//                NSArray *objects              = [NSArray arrayWithObjects:strListenerCloudId,strZoneId,strMiniRSSI,strLatitude,strLongtitude,strOrgId,nil];
//                
//                if (keys.count == objects.count) {
//                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
//                    [arrDetails addObject:jsonDictionary];
//                }
//            }
//        }
//    }
    return [self createAddListenerApiParameters:request];
}

#pragma mark --- Delete Listener ---

+ (NSMutableArray *) createDeleteListenerApiParameters : (WiSeCloudListenerAPIRequest *) request {
    NSArray * arrDeviceDetails = request.listenerList;
    arrDeviceDetails           = [WiSeNetworkUtil replaceNullValues:arrDeviceDetails];
    NSMutableArray * arrDetails = nil;
    if ([WiSeNetworkUtil isArrayValid:arrDeviceDetails]) {
        arrDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i <arrDeviceDetails.count; i++) {
            WiSeCloudListenerInfo * device = [arrDeviceDetails objectAtIndex:i];
            if (device) {
                
                NSString * strDeviceCloudId = [NSString stringWithFormat:@"%ld",(long)device.deviceCloudId];
                NSString * strOrgId         = [NSString stringWithFormat:@"%d",device.organizationId];
                
                NSArray *keys               = [NSArray arrayWithObjects: DEVICEID,ORG_ID, nil];
                NSArray *objects            = [NSArray arrayWithObjects:strDeviceCloudId,strOrgId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrDetails addObject:jsonDictionary];
                }
            }
            
        }
    }
    return arrDetails;
}

+ (NSDictionary *) createDeleteListenerApiParameters1 : (WiSeCloudListenerAPIRequest *) request {
    NSLog(@"Delete Listeners Request Creattion");
    NSDictionary * dict = nil;
    NSArray * arr = [self createDeleteListenerApiParameters:request];
    
    if (arr) {
        
        dict = [[NSDictionary alloc] initWithObjectsAndKeys:arr,@"deletedevices", nil];
    }
    
    return dict;
}


#pragma mark --- Add Secure Listener ---

+ (NSMutableArray *) createAddSecureListenerApiParameters : (WiSeCloudListenerAPIRequest *) request {
    NSArray * arrDeviceDetails = request.listenerList;
    arrDeviceDetails           = [WiSeNetworkUtil replaceNullValues:arrDeviceDetails];
    NSMutableArray * arrDetails = nil;
    if ([WiSeNetworkUtil isArrayValid:arrDeviceDetails]) {
        arrDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i <arrDeviceDetails.count; i++) {
            WiSeCloudListenerInfo * device = [arrDeviceDetails objectAtIndex:i];
            if (device) {
                
                NSString * strDeviceType = [NSString stringWithFormat:@"%ld",(long)device.deviceType];
                NSString * strOrgId      = [NSString stringWithFormat:@"%d",device.organizationId];

                device.deviceUUID        = device.deviceUUID?device.deviceUUID:@"";

                NSArray *keys            = [NSArray arrayWithObjects:WISE_DEVICE_UUID,
                                            WISE_DEVICE_TYPE,
                                            ORG_ID,nil];

                NSArray *objects         = [NSArray arrayWithObjects:device.deviceUUID,
                                            strDeviceType,
                                            strOrgId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrDetails addObject:jsonDictionary];
                }
            }
        }
    }
    return arrDetails;
}

+ (NSDictionary *) createAddSecureListenerApiParameters1 : (WiSeCloudListenerAPIRequest *) request {
    NSDictionary * dict = nil;
    NSArray * arr = [self createAddSecureListenerApiParameters:request];
    
    if (arr) {
        
        dict = [[NSDictionary alloc] initWithObjectsAndKeys:arr,@"needDevicePairingDetailsFor", nil];
    }
    
    return dict;
}

# pragma mark --- Get Listeners For Organization ---

+ (NSMutableArray *) createGetListenersFromOrganizationApiParameters : (WiSeCloudListenerAPIRequest *) request {
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

#pragma mark --- Get Secure Device ---

+ (NSMutableArray *) createGetSecureDeviceApiParameters : (WiSeCloudDeviceAPIRequest *) request {
    NSArray * arrDeviceDetails = request.deviceList;
    arrDeviceDetails           = [WiSeNetworkUtil replaceNullValues:arrDeviceDetails];
    NSMutableArray * arrDetails = nil;
    if ([WiSeNetworkUtil isArrayValid:arrDeviceDetails]) {
        arrDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i <arrDeviceDetails.count; i++) {
            WiSeCloudDeviceDetails * device = [arrDeviceDetails objectAtIndex:i];
            if (device) {
                
                NSString * strDeviceType = [NSString stringWithFormat:@"%ld",(long)device.deviceType];
                device.deviceUUID        = device.deviceUUID?device.deviceUUID:@"";
                
                NSArray *keys    = [NSArray arrayWithObjects: WISE_DEVICE_TYPE,
                                    WISE_DEVICE_UUID, nil];
                
                NSArray *objects = [NSArray arrayWithObjects:strDeviceType,
                                    device.deviceUUID,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrDetails addObject:jsonDictionary];
                }
            }
            
        }
    }
    return arrDetails;

}

#pragma mark --- Device Group Association ---

+ (NSMutableArray *) createDeleteSecureListenerApiParameters : (WiSeCloudListenerAPIRequest *) request {
    return [self createAddSecureListenerApiParameters:request];
}

@end
