//
//  WiSeAlertServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAlertServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudSnoozeSettingResponse.h"
#import "WiSeCloudSnoozeSettingDetails.h"

#import "WiSeCheckOutResponse.h"
#import "WiSeSelfAssignResetAPIResponse.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

@implementation WiSeAlertServicesResponseParser

#pragma mark --- Set/Upadate Snooze Timing ---

+ (WiSeCloudSnoozeSettingResponse *) parseSetUpdateSnoozeTimingAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudSnoozeSettingResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudSnoozeSettingResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;


            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.snoozeSettingsList           = [self getSnoozeSettingsDetailsListFromResponseData:[dictResponse objectForKey:DATA]];
            
        }
    }
    return response;

}

// Parsing Snooze Settings details

+ (NSMutableArray *) getSnoozeSettingsDetailsListFromResponseData : (NSArray *) arrOfSnoozes  {
    
    NSMutableArray * arrSnoozeDetails = nil;
    if (arrOfSnoozes) {
    
        if ([WiSeNetworkUtil isArrayValid:arrOfSnoozes]) {
            arrSnoozeDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOfSnoozes.count; i++) {
                NSDictionary * dict = [arrOfSnoozes objectAtIndex:i];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    if ([dict objectForKey:SNOOZE_COUNT]) {
                        WiSeCloudSnoozeSettingDetails * details = [WiSeCloudSnoozeSettingDetails new];

                        details.alertType                       = [[dict objectForKey:ALERT_TYPE] intValue];
                        details.alertId                         = [[dict objectForKey:ALERT_ID] intValue];
                        details.snoozeCount                     = [[dict objectForKey:SNOOZE_COUNT] intValue];
                        details.snoozeTime                      = [[dict objectForKey:SNOOZE_TIME] intValue];
                        details.message                         = [dict objectForKey:MESSAGE];
                        details.organizationId                  = [[dict objectForKey:ORG_ID] intValue];
                        details.status                          = [[dict objectForKey:_STATUS] intValue];

                        [arrSnoozeDetails addObject:details];
                    }
                }
            }
        }
        
    }
    return arrSnoozeDetails;
}

#pragma mark --- Enable/Disable CheckOut API Time ---

+ (WiSeCheckOutResponse *) parseEnableDisableCheckOutAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCheckOutResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCheckOutResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;


            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            if ([WiSeNetworkUtil isDictionaryValid:[dictResponse objectForKey:DATA]]) {
                response.tagId                        = [[[dictResponse objectForKey:DATA] objectForKey:TAG_ID] intValue];
                response.status                       = [[[dictResponse objectForKey:DATA] objectForKey:_STATUS] intValue];
                response.checkOutInterval             = [[[dictResponse objectForKey:DATA] objectForKey:CHECKOUT_INTERVAL] intValue];
                response.message                      = [[dictResponse objectForKey:DATA] objectForKey:MESSAGE];
            }
        }
    }
    return response;
    
}

#pragma mark --- Self Assign-Assign Reset API ---

+ (WiSeSelfAssignResetAPIResponse *) parseSelfAssignResetAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeSelfAssignResetAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeSelfAssignResetAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                = statusResponse.statusMessage;
            response.apiId                        = statusResponse.apiId;
            response.startTime                    = statusResponse.startTime;
            response.endTime                      = statusResponse.endTime;
            response.executionTime                = statusResponse.executionTime;
            response.urlResponseStatusCode        = statusResponse.urlResponseStatusCode;
            
            
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            if ([WiSeNetworkUtil isDictionaryValid:[dictResponse objectForKey:DATA]]) {
                response.status     = [[[dictResponse objectForKey:DATA] objectForKey:_STATUS] intValue];
                response.message    = [[dictResponse objectForKey:DATA] objectForKey:MESSAGE];
                response.tagCloudId = [[[dictResponse objectForKey:DATA] objectForKey:TAG_CLOUD_ID] intValue];
                response.assignName = [[dictResponse objectForKey:DATA] objectForKey:ASSIGN_NAME];
                response.messageId  = [[[dictResponse objectForKey:DATA] objectForKey:MESSAGEID] intValue];
            }
        }
    }
    return response;

}

@end
