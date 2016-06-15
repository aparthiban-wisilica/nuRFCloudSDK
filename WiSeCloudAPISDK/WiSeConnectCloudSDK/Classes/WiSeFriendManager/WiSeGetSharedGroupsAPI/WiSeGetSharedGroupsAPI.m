//
//  WiSeGetSharedGroupsAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeGetSharedGroupsAPI.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeGetSharedGroupsAPIRequest.h"
#import "WiSeGetSharedGroupsAPIResponse.h"
#import "WiSeSharedGroupDetails.h"
#import <WiSeAppLog/WiSeLogManager.h>

#define Group @"1"

@implementation WiSeGetSharedGroupsAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

// API Call

- (WiSeCloudAPIRequestRegisteredDetails *)callGetSharedGroupsApiWithRequest:(WiSeGetSharedGroupsAPIRequest *)request {
    
    if (!request) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:GetSharedGroupsInitErrorDomain withErrorDescription:GetSharedGroupsInitErrorDescription withDomainCode:GetSharedGroupsErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;
        
    }
    
    NSString * token = request.token?request.token:@"";
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    [objRequestBodyParams setValue:token forKey:TOKEN];
    [objRequestBodyParams setValue:Group forKey:CHECK];
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@",serverIP,UrlGetSharedGroups];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    WiSeCloudAPIRequestRegisteredDetails * status;
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_GET withHeader:objRequestBodyParams withDictionaryRequestBody:nil withURLKey:GetSharedGroupsURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetSharedGroups];
    
    return  status = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
}

#pragma mark - API Callbacks

- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(getSharedGroupsFailedWithError:withRequestDetails:)]) {
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:GetSharedGroupsFailedErrorDomain  withErrorDescription:description withDomainCode:GetSharedGroupsErrorCode];
        [self.delegate getSharedGroupsFailedWithError:err withRequestDetails:request];
    }
    
}

- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    NSDictionary * dictResponse;
    if (dictResponse) { // True
        if ([[dictResponse objectForKey:RESPONSE_STATUS] boolValue]) { // True
            
            WiSeGetSharedGroupsAPIResponse * response = [self getSharedGroupsResponseFromDictResponse:dictResponse];
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(getSharedGroupsSuccessWithResponse:withRequestDetails:)]) {
                [self.delegate getSharedGroupsSuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(getSharedGroupsFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:GetSharedGroupsFailedErrorDomain  withErrorDescription:[dictResponse objectForKey:MESSAGE]withDomainCode:GetSharedGroupsErrorCode];
                [self.delegate getSharedGroupsFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(getSharedGroupsFailedWithError:withRequestDetails:)]) {
            
            // Request Status
            request.requestStatus = RequestFailed;
            WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:GetSharedGroupsFailedErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:GetSharedGroupsErrorCode];
            [self.delegate getSharedGroupsFailedWithError:error withRequestDetails:request];
            
        }
        
    }
    
}

- (WiSeGetSharedGroupsAPIResponse *) getSharedGroupsResponseFromDictResponse : (NSDictionary *) dictResponse {
    WiSeGetSharedGroupsAPIResponse * response = [WiSeGetSharedGroupsAPIResponse new];
    response.status = [[dictResponse objectForKey:STATUS] boolValue];
    response.message = [dictResponse objectForKey:MESSAGE];
    response.sharedGroupsDetailsList = [self getSharedGroupsListFromDataArray:[dictResponse objectForKey:DATA]];
    return response;
}

- (NSMutableArray *) getSharedGroupsListFromDataArray : (NSArray *) dataArray {
    NSMutableArray * arrSharedGroupsList = [[NSMutableArray alloc] init];
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    if (dataArray && [dataArray isKindOfClass:[NSArray class]]) {
        for (int i = 0; i < dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            if (dict && [dict isKindOfClass:[NSDictionary class]]) {
                WiSeSharedGroupDetails * details = [WiSeSharedGroupDetails new];
                details.groupName = [dict objectForKey:WISE_GROUP_NAME];
                details.groupIconCloudId = [[dict objectForKey:WISE_GROUP_ICON_ID] intValue];
                details.groupCloudId = [[dict objectForKey:@""] intValue];
                details.lastUpdated = [WiSeNetworkUtil getFormattedDateFromString:[dict objectForKey:LAST_UPDATED]];
                details.iconUrl = [dict objectForKey:ICON_URL];
                [arrSharedGroupsList addObject:details];
            }
        }
    }
    return arrSharedGroupsList;
}

@end
