//
//  WiSeTagManagerServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeTagManagerServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

#import "WiSeCloudTagResponse.h"
#import "WiSeCloudTagInfo.h"

@implementation WiSeTagManagerServicesResponseParser

#pragma mark --- Common Methods ---

+ (WiSeCloudTagResponse *) appendBasicDetails : (WiSeCloudTagResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse {
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

#pragma mark --- Add Tag ---

+ (WiSeCloudTagResponse *) parseAddTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    WiSeCloudTagResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudTagResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];

            response.tagsList                     = [self getTagDetailsFromResponseData:[dictResponse objectForKey:DATA]];
            
        }
    }
    return response;
}

+ (NSMutableArray *) getTagDetailsFromResponseData : (NSArray *) dataArray {
    
    NSMutableArray * arrTagDetails = nil;

    dataArray           = [WiSeNetworkUtil replaceNullValues:dataArray];
    
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        arrTagDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict                = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                if ([dict objectForKey:TAG_ID] || [dict objectForKey:WISE_DEVICE_UUID] || [dict objectForKey:TAG_MAJOR]) {
                    WiSeCloudTagInfo * tagDetails = [WiSeCloudTagInfo new];
                    tagDetails.tagCloudId         = [[dict objectForKey:TAG_ID]intValue];
                    tagDetails.tagMeshId          = [[dict objectForKey:TAG_MESH_ID] intValue];
                    tagDetails.tagMajor           = [[dict objectForKey:TAG_MAJOR] intValue];
                    tagDetails.tagMinor           = [[dict objectForKey:TAG_MINOR] intValue];
                    tagDetails.tagName            = [dict objectForKey:TAG_NAME];
                    tagDetails.status             = [[dict objectForKey:_STATUS] intValue];
                    tagDetails.message            = [dict objectForKey:MESSAGE];
                    tagDetails.timestamp          = [[dict objectForKey:TIMESTAMP] doubleValue];
                    tagDetails.deviceUUID         = [dict objectForKey:WISE_DEVICE_UUID];
                    tagDetails.deviceSecurityKey  = [dict objectForKey:DEVICE_SECURITY_KEY];
                    tagDetails.customerId         = [dict objectForKey:CUSTOMER_ID];
                    tagDetails.txPower            = [[dict objectForKey:TX_POWER] intValue];
                    tagDetails.channel            = [[dict objectForKey:CHANNAL] intValue];
                    tagDetails.active             = [[dict objectForKey:TAG_STATUS] intValue];
                    tagDetails.devicePairingKey   = [dict objectForKey:DEVICE_PAIRTING_KEY];
                    tagDetails.advInterval        = [[dict objectForKey:ADV_INTERVAL] intValue];
                    tagDetails.tempId             = [[dict objectForKey:TEMP_ID] intValue];
                    tagDetails.layerId            = [dict objectForKey:LAYER_ID];
                    
                    if ([dict objectForKey:NETWORK_KEY]!= NULL)
                    {
                        tagDetails.networkKey = [WiSeNetworkUtil convertBase64StringToDataWithString:[dict objectForKey:NETWORK_KEY]];
                    }
                    
                    [arrTagDetails addObject:tagDetails];
                }
            }
        }
    }
    return arrTagDetails;
}


#pragma mark --- Edit Tag ---

+ (WiSeCloudTagResponse *) parseEditTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return [self parseAddTagAPIResponse:responseInfo];
}

#pragma mark --- Get Tag ---

+ (WiSeCloudTagResponse *) parseGetTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudTagResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudTagResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];

            NSDictionary * dict                   = [dictResponse objectForKey:DATA];
            dict                                  = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:TAG_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:TAG_COUNT]intValue];
                    
                    if (totalCount > 0) {
                        response.tagsList      = [self getTagDetailsFromResponseData:[[dictResponse objectForKey:DATA] objectForKey:TAG_DETAILS]];
                        int arrCount           = (int)response.tagsList.count;
                        response.remainingTags = totalCount - arrCount ;
                    }
                }
                
            }

//            response.tagsList = [self getTagDetailsFromResponseData:[dictResponse objectForKey:DATA]];
            
        }
    }
    return response;
}

#pragma mark --- Get Archived Tag ---

+ (WiSeCloudTagResponse *) parseGetArchivedTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudTagResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudTagResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            NSDictionary * dict                   = [dictResponse objectForKey:DATA];
            dict                                  = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:TAG_ARCHIVE_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:TAG_ARCHIVE_COUNT]intValue];
                    
                    if (totalCount > 0) {
                        response.tagsList      = [self getTagDetailsFromResponseData:[[dictResponse objectForKey:DATA] objectForKey:TAG_ARCHIVE_DETAILS]];
                        int arrCount           = (int)response.tagsList.count;
                        response.remainingTags = totalCount - arrCount ;
                    }
                }
                
            }
        }
    }
    return response;
}

#pragma mark --- Delete Tag ---

+ (WiSeCloudTagResponse *) parseDeleteTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return [self parseAddTagAPIResponse:responseInfo];
}

#pragma mark --- Secure Tag ---

+ (WiSeCloudTagResponse *) parseSecureTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return [self parseAddTagAPIResponse:responseInfo];
}


@end
