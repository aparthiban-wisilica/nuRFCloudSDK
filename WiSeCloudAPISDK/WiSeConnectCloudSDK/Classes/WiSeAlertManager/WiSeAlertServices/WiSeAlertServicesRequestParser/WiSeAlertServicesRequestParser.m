//
//  WiSeAlertServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAlertServicesRequestParser.h"
#import "WiSeCloudSnoozeSettingDetails.h"
#import "WiSeCloudSnoozeSettingRequest.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCheckOutRequest.h"
#import "WiSeSelfAssignResetAPIRequest.h"

@implementation WiSeAlertServicesRequestParser

#pragma mark --- Set/Upadate Snooze Timing ---

+ (NSMutableArray *) createSetUpdateSnoozeTimeApiParameters : (WiSeCloudSnoozeSettingRequest *)    request {
    NSArray * arrSnoozeSettingDetails = request.snoozeSettingsList;
    arrSnoozeSettingDetails = [WiSeNetworkUtil replaceNullValues:arrSnoozeSettingDetails];
    NSMutableArray * arrJson = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrSnoozeSettingDetails]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrSnoozeSettingDetails.count; i++) {
            WiSeCloudSnoozeSettingDetails * snoozeInfo = [arrSnoozeSettingDetails objectAtIndex:i];
            if (snoozeInfo) {
                NSString * strAlertType   = [NSString stringWithFormat:@"%d",snoozeInfo.alertType];
                NSString * strSnoozeTime  = [NSString stringWithFormat:@"%d",snoozeInfo.snoozeTime];
                NSString * strSnoozeCount = [NSString stringWithFormat:@"%d",snoozeInfo.snoozeCount];
                NSString * strOrgId       = [NSString stringWithFormat:@"%d",snoozeInfo.organizationId];

                NSArray * keys            = [NSArray arrayWithObjects:ALERT_TYPE,
                                             SNOOZE_TIME,
                                             SNOOZE_COUNT,
                                             ORG_ID, nil];
                NSArray * objects         = [NSArray arrayWithObjects:strAlertType,
                                             strSnoozeTime,
                                             strSnoozeCount,
                                             strOrgId, nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrJson addObject:jsonDictionary];
                }
            }
        }
    }
    
    return arrJson;
}

#pragma mark --- Enable/Disable CheckOut API Time ---

+ (NSDictionary *) createEnableDisableCheckOutApiParameters : (WiSeCheckOutRequest *)    request {
    NSDictionary * jsonDict = nil;
    if (request) {
        NSString * strCheckOutInterval = [NSString stringWithFormat:@"%d",request.checkOutInterval];
        NSString * strAction           = [NSString stringWithFormat:@"%d",request.checkoutAction];

        jsonDict                       = [NSDictionary dictionaryWithObjectsAndKeys:strCheckOutInterval,CHECKOUT_INTERVAL,strAction,ACTION, nil];
    }
    return jsonDict;
}

#pragma mark --- Self Assign-Assign Reset API ---

+ (NSDictionary *) createSelfAssignResetApiParameters : (WiSeSelfAssignResetAPIRequest *)  request {
    NSDictionary * jsonDict = nil;
    if (request) {
        NSString * strTagCloud = [NSString stringWithFormat:@"%d",request.tagCloudId];
        NSString * strMessage  = [NSString stringWithFormat:@"%d",request.messageId];
        request.assignName     = request.assignName?request.assignName:@"";

        NSArray * keys         = [NSArray arrayWithObjects:TAG_CLOUD_ID,
                                  MESSAGE_ID,
                                  ASSIGN_NAME, nil];
        
        NSArray * objects      = [NSArray arrayWithObjects:strTagCloud,
                                  strMessage,
                                  request.assignName, nil];
        
        if (keys.count == objects.count) {
            jsonDict               = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        }
    }
    return jsonDict;
}


@end
