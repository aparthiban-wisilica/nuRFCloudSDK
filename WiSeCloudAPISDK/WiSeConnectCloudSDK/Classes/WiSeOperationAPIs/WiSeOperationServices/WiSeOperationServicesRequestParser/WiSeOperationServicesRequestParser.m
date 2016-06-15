//
//  WiSeOperationServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 04/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeOperationServicesRequestParser.h"
#import "WiSeNetworkUtil.h"

#import "WiSeUpdateDirectOperationStatusAPIRequest.h"
#import "WiSeRequestForRemoteOperationAPIRequest.h"
#import "WiSeUpdateRemoteOperationFeedbackAPIRequest.h"
#import "WiSeDirectRemoteOperationDetails.h"


@implementation WiSeOperationServicesRequestParser

# pragma mark --- Update Direct Operation Status ---

+ (NSDictionary *) createUpdateDirectOperationStatusApiParameters : (WiSeUpdateDirectOperationStatusAPIRequest *) request {
    NSArray * arrTemp          = request.wiseUpdateDirectOperationStatusDetailsList;
    NSDictionary * dictJsonMain = nil;
    NSMutableArray * jsonDeviceArray = nil;
    NSMutableArray * jsonGroupArray = nil;
    arrTemp                    = [WiSeNetworkUtil replaceNullValues:arrTemp];
    
    if ([WiSeNetworkUtil isArrayValid:arrTemp]) {
        jsonDeviceArray = [[NSMutableArray alloc] init];
        jsonGroupArray = [[NSMutableArray alloc] init];
        for (int i=0; i<arrTemp.count; i++) {
            WiSeDirectRemoteOperationDetails * details = [arrTemp objectAtIndex:i];
            if (details) {
                
                NSString * strPhoneOperationId    = [NSString stringWithFormat:@"%d",details.phoneOperationId];
                NSString * strCoolValue           = [NSString stringWithFormat:@"%d",details.coolValue];
                NSString * strWarmValue           = [NSString stringWithFormat:@"%d",details.warmValue];
                NSString * strRGB                 = [NSString stringWithFormat:@"%d,%d,%d",details.rgbRValue,details.rgbGValue,details.rgbBValue];
                NSString * strTimer               = [NSString stringWithFormat:@"%d",details.timerValue];
                NSString * strIntencity           = [NSString stringWithFormat:@"%d",details.intensity];
                NSString * strDevice_GroupCloudId = [NSString stringWithFormat:@"%d",details.device_groupCloudId];
                NSString * strWiseType            = [NSString stringWithFormat:@"%d",details.itemType];
                NSString * strOperationId         = [NSString stringWithFormat:@"%d",details.operationId];
                NSString * strSequenceNumber      = [NSString stringWithFormat:@"%d",details.sequenceNumber];
                NSString * strTimestamp           = [NSString stringWithFormat:@"%f",details.timeStamp];
                NSString * strstatus              = [NSString stringWithFormat:@"%d",details.status];
                
                
                NSArray *keys;
                NSArray *objects ;
                NSDictionary *jsonDictionary;
                
                if (details.itemType == WiseItem) { // Group
                    keys                     = [NSArray arrayWithObjects:GRPDVCID,
                                                GRP_DVC,
                                                OPERATIONID,
                                                SEQUENCENUMBER,
                                                PHONEOPERATIONID,
                                                TIMESTAMP,
                                                _STATUS,nil];
                    
                    objects                  = [NSArray arrayWithObjects:strDevice_GroupCloudId,
                                                strWiseType,
                                                strOperationId,
                                                strSequenceNumber,
                                                strPhoneOperationId,
                                                strTimestamp,
                                                strstatus,nil];
                    
                    if (keys.count == objects.count) {
                        jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                        [jsonGroupArray addObject:jsonDictionary];
                    }
                    
                }else if (details.itemType == WiseSubItem) { // Device
                    keys                     = [NSArray arrayWithObjects:GRPDVCID,
                                                GRP_DVC,
                                                OPERATIONID,
                                                SEQUENCENUMBER,
                                                PHONEOPERATIONID,
                                                COOL,
                                                INTENSITY,
                                                RGB,
                                                TIMER,
                                                WARM,
                                                TIMESTAMP,
                                                _STATUS,nil];
                    
                    objects                  = [NSArray arrayWithObjects:strDevice_GroupCloudId,
                                                strWiseType,
                                                strOperationId,
                                                strSequenceNumber,
                                                strPhoneOperationId,
                                                strCoolValue,
                                                strIntencity,
                                                strRGB,
                                                strTimer,
                                                strWarmValue,
                                                strTimestamp,
                                                strstatus,nil];
                    
                    if (keys.count == objects.count) {
                        jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                        [jsonDeviceArray addObject:jsonDictionary];
                    }
                }
                
            }
        }
    }
    
    NSMutableArray *keys                     = [[NSMutableArray alloc] init];
    NSMutableArray *objects                  = [[NSMutableArray alloc] init];
    
    if (jsonDeviceArray && jsonDeviceArray.count) {
        [keys addObject:DEVICES];
        [objects addObject:jsonDeviceArray];
    }
    
    if (jsonGroupArray && jsonGroupArray.count) {
        [keys addObject:GROUPS];
        [objects addObject:jsonGroupArray];
    }
    
    if (keys.count == objects.count) {
        dictJsonMain = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    }
    
    
    return dictJsonMain;
    
}


