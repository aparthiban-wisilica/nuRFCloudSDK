//
//  WiSeAddFriendAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAddFriendAPI.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeAddFriendAPIRequest.h"
#import "WiSeAddFriendAPIResponse.h"
#import "WiSeAddedFriendsDetails.h"

#import <WiSeAppLog/WiSeLogManager.h>

@implementation WiSeAddFriendAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

// Call API

- (WiSeCloudAPIRequestRegisteredDetails *)callAddDeviceApiWithRequest:(WiSeAddFriendAPIRequest *)request {
    
    if (!request) { // Check for nil
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:AddFriendInitErrorDomain  withErrorDescription:AddFriendInitErrorDescription withDomainCode:AddFriendsErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;
        
    }
    
    NSString * token = request.token?request.token:@"";
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    [objRequestBodyParams setValue:token forKey:TOKEN];
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@",serverIP,UrlAddFriends];
    
    NSArray * arr = [self createApiParameters:request];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    WiSeCloudAPIRequestRegisteredDetails * status;
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_POST withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddFriendURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddFriends];
    
    return  status = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
}

// Create body
-(NSMutableArray*)createApiParameters:(WiSeAddFriendAPIRequest *)request
{
    NSArray * arrOfFriendIds = request.friendsIds; // Get arr of Friends IDs
    NSMutableArray * jsonArray = [[NSMutableArray alloc] init];
    
    if ([arrOfFriendIds isKindOfClass:[NSArray class]]) {
        if (arrOfFriendIds && arrOfFriendIds.count) {
            for (int i = 0; i < arrOfFriendIds.count; i++) {
                NSString * friendId = [[arrOfFriendIds objectAtIndex:i] stringValue];
                friendId = friendId?friendId:@"";
                
                NSArray *keys = [NSArray arrayWithObjects: FRIEND_ID, nil];
                
                NSArray *objects = [NSArray arrayWithObjects:friendId,nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary];
                }

            }
        }
    }

    return jsonArray;
}

#pragma mark - API Callbacks

- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    if (self.delegate && [self.delegate respondsToSelector:@selector(addFriendFailedWithError:withRequestDetails:)]) {
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:AddFriendFailedErrorDomain  withErrorDescription:description withDomainCode:AddFriendsErrorCode];
        [self.delegate addFriendFailedWithError:err withRequestDetails:request];
    }
}

- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    NSDictionary * dictResponse;
    
    if (dictResponse) { // True
        if ([[dictResponse objectForKey:RESPONSE_STATUS] boolValue]) { // True
            
            WiSeAddFriendAPIResponse * response = [self parseAddDeviceResponseWithDictResponse:dictResponse];
            
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(addFriendSuccessWithResponse:withRequestDetails:)]) {
                [self.delegate addFriendSuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(addFriendFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:AddFriendFailedErrorDomain  withErrorDescription:[dictResponse objectForKey:MESSAGE] withDomainCode:AddFriendsErrorCode];
                [self.delegate addFriendFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(addFriendFailedWithError:withRequestDetails:)]) {
            
            // Request Status
            request.requestStatus = RequestFailed;
            WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:AddFriendFailedErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:AddFriendsErrorCode];
            [self.delegate addFriendFailedWithError:error withRequestDetails:request];
            
        }
        
    }
    
}

// Parsing

- (WiSeAddFriendAPIResponse *) parseAddDeviceResponseWithDictResponse : (NSDictionary *) dictResponse {
    
    WiSeAddFriendAPIResponse * response = [WiSeAddFriendAPIResponse new];
    response.status = [[dictResponse objectForKey:RESPONSE_STATUS] boolValue];
    response.message = [dictResponse objectForKey:MESSAGE];
    response.addedFriendsDetails = [self getAddedDeviceDetailsListWithDataArray:[dictResponse objectForKey:DATA]];
    return response;
    
}

// Parsing added device details

- (NSMutableArray *) getAddedDeviceDetailsListWithDataArray : (NSArray *) dataArray  {
    
    NSMutableArray * arrAddedDeviceDetails = [[NSMutableArray alloc] init];
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    
    if (dataArray && [dataArray isKindOfClass:[NSArray class]]) {
        
        if (dataArray && dataArray.count) {
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary * dict = [dataArray objectAtIndex:i];
                dict = [WiSeNetworkUtil replaceNullValues:dict];
                if (dict && [dict isKindOfClass:[NSDictionary class]]) {
                    WiSeAddedFriendsDetails * details = [WiSeAddedFriendsDetails new];
                    details.friendId = [[dict objectForKey:FRIEND_ID] intValue];
                    details.status = [[dict objectForKey:STATUS] intValue];
                    details.message = [dict objectForKey:MESSAGE];
                    details.notificationStatus = [dict objectForKey:NOTIFICATION_STATUS];
                    [arrAddedDeviceDetails addObject:details];
                }
            }
            
        }
        
    }
    
    return arrAddedDeviceDetails;
    
}



@end
