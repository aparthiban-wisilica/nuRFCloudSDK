//
//  WiSeAppServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAppServicesResponseParser.h"
#import "WiSeNetworkUtil.h"
#import "WiSeRegisterAppInfoAPIResponse.h"
#import "WiSeParsedAPIResponse.h"

@implementation WiSeAppServicesResponseParser

#pragma mark - Save APP Info

+ (WiSeRegisterAppInfoAPIResponse *) parseSaveAppInfoAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            WiSeRegisterAppInfoAPIResponse * response = [WiSeRegisterAppInfoAPIResponse new];
            WiSeCloudApiResponse * statusResponse     = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                    = statusResponse.statusMessage;
            response.apiId                            = statusResponse.apiId;
            response.startTime                        = statusResponse.startTime;
            response.endTime                          = statusResponse.endTime;
            response.executionTime                    = statusResponse.executionTime;
            response.urlResponseStatusCode            = statusResponse.urlResponseStatusCode;
            response.statusCode                       = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            response.appId                            = [[[dictResponse objectForKey:DATA] objectForKey:APPId] intValue];
            return response;
        }
    }
    return nil;
    
}


@end
