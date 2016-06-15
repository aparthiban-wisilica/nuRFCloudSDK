//
//  WiSeScheduleServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeScheduleServicesResponseParser.h"
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import "WiSeCloudScheduleResponse.h"

#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

@implementation WiSeScheduleServicesResponseParser

+ (WiSeCloudScheduleResponse *) appendBasicDetails : (WiSeCloudScheduleResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse {
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

# pragma mark --- Add Schedule ---

+ (WiSeCloudScheduleResponse *) parseAddScheduleAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudScheduleResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudScheduleResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            
//            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
//            response.zoneList                     = [self getZoneDetailsListFromResponseData:[dictResponse objectForKey:DATA]];
        }
    }
    return response;
}

# pragma mark --- Edit Schedule ---

+ (WiSeCloudScheduleResponse *) parseEditScheduleAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return nil;
}

# pragma mark --- Delete Schedule ---

+ (WiSeCloudScheduleResponse *) parseDeleteScheduleAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return nil;
}

# pragma mark --- Get Schedule ---

+ (WiSeCloudScheduleResponse *) parseGetScheduleAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return nil;
}

@end
