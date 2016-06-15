//
//  WiSeFriendsRequectAccept_RejectAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeFriendsRequestAccept_RejectAPI.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeFriendRequestAccept_RejectAPIRequest.h"
#import "WiSeFriendRequestAccept_RejectAPIResponse.h"
#import <WiSeAppLog/WiSeLogManager.h>

@implementation WiSeFriendsRequestAccept_RejectAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

- (WiSeCloudAPIRequestRegisteredDetails *) callFriendsRequestAccept_RejectApiWithRequest : (WiSeFriendRequestAccept_RejectAPIRequest *) request {
    
    if (!request) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:FriendsRequestAccept_RejectInitErrorDomain withErrorDescription:FriendsRequestAccept_RejectInitErrorDescription withDomainCode:FriendRequestAccept_RejectErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;
    }
    
    NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequest];
    
    NSDictionary * dict = [self createApiParametersWithRequest:request];
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@",serverIP,UrlFriendRequestAccept_Reject];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    WiSeCloudAPIRequestRegisteredDetails * status;
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_PUT withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:FriendsRequestAccept_RejectURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:FriendRequestAccept_Reject];
    
    return  status = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
}

- (NSDictionary *) createApiParametersWithRequest : (WiSeFriendRequestAccept_RejectAPIRequest *) request {
    request.token = request.token?request.token:@"";
    NSString *strFriendRequectAction = [NSString stringWithFormat:@"%d",request.friendRequestAction];
    NSString * strFriendId = [NSString stringWithFormat:@"%ld",(long)request.friendId];
    NSString * strMessageId = [NSString stringWithFormat:@"%ld",(long)request.messageId];
    
    NSArray *keys = [NSArray arrayWithObjects:TOKEN,ACCEPT_REJECT,FRIEND_ID,@"", nil];
    
    NSArray *objects = [NSArray arrayWithObjects:request.token,strFriendRequectAction,strFriendId,strMessageId,nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }

    return nil;
}

#pragma mark - API Callbacks

- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(friendsRequestAccept_RejectFailedWithError:withRequestDetails:)]) {
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:FriendsRequestAccept_RejectFailedErrorDomain  withErrorDescription:description withDomainCode:FriendRequestAccept_RejectErrorCode];
        [self.delegate friendsRequestAccept_RejectFailedWithError:err withRequestDetails:request];
    }
    
    
}

- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    NSDictionary * dictResponse;
    if (dictResponse) { // True
        
        if ([[dictResponse objectForKey:RESPONSE_STATUS] boolValue]) { // True
            
            WiSeFriendRequestAccept_RejectAPIResponse * response = [self parseDictResponse:dictResponse WithRequestDetails:request];
            
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(friendsRequestAccept_RejectSuccessWithResponse:withRequestDetails:)]) {
                [self.delegate friendsRequestAccept_RejectSuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(friendsRequestAccept_RejectFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:FriendsRequestAccept_RejectFailedErrorDomain  withErrorDescription:[dictResponse objectForKey:MESSAGE]withDomainCode:FriendRequestAccept_RejectErrorCode];
                [self.delegate friendsRequestAccept_RejectFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(friendsRequestAccept_RejectFailedWithError:withRequestDetails:)]) {
            
            // Request Status
            request.requestStatus = RequestFailed;
            WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:FriendsRequestAccept_RejectFailedErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:FriendRequestAccept_RejectErrorCode];
            [self.delegate friendsRequestAccept_RejectFailedWithError:error withRequestDetails:request];
            
        }
        
    }
    
}

// Parsing

- (WiSeFriendRequestAccept_RejectAPIResponse *) parseDictResponse : (NSDictionary *) dictResponse WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails {
    WiSeFriendRequestAccept_RejectAPIResponse * response = [WiSeFriendRequestAccept_RejectAPIResponse new];
    response.status = [[dictResponse objectForKey:STATUS] boolValue];
    response.messageId = [[dictResponse objectForKey:@""] intValue];
    response.message = [dictResponse objectForKey:MESSAGE];
    NSDictionary * dict = [dictResponse objectForKey:DATA];
    dict = [WiSeNetworkUtil replaceNullValues:dict];
    if (dict && [dict isKindOfClass:[NSDictionary class]]) {
        response.friendRequestAccept_RejectMessage = [dict objectForKey:MESSAGE];
        response.friendRequestAccept_RejectStatus = [[dict objectForKey:STATUS] intValue];
    }
    
    WiSeFriendRequestAccept_RejectAPIRequest * req = [requestDetails request];
    response.friendRequestAction = req.friendRequestAction;
    return response;
}

@end