# pragma mark --- Request For Remote Operation ---

+ (NSDictionary *) createRequestForRemoteOperationApiParameters : (WiSeRequestForRemoteOperationAPIRequest *) request {
    
    NSDictionary *jsonDictionary = nil;
    
    WiSeDirectRemoteOperationDetails * details = request.requestInfo;
    
    NSString * strCoolValue           = [NSString stringWithFormat:@"%d",details.coolValue];
    NSString * strWarmValue           = [NSString stringWithFormat:@"%d",details.warmValue];
    NSString * strRGB                 = [NSString stringWithFormat:@"%d,%d,%d",details.rgbRValue,details.rgbGValue,details.rgbBValue];
    NSString * strTimer               = [NSString stringWithFormat:@"%d",details.timerValue];
    NSString * strIntencity           = [NSString stringWithFormat:@"%d",details.intensity];
    NSString * strDevice_GroupCloudId = [NSString stringWithFormat:@"%d",details.device_groupCloudId];
    NSString * strWiseType            = [NSString stringWithFormat:@"%d",details.itemType];
    NSString * strOperationId         = [NSString stringWithFormat:@"%d",details.operationId];
    
    NSArray *keys                     = [NSArray arrayWithObjects:GRPDVCID,
                                         GRP_DVC,
                                         OPERATIONID,
                                         COOL,
                                         INTENSITY,
                                         RGB,
                                         TIMER,
                                         WARM,nil];
    
    NSArray *objects                  = [NSArray arrayWithObjects:strDevice_GroupCloudId,
                                         strWiseType,
                                         strOperationId,
                                         strCoolValue,
                                         strIntencity,
                                         strRGB,
                                         strTimer,
                                         strWarmValue,nil];
    
    if (keys.count == objects.count) {
        jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        
    }
    return jsonDictionary;
}


# pragma mark --- Update Remote Operation Feedback ---

+ (NSMutableArray *) createUpdateRemoteOperationFeedbackApiParameters : (WiSeUpdateRemoteOperationFeedbackAPIRequest *) request{
    NSArray * arrTemp = request.wiseUpdateRemoteOperationFeedbackRequestDetailsList;
    NSMutableArray * jsonArray = nil;
    if ([WiSeNetworkUtil isArrayValid:arrTemp]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrTemp.count; i++) {
            WiSeDirectRemoteOperationDetails * details = [arrTemp objectAtIndex:i];
            if (details) {
                NSString * strMeshId = [NSString stringWithFormat:@"%d",details.device_groupMeshId];
                details.encData      = details.encData?details.encData:@"";

                NSArray *keys        = [NSArray arrayWithObjects:DEVICE_MESH_ID,ENCDATA,nil];
                NSArray *objects     = [NSArray arrayWithObjects:strMeshId,details.encData,nil];

                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary] ;
                }
                
            }
        }
    }
    return jsonArray;
}



@end
