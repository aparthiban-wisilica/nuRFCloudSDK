//
//  WiSeOperationServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 04/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeOperationServicesResponseParser.h"

#import "WiSeUpdateDirectOperationStatusAPIResponse.h"
#import "WiSeRequestForRemoteOperationAPIResponse.h"
#import "WiSeUpdateRemoteOperationFeedbackAPIResponse.h"

#import "WiSeDirectRemoteOperationDetails.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

@implementation WiSeOperationServicesResponseParser

# pragma mark --- Update Direct Operation Status ---

+ (WiSeUpdateDirectOperationStatusAPIResponse *) parseUpdateDirectOperationStatusAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    
    WiSeUpdateDirectOperationStatusAPIResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeUpdateDirectOperationStatusAPIResponse new];
            WiSeCloudApiResponse * statusResponse                 = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                              = statusResponse.statusMessage;
            response.apiId                                      = statusResponse.apiId;
            response.startTime                                  = statusResponse.startTime;
            response.endTime                                    = statusResponse.endTime;
            response.executionTime                              = statusResponse.executionTime;
            response.urlResponseStatusCode                      = statusResponse.urlResponseStatusCode;
            response.statusCode                                 = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.updatedOperationList                       = [self getOperationDetailsFromDataArray:[dictResponse objectForKey:DATA]];
            
            
        }
    }
    return response;

}

+ (NSArray *) getOperationDetailsFromDataArray : (NSArray *) dataArray {
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    NSMutableArray * arrOperationDetails = nil;
    
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        arrOperationDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                WiSeDirectRemoteOperationDetails * details = [WiSeDirectRemoteOperationDetails new];
                details.device_groupCloudId                = [[dict objectForKey:GRPDVCID] intValue];
                details.operationId                        = [[dict objectForKey:OPERATIONID] intValue];
                details.sequenceNumber                     = [[dict objectForKey:SEQUENCENUMBER] intValue];
                details.phoneOperationId                   = [[dict objectForKey:PHONEOPERATIONID] intValue];
                details.timeStamp                          = [[dict objectForKey:TIMESTAMP] doubleValue];
                details.status                             = [[dict objectForKey:_STATUS] intValue];
                details.message                            = [dict objectForKey:MESSAGE];

                // Check group or device
                if ([[dict objectForKey:GRP_DVC] intValue] == WiseItem) {
                    details.itemType                           = WiseItem;
                }else if ([[dict objectForKey:GRP_DVC] intValue] == WiseSubItem) {
                    details.itemType                           = WiseSubItem;
                }
                
                details.device_groupMeshId = [[dict objectForKey:DEVICE_SHORT_ID] intValue];
                details.encData = [dict objectForKey:ENCDATA];
                
                [arrOperationDetails addObject:details];
            }
        }
    }
    
    return arrOperationDetails;
}

# pragma mark --- Request For Remote Operation ---

+ (WiSeRequestForRemoteOperationAPIResponse *) parseRequestForRemoteOperationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    
    WiSeRequestForRemoteOperationAPIResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeRequestForRemoteOperationAPIResponse new];
            WiSeCloudApiResponse * statusResponse               = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                              = statusResponse.statusMessage;
            response.apiId                                      = statusResponse.apiId;
            response.startTime                                  = statusResponse.startTime;
            response.endTime                                    = statusResponse.endTime;
            response.executionTime                              = statusResponse.executionTime;
            response.urlResponseStatusCode                      = statusResponse.urlResponseStatusCode;
            response.statusCode                                 = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.operationLogId                             = [[[dictResponse objectForKey:DATA] objectForKey:OPERATION_LOG_ID] intValue];
            
            return response;
        }
    }
    return nil;

}

# pragma mark --- Update Remote Operation Feedback ---

+ (WiSeUpdateRemoteOperationFeedbackAPIResponse *) parseUpdateRemoteOperationFeedbackAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    
    WiSeUpdateRemoteOperationFeedbackAPIResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {

            response = [WiSeUpdateRemoteOperationFeedbackAPIResponse new];
            WiSeCloudApiResponse * statusResponse                   = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                              = statusResponse.statusMessage;
            response.apiId                                      = statusResponse.apiId;
            response.startTime                                  = statusResponse.startTime;
            response.endTime                                    = statusResponse.endTime;
            response.executionTime                              = statusResponse.executionTime;
            response.urlResponseStatusCode                      = statusResponse.urlResponseStatusCode;
            response.statusCode                                 = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.updatedRemoteOperationList                 = [self getOperationDetailsFromDataArray1:[dictResponse objectForKey:DATA]];
            
            
        }
    }
    return response;

}

+ (NSArray *) getOperationDetailsFromDataArray1 : (NSArray *) dataArray {
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    NSMutableArray * arrOperationDetails = nil;
    
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        arrOperationDetails = [[NSMutableArray alloc] init];
        for (int i = 0; i < dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                WiSeDirectRemoteOperationDetails * details = [WiSeDirectRemoteOperationDetails new];
                
                details.status                             = [[dict objectForKey:_STATUS] intValue];
                details.message                            = [dict objectForKey:MESSAGE];

                details.device_groupMeshId = [[dict objectForKey:DEVICE_MESH_ID] intValue];
                details.encData = [dict objectForKey:ENCDATA];
                
                [arrOperationDetails addObject:details];
            }
        }
    }
    
    return arrOperationDetails;
}


@end
