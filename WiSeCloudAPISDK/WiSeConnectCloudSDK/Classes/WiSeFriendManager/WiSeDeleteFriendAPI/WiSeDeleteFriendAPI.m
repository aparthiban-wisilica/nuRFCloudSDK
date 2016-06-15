//
//  WiSeDeleteFriendAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeDeleteFriendAPI.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeDeleteFriendAPIRequest.h"
#import "WiSeDeleteFriendAPIResponse.h"
#import <WiSeAppLog/WiSeLogManager.h>

@implementation WiSeDeleteFriendAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

- (WiSeCloudAPIRequestRegisteredDetails *)callDeleteFriendApiWithRequest:(WiSeDeleteFriendAPIRequest *)request {
    if (!request) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:DeleteFriendInitErrorDomain withErrorDescription:DeleteFriendInitErrorDescription withDomainCode:DeleteFriendErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;
        
    }
    
    NSString * token = request.token?request.token:@"";
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    [objRequestBodyParams setValue:token forKey:TOKEN];
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@%ld",serverIP,UrlDeleteFriends,(long)request.friendId];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_DELETE withHeader:objRequestBodyParams withDictionaryRequestBody:nil withURLKey:DeleteFriendURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:DeleteFriend];
    
    return  [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
}

#pragma mark - API Callbacks

- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(deleteFriendAPIFailedWithError:withRequestDetails:)]) {
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:DeleteFriendFailedErrorDomain  withErrorDescription:description withDomainCode:DeleteFriendErrorCode];
        [self.delegate deleteFriendAPIFailedWithError:err withRequestDetails:request];
    }
    
    
}

- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    NSDictionary * dictResponse;
    if (dictResponse) { // True
        if ([[dictResponse objectForKey:RESPONSE_STATUS] boolValue]) { // True
            
            WiSeDeleteFriendAPIResponse * response = [self parseDictResponse:dictResponse];
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(deleteFriendAPISuccessWithResponse:withRequestDetails:)]) {
                [self.delegate deleteFriendAPISuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(deleteFriendAPIFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:DeleteFriendFailedErrorDomain  withErrorDescription:[dictResponse objectForKey:MESSAGE]withDomainCode:DeleteFriendErrorCode];
                [self.delegate deleteFriendAPIFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(deleteFriendAPIFailedWithError:withRequestDetails:)]) {
            
            // Request Status
            request.requestStatus = RequestFailed;
            WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:DeleteFriendFailedErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:DeleteFriendErrorCode];
            [self.delegate deleteFriendAPIFailedWithError:error withRequestDetails:request];
            
        }
        
    }
    
}

- (WiSeDeleteFriendAPIResponse *) parseDictResponse : (NSDictionary *) dictResponse {
    WiSeDeleteFriendAPIResponse * response = [WiSeDeleteFriendAPIResponse new];
    response.status = [[dictResponse objectForKey:RESPONSE_STATUS] boolValue];
    response.message = [dictResponse objectForKey:MESSAGE];
    NSArray * arr = [dictResponse objectForKey:DATA];
    if (arr && [arr isKindOfClass:[NSArray class]]) {
        NSDictionary * dict = [arr objectAtIndex:0];
        dict = [WiSeNetworkUtil replaceNullValues:dict];
        if (dict && [dict isKindOfClass:[NSDictionary class]] ) {
            response.friendId = [[dict objectForKey:FRIEND_ID] intValue];
            response.friendDetailStatus = [[dict objectForKey:STATUS] intValue];
            response.friendDeatilsMessage = [dict objectForKey:MESSAGE];
        }
    }
    return response;
}

@end
