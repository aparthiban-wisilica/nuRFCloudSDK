//
//  WiSeScheduleServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeScheduleServicesRequestParser.h"
#import "WiSeCloudScheduleRequest.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudScheduleInfo.h"

@implementation WiSeScheduleServicesRequestParser

# pragma mark --- Add Schedule ---

+ (NSMutableArray *) createAddScheduleApiParameters : (WiSeCloudScheduleRequest *) request {
    NSArray * arrScheduleDetails = request.scheduleList;
    arrScheduleDetails = [WiSeNetworkUtil replaceNullValues:arrScheduleDetails];
    NSMutableArray * arrJson = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrScheduleDetails]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrScheduleDetails.count; i++) { // Once Properties are decided we can proceed with parsing
//            WiSeCloudScheduleInfo * scheduleInfo = [arrScheduleDetails objectAtIndex:i];
//            if (zoneInfo) {
//                NSString * strZoneType = [NSString stringWithFormat:@"%d",zoneInfo.zoneType];
//                NSString * strOrgId    = [NSString stringWithFormat:@"%d",zoneInfo.organizationId];
//                NSString * strZoneId   = [NSString stringWithFormat:@"%d",zoneInfo.zoneCloudId];
//                NSString * strTempId   = [NSString stringWithFormat:@"%d",zoneInfo.tempId];
//                
//                zoneInfo.zoneName      = zoneInfo.zoneName?zoneInfo.zoneName:@"";
//                
//                NSArray * keys         = [NSArray arrayWithObjects:ZONE_TYPE,
//                                          ZONE_NAME,
//                                          ORG_ID,
//                                          ZONE_ID,
//                                          TEMP_ID, nil];
//                
//                NSArray * objects      = [NSArray arrayWithObjects:strZoneType,
//                                          zoneInfo.zoneName,
//                                          strOrgId,
//                                          strZoneId,
//                                          strTempId, nil];
//                if (keys.count == objects.count) {
//                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
//                    [arrJson addObject:jsonDictionary];
//                }
//            }
        }
    }
    return arrJson;
}

# pragma mark --- Edit Schedule ---

+ (NSMutableArray *) createEditScheduleApiParameters : (WiSeCloudScheduleRequest *) request {
    return nil;
}

# pragma mark --- Delete Schedule ---

+ (NSMutableArray *) createDeleteScheduleApiParameters : (WiSeCloudScheduleRequest *) request {
    return nil;
}

@end
