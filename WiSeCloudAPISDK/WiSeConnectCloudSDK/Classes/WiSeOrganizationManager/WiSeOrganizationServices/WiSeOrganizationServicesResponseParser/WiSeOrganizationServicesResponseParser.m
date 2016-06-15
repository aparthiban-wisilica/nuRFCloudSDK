//
//  WiSeOrganizationServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeOrganizationServicesResponseParser.h"
#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import "WiSeCloudApiResponse.h"
#import "WiSeCloudOrganizationResponse.h"
#import "WiSeCloudOrganizationInfo.h"

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

@implementation WiSeOrganizationServicesResponseParser

#pragma mark --- Common Methods ---

+ (WiSeCloudOrganizationResponse *) appendBasicDetails : (WiSeCloudOrganizationResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse {
    
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

// Parsing Organization details

+ (NSMutableArray *) getOrganizationDetailsListFromResponseData : (NSArray *) arrOfOrgs  {
    
    NSMutableArray * arrOrgDetails = nil;
    if (arrOfOrgs) {
        NSArray * arrOrg = arrOfOrgs;
        
        if ([WiSeNetworkUtil isArrayValid:arrOrg]) {
            arrOrgDetails = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrOrg.count; i++) {
                NSDictionary * dict = [arrOrg objectAtIndex:i];
                dict                = [WiSeNetworkUtil replaceNullValues:dict];
                if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                    
                    if ([dict objectForKey:ORG_ID]) {
                        WiSeCloudOrganizationInfo * details = [WiSeCloudOrganizationInfo new];

                        details.organizationId              = [[dict objectForKey:ORG_ID] intValue];
                        details.organizationName            = [dict objectForKey:ORG_NAME];
                        details.rootOrganizationId          = [[dict objectForKey:ROOT_ORG_ID] intValue];
                        details.customerId                  = [[dict objectForKey:CUSTOMER_ID] intValue];
                        details.message                     = [dict objectForKey:MESSAGE];
                        details.status                      = [[dict objectForKey:_STATUS] intValue];
                        details.timestamp                   = [[dict objectForKey:TIMESTAMP] doubleValue];
                        details.tempId                      = [[dict objectForKey:TEMP_ID] intValue];
                        details.networkId                   = [[dict objectForKey:NETWORK_ID] intValue];
                        
                        [arrOrgDetails addObject:details];
                    }
                    
                    
                }
            }
        }
        
    }
    return arrOrgDetails;
}


#pragma mark --- Add Sub Organization ---

+ (WiSeCloudOrganizationResponse *) parseAddOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    WiSeCloudOrganizationResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudOrganizationResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response = [self appendBasicDetails:response andBasicResponse:statusResponse];
            
            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            response.organizationList             = [self getOrganizationDetailsListFromResponseData:[dictResponse objectForKey:DATA]];
            
        }
    }
    return response;

}

#pragma mark --- Edit Sub Organization ---

+ (WiSeCloudOrganizationResponse *) parseEditOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    return [self parseAddOrganizationAPIResponse:responseInfo];

}


#pragma mark --- Get Sub Organization ---

+ (WiSeCloudOrganizationResponse *) parseGetOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    WiSeCloudOrganizationResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response                              = [WiSeCloudOrganizationResponse new];
            WiSeCloudApiResponse * statusResponse = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];

            response                              = [self appendBasicDetails:response andBasicResponse:statusResponse];

            response.statusCode                   = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];

            NSDictionary * dict                   = [dictResponse objectForKey:DATA];
            dict                                  = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:ORG_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)]) {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:ORG_COUNT] intValue];
                    
                    if (totalCount > 0) {
                        response.organizationList      = [self getOrganizationDetailsListFromResponseData:[[dictResponse objectForKey:DATA] objectForKey:SUB_ORG_DETAILS]];
                        int orgCount                   = (int)response.organizationList.count;
                        response.remainingOrganization = totalCount - orgCount;
                    }
                }
                
            }
            
        }
    }
    return response;

}


#pragma mark --- Delete Sub Organization ---

+ (WiSeCloudOrganizationResponse *) parseDeleteOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    return [self parseAddOrganizationAPIResponse:responseInfo];
}


@end
