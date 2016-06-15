//
//  WiSeSettingsServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSettingsServicesResponseParser.h"

#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import "WiSeBridgeSet_RemoveAPIResponse.h"
#import "WiSeCloudSubscriptionAPIResponse.h"
#import "WiSeSubscriptionDetails.h"
#import "WiSeSubscriptionDetails.h"
#import "WiSeHealthCheckAPIResponse.h"

@implementation WiSeSettingsServicesResponseParser

+ (WiSeBridgeSet_RemoveAPIResponse *) parseBridgeSet_RemoveAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    WiSeBridgeSet_RemoveAPIResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeBridgeSet_RemoveAPIResponse new];
            WiSeCloudApiResponse * statusResponse      = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response.statusMessage                     = statusResponse.statusMessage;
            response.apiId                             = statusResponse.apiId;
            response.startTime                         = statusResponse.startTime;
            response.endTime                           = statusResponse.endTime;
            response.executionTime                     = statusResponse.executionTime;
            response.urlResponseStatusCode             = statusResponse.urlResponseStatusCode;
            response.statusCode                        = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            
        }
    }
    return response;

}

# pragma mark --- Create/Update Subscription ---

+ (WiSeCloudSubscriptionAPIResponse *) parseCreateUpdateSubscriptionAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    WiSeCloudSubscriptionAPIResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeCloudSubscriptionAPIResponse new];
            WiSeCloudApiResponse * statusResponse              = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                              = statusResponse.statusMessage;
            response.apiId                                      = statusResponse.apiId;
            response.startTime                                  = statusResponse.startTime;
            response.endTime                                    = statusResponse.endTime;
            response.executionTime                              = statusResponse.executionTime;
            response.urlResponseStatusCode                      = statusResponse.urlResponseStatusCode;
            response.statusCode                                 = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            NSDictionary * dict = [dictResponse objectForKey:DATA];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                response.subscriptionDetails                = [WiSeSubscriptionDetails new];
                response.subscriptionDetails.subscriptionId = [[[dictResponse objectForKey:DATA] objectForKey:SUBSCRIPTIONID] intValue];
                response.status                             = [[[dictResponse objectForKey:DATA] objectForKey:_STATUS] intValue];
                response.message                            = [[dictResponse objectForKey:DATA] objectForKey:MESSAGE];
            }
            
            
            
        }
    }
    return response;
    
}

# pragma mark --- Get Subscription ---

+ (WiSeCloudSubscriptionAPIResponse *) parseGetSubscriptionAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudSubscriptionAPIResponse * response;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeCloudSubscriptionAPIResponse new];
            WiSeCloudApiResponse * statusResponse       = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                    = statusResponse.statusMessage;
            response.apiId                            = statusResponse.apiId;
            response.startTime                        = statusResponse.startTime;
            response.endTime                          = statusResponse.endTime;
            response.executionTime                    = statusResponse.executionTime;
            response.urlResponseStatusCode            = statusResponse.urlResponseStatusCode;
            response.statusCode                       = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            NSDictionary * dict = [dictResponse objectForKey:DATA];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                response.subscriptionDetails = [WiSeSubscriptionDetails new];
                response.subscriptionDetails.subscriptionId                   = [[[dictResponse objectForKey:DATA] objectForKey:SUBSCRIPTIONID] intValue];
                response.subscriptionDetails.isBridge                         = [[[dictResponse objectForKey:DATA] objectForKey:IS_BRIDGE] boolValue];
            }

            
        }
    }
    return response;
    
}

# pragma mark --- Health Check ---

+ (WiSeHealthCheckAPIResponse *) parseHealthCheckAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeHealthCheckAPIResponse * response;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeHealthCheckAPIResponse new];
            WiSeCloudApiResponse * statusResponse       = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                    = statusResponse.statusMessage;
            response.apiId                            = statusResponse.apiId;
            response.startTime                        = statusResponse.startTime;
            response.endTime                          = statusResponse.endTime;
            response.executionTime                    = statusResponse.executionTime;
            response.urlResponseStatusCode            = statusResponse.urlResponseStatusCode;
            response.statusCode                       = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
        }
    }
    return response;
}



@end
