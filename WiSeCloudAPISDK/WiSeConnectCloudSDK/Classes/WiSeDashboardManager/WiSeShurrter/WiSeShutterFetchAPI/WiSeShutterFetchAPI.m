//
//  WiSeShutterFetchAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 21/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeShutterFetchAPI.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeShutterFetchAPIRequest.h"
#import "WiSeShutterFetchAPIResponse.h"
#import "WiSeShutterDetails.h"
#import <WiSeAppLog/WiSeLogManager.h>

@implementation WiSeShutterFetchAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

// Call API

- (WiSeCloudAPIRequestRegisteredDetails *)callShutterFetchApiWithRequest:(WiSeShutterFetchAPIRequest *)request {
 
    if (!request) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:ShutterFetchInitErrorDomain withErrorDescription:ShutterFetchInitErrorDescription withDomainCode:ShutterFetchErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;

    }
    
    NSString * token = request.token?request.token:@"";
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    [objRequestBodyParams setValue:token forKey:TOKEN];
    
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@",serverIP,UrlShutterUpdateAndFetch];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_GET withHeader:objRequestBodyParams withDictionaryRequestBody:nil withURLKey:ShutterFetchURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ShutterFetch];
    
    return  [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    
}

#pragma mark - API Callbacks

- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(shutterFetchFailedWithError:withRequestDetails:)]) {
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:ShutterFetchErrorDomain  withErrorDescription:description withDomainCode:ShutterFetchErrorCode];
        [self.delegate shutterFetchFailedWithError:err withRequestDetails:request];
    }
    
    
}

- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    NSDictionary * dictResponse;
    if (dictResponse) { // True
        if ([[dictResponse objectForKey:RESPONSE_STATUS] boolValue]) { // True
            
            WiSeShutterFetchAPIResponse * response = [WiSeShutterFetchAPIResponse new];
            response.status = [[dictResponse objectForKey:STATUS] boolValue];
            response.shutterDetailsList = [self parseShutterDetailsFromShutterData:[dictResponse objectForKey:SHUTTER_DATA]];
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(shutterFetchSuccessWithResponse:withRequestDetails:)]) {
                [self.delegate shutterFetchSuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(shutterFetchFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:ShutterFetchErrorDomain  withErrorDescription:[dictResponse objectForKey:MESSAGE]withDomainCode:ShutterFetchErrorCode];
                [self.delegate shutterFetchFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(shutterFetchFailedWithError:withRequestDetails:)]) {
            
            // Request Status
            request.requestStatus = RequestFailed;
            WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:ShutterFetchErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:ShutterFetchErrorCode];
            [self.delegate shutterFetchFailedWithError:error withRequestDetails:request];
            
        }
        
    }
    
}

// Parsing shutter response

- (NSMutableArray *) parseShutterDetailsFromShutterData : (NSArray *) shutterData{
    
    NSMutableArray * shutterDetails = [[NSMutableArray alloc] init];
    
    shutterData = [WiSeNetworkUtil replaceNullValues:shutterData];
    
    if (shutterData && [shutterData isKindOfClass:[NSArray class]]) {
        if (shutterData && shutterData.count) {
            
            for (int i = 0 ; i < shutterData.count; i++) {
                
                WiSeShutterDetails * detatils = [WiSeShutterDetails new];
                NSDictionary * dict = [shutterData objectAtIndex:i];
                dict = [WiSeNetworkUtil replaceNullValues:dict];
                
                if (dict && [dict isKindOfClass:[NSDictionary class]]) {
                    detatils.deviceCloudId = [[dict objectForKey:@""] intValue];
                    detatils.remoteId = [[dict objectForKey:REMOTE_ID] intValue];
                    detatils.slot = [[dict objectForKey:SLOT] intValue];
                    
                    [shutterDetails addObject:detatils];
                    
                } 
            }
            
        }

    }
    
    return shutterDetails;
    
}

@end
