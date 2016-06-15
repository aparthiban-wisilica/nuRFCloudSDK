//
//  WiSeShutterUpdateAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 21/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeShutterUpdateAPI.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeShutterUpdateAPIRequest.h"
#import "WiSeShutterUpdateAPIResponse.h"
#import <WiSeAppLog/WiSeLogManager.h>

@implementation WiSeShutterUpdateAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

// Call API

- (WiSeCloudAPIRequestRegisteredDetails *)callShutterUpdateApiWithRequest:(WiSeShutterUpdateAPIRequest *)request {
    
    if (!request) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:ShutterUpdateInitErrorDomain withErrorDescription:ShutterUpdateInitErrorDescription withDomainCode:ShutterUpdateErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;
    }
    
    NSString * token = request.token?request.token:@"";
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    [objRequestBodyParams setValue:token forKey:TOKEN];
    
    NSDictionary * dict = [self createApiParametersWithRequest:request];
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@",serverIP,UrlShutterUpdateAndFetch];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_PUT withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:ShutterUpdateURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ShutterUpdate];
    
    return  [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    
}

- (NSDictionary *) createApiParametersWithRequest : (WiSeShutterUpdateAPIRequest *) request {
    
    NSString * strCloudId = [NSString stringWithFormat:@"%ld",(long)request.deviceCloudId];
    NSString * strRemoteId = [NSString stringWithFormat:@"%ld",(long)request.remoteId];
    request.values = request.values?request.values:@"";
    
    NSArray *keys = [NSArray arrayWithObjects:@"",REMOTE_ID,VALUES, nil];
    
    NSArray *objects = [NSArray arrayWithObjects:strCloudId,strRemoteId,request.values,nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }

    
    return nil;
}

#pragma mark - API Callbacks

- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(shutterUpdateFailedWithError:withRequestDetails:)]) {
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:ShutterUpdateErrorDomain  withErrorDescription:description withDomainCode:ShutterUpdateErrorCode];
        [self.delegate shutterUpdateFailedWithError:err withRequestDetails:request];
    }
    
    
}

- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    NSDictionary * dictResponse;
    if (dictResponse) { // True
        if ([[dictResponse objectForKey:RESPONSE_STATUS] boolValue]) { // True
            
            WiSeShutterUpdateAPIResponse * response = [WiSeShutterUpdateAPIResponse new];
            response.status = [[dictResponse objectForKey:STATUS] boolValue];
            response.message = [dictResponse objectForKey:MESSAGE];
            
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(shutterUpdateSuccessWithResponse:withRequestDetails:)]) {
                [self.delegate shutterUpdateSuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(shutterUpdateFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:ShutterUpdateErrorDomain  withErrorDescription:[dictResponse objectForKey:MESSAGE]withDomainCode:ShutterUpdateErrorCode];
                [self.delegate shutterUpdateFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(shutterUpdateFailedWithError:withRequestDetails:)]) {
            
            // Request Status
            request.requestStatus = RequestFailed;
            WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:ShutterUpdateErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:ShutterUpdateErrorCode];
            [self.delegate shutterUpdateFailedWithError:error withRequestDetails:request];
            
        }
        
    }
    
}


@end
