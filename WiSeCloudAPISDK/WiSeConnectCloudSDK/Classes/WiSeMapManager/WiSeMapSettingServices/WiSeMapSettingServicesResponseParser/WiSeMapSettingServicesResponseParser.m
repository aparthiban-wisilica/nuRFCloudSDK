//
//  WiSeMapSettingServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeMapSettingServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudApiResponse.h"
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import "WiSeCloudMapAPIResponse.h"
#import "WiSeCloudMapInfo.h"
#import "WiSeCloudMapBoundaries.h"

@implementation WiSeMapSettingServicesResponseParser

#pragma mark --- Get Map Settings ---

+ (WiSeCloudMapAPIResponse *) parseGetMapSettingsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudMapAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudMapAPIResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage         = statusResponse.statusMessage;
            response.apiId                 = statusResponse.apiId;
            response.startTime             = statusResponse.startTime;
            response.endTime               = statusResponse.endTime;
            response.executionTime         = statusResponse.executionTime;
            response.urlResponseStatusCode = statusResponse.urlResponseStatusCode;
            response.statusCode            = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.mapInfoList           = [self getMapSettingInfoList:[dictResponse objectForKey:DATA]]; // Get Maps Info
        }
    }
    return response;
}

+ (WiSeCloudMapInfo *) getMapSettingInfo : (NSDictionary *) dict {
    WiSeCloudMapInfo * mapInfo = nil;
    dict = [WiSeNetworkUtil replaceNullValues:dict];
    if ([WiSeNetworkUtil isDictionaryValid:dict]) {
        if ([dict objectForKey:FILE_NAME]) {
            mapInfo               = [WiSeCloudMapInfo new];
            mapInfo.version       = [dict objectForKey:VERSION];
            mapInfo.fileName      = [dict objectForKey:FILE_NAME];
            mapInfo.filePath      = [dict objectForKey:FILE_PATH];
            mapInfo.scalingFactor = [[dict objectForKey:SCALING_FACTOR] intValue];
            mapInfo.fileSize      = [[dict objectForKey:FILE_SIZE] intValue];
            mapInfo.status        = [[dict objectForKey:_STATUS] intValue];
            mapInfo.layerId       = [dict objectForKey:LAYER_ID];
            mapInfo.mapBoundaries = [self getMapBoudaries:[dict objectForKey:MAP_BOUNDARIES]]; // Get the map boundaries
        }
    }
    return mapInfo;
}

// Get List of Map Settings
+ (NSArray *) getMapSettingInfoList : (NSArray *) array {
    NSMutableArray * arrOfMaps = nil;
    array = [WiSeNetworkUtil replaceNullValues:array];
    if ([WiSeNetworkUtil isArrayValid:array]) {
        arrOfMaps = [[NSMutableArray alloc] init];
        for (int i = 0; i<array.count; i++) {
            WiSeCloudMapInfo * info = [self getMapSettingInfo:[array objectAtIndex:i]];
            if (info) {
                [arrOfMaps addObject:info];
            }
        }
    }
    return arrOfMaps;
}

// Get Map Boudaries
+ (NSArray *) getMapBoudaries : (NSArray *) arrBoundaries {
    NSMutableArray * mutArr = nil;
    arrBoundaries           = [WiSeNetworkUtil replaceNullValues:arrBoundaries];
    if ([WiSeNetworkUtil isArrayValid:arrBoundaries]) {
        mutArr = [[NSMutableArray alloc] init];
        for (int i = 0; i< arrBoundaries.count; i++) {
            NSString * strBoudaries = [arrBoundaries objectAtIndex:i];
            strBoudaries            = [strBoudaries stringByReplacingOccurrencesOfString:@"(" withString:@""];
            strBoudaries            = [strBoudaries stringByReplacingOccurrencesOfString:@")" withString:@""];
            NSArray * temp          = [strBoudaries componentsSeparatedByString:@","];
            if ([WiSeNetworkUtil isArrayValid:temp]) {
                if (temp.count == 2) {
                    WiSeCloudMapBoundaries * boudary = [WiSeCloudMapBoundaries new];
                    boudary.boundaryLatitude         = [[temp objectAtIndex:1] doubleValue];
                    boudary.boundaryLongtitude       = [[temp objectAtIndex:0] doubleValue];
                    [mutArr addObject:boudary];
                }
            }
        }
    }
    return mutArr;
}

@end
