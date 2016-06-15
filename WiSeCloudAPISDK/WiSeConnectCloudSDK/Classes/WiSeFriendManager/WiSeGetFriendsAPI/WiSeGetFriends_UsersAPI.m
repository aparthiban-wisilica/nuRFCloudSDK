//
//  WiSeGetFriendsAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeGetFriends_UsersAPI.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeGetFriends_UsersAPIRequest.h"
#import "WiSeGetFriends_UsersAPIResponse.h"
#import "WiSeFriendsDetails.h"
#import <WiSeAppLog/WiSeLogManager.h>

@implementation WiSeGetFriends_UsersAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

 // API Call

- (WiSeCloudAPIRequestRegisteredDetails *)callGetFriends_UsersApiWithRequest:(WiSeGetFriends_UsersAPIRequest *)request {
    
    if (!request) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:GetFriend_UsersInitErrorDomain withErrorDescription:GetFriend_UsersInitErrorDescription withDomainCode:GetFriendsErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;
        
    }
    
    NSString * token = request.token?request.token:@"";
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    [objRequestBodyParams setValue:token forKey:TOKEN];
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@%d",serverIP,UrlGetFriends,request.listType];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    WiSeCloudAPIRequestRegisteredDetails * status;
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_GET withHeader:objRequestBodyParams withDictionaryRequestBody:nil withURLKey:GetFriend_UsersURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetFriends];
    
    return  status = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
}

#pragma mark - API Callbacks

- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(getFriends_UsersFailedWithError:withRequestDetails:)]) {
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:GetConfiguredBeaconFailedErrorDomain  withErrorDescription:description withDomainCode:GetBeaconErrorCode];
        [self.delegate getFriends_UsersFailedWithError:err withRequestDetails:request];
    }
    
}

- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    NSDictionary * dictResponse;
    if (dictResponse) { // True
        if ([[dictResponse objectForKey:RESPONSE_STATUS] boolValue]) { // True
            
            WiSeGetFriends_UsersAPIResponse * response = [self getFriend_UsersAPIResponseFromDictResponse:dictResponse WithRequestDetails:request];
            
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(getFriends_UsersSuccessWithResponse:withRequestDetails:)]) {
                [self.delegate getFriends_UsersSuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(getFriends_UsersFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:GetConfiguredBeaconFailedErrorDomain  withErrorDescription:[dictResponse objectForKey:MESSAGE]withDomainCode:GetConfiguredBeaconErrorCode];
                [self.delegate getFriends_UsersFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(getFriends_UsersFailedWithError:withRequestDetails:)]) {
            
            // Request Status
            request.requestStatus = RequestFailed;
            WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:GetConfiguredBeaconFailedErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:GetConfiguredBeaconErrorCode];
            [self.delegate getFriends_UsersFailedWithError:error withRequestDetails:request];
            
        }
        
    }
    
}

- (WiSeGetFriends_UsersAPIResponse *) getFriend_UsersAPIResponseFromDictResponse : (NSDictionary *) dictResponse  WithRequestDetails : (WiSeCloudAPIRequestDetails *) request{
    WiSeGetFriends_UsersAPIResponse * response = [WiSeGetFriends_UsersAPIResponse new];
    response.status = [[dictResponse objectForKey:STATUS] boolValue];
    response.message = [dictResponse objectForKey:MESSAGE];
    response.friendsDetailsList = [self getFriendDetailsListFromDataArray:[dictResponse objectForKey:DATA]];
    WiSeGetFriends_UsersAPIRequest * req = [request request];
    response.listType = req.listType;
    return response;
}

- (NSMutableArray *) getFriendDetailsListFromDataArray : (NSArray *) dataArray {
    NSMutableArray * arrFriendDetailsList = [[NSMutableArray alloc] init];
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    if (dataArray ) {
        if ([dataArray isKindOfClass:[NSArray class]] && dataArray.count) {
            for (int i = 0; i < dataArray.count; i++) {
                NSDictionary * dict = [dataArray objectAtIndex:i];
                dict = [WiSeNetworkUtil replaceNullValues:dict];
                if (dict && [dict isKindOfClass:[NSDictionary class]]) {
                    WiSeFriendsDetails * details = [WiSeFriendsDetails new];
                    details.userId = [[dict objectForKey:USER_ID] intValue];
                    details.userName = [dict objectForKey:USER_NAME];
                    details.userDisplayName = [dict objectForKey:USER_DISPLAY_NAME];
                    [arrFriendDetailsList addObject:details];
                }
            }
        }
    }
    return arrFriendDetailsList;
}


@end
