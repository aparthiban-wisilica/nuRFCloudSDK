//
//  WiSeShareCreate.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeShareCreateAPI.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeShareCreateAPIRequest.h"
#import "WiSeShareCreateAPIResponse.h"
#import "WiSeShareCreateDetails.h"
#import "WiSeCreatedSharesDetails.h"
#import <WiSeAppLog/WiSeLogManager.h>

@implementation WiSeShareCreateAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

// Call API

- (WiSeCloudAPIRequestRegisteredDetails *)callCreateShareApiWithRequest:(WiSeShareCreateAPIRequest *)request {
    if (!request) { // Check for nil
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:CreateShareInitErrorDomain  withErrorDescription:CreateShareInitErrorDescription withDomainCode:CreateShareErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;
        
    }
    
    NSString * token = request.token?request.token:@"";
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    [objRequestBodyParams setValue:token forKey:TOKEN];
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@",serverIP,UrlCreateShare];
    
    NSArray * arr = [self createApiParameters:request];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    WiSeCloudAPIRequestRegisteredDetails * status;
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_POST withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:CreateShareURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:CreateShare];
    
    return  status = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
}

// Create body
-(NSMutableArray*)createApiParameters:(WiSeShareCreateAPIRequest *)request
{
    NSArray * arrOfShareDetails = request.shareCreateDetails; // Get arr of Friends IDs
    NSMutableArray * jsonArray = [[NSMutableArray alloc] init];
    
    if ([arrOfShareDetails isKindOfClass:[NSArray class]]) {
        if (arrOfShareDetails && arrOfShareDetails.count) {
            for (int i = 0; i < arrOfShareDetails.count; i++) {
                
                WiSeShareCreateDetails * details = [arrOfShareDetails objectAtIndex:i];
              
                if (details) {
                    if (details.wiseItemType == WiseItem) {
                        details.deviceCloudId = 0;
                    }else if (details.wiseItemType == WiseSubItem) {
                        details.groupdCloudId = 0;
                    }else {
                        details.deviceCloudId = 0;
                        details.groupdCloudId = 0;
                    }
                    
                    NSString * strFriendId = [NSString stringWithFormat:@"%ld",(long)details.friendId];
                    NSString * strWiseItemType = [NSString stringWithFormat:@"%d",details.wiseItemType];
                    NSString * strdeviceCloudId = [NSString stringWithFormat:@"%ld",(long)details.deviceCloudId];
                    NSString * strGroupId = [NSString stringWithFormat:@"%ld",(long)details.groupdCloudId];
                    
                    NSArray *keys = [NSArray arrayWithObjects: SUB_USER_ID,GRP_DVC,@"",DEVICEID, nil];
                    
                    NSArray *objects = [NSArray arrayWithObjects:strFriendId,strWiseItemType,strGroupId,strdeviceCloudId,nil];
                    
                    if (keys.count == objects.count) {
                        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                        [jsonArray addObject:jsonDictionary];
                    }

                }
                
            }
        }
    }
    
    return jsonArray;
}

#pragma mark - API Callbacks

- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    if (self.delegate && [self.delegate respondsToSelector:@selector(createShareFailedWithError:withRequestDetails:)]) {
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:CreateShareFailedErrorDomain  withErrorDescription:description withDomainCode:CreateShareErrorCode];
        [self.delegate createShareFailedWithError:err withRequestDetails:request];
    }
}

- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    NSDictionary * dictResponse;
    
    if (dictResponse) { // True
        if ([[dictResponse objectForKey:RESPONSE_STATUS] boolValue]) { // True
            
            WiSeShareCreateAPIResponse * response = [self parseShareCreateResponseWithDictResponse:dictResponse];
            
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(createShareSuccessWithResponse:withRequestDetails:)]) {
                [self.delegate createShareSuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(createShareFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:CreateShareFailedErrorDomain  withErrorDescription:[dictResponse objectForKey:MESSAGE] withDomainCode:CreateShareErrorCode];
                [self.delegate createShareFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(createShareFailedWithError:withRequestDetails:)]) {
            
            // Request Status
            request.requestStatus = RequestFailed;
            WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:CreateShareFailedErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:CreateShareErrorCode];
            [self.delegate createShareFailedWithError:error withRequestDetails:request];
            
        }
        
    }
    
}

// Parsing

- (WiSeShareCreateAPIResponse *) parseShareCreateResponseWithDictResponse : (NSDictionary *) dictResponse {
    
    WiSeShareCreateAPIResponse * response = [WiSeShareCreateAPIResponse new];
    response.status = [[dictResponse objectForKey:RESPONSE_STATUS] boolValue];
    response.message = [dictResponse objectForKey:MESSAGE];
    response.notificationMessage = [dictResponse objectForKey:NOTIFICATION_STATUS];
    response.createdSharesDetails = [self getCreatedSharedList:[dictResponse objectForKey:DATA]];
    return response;
    
}

// Get Created Shared Details in Array
- (NSMutableArray *) getCreatedSharedList : (NSArray *) dataArray {
    NSMutableArray * arrCreatedSharedList = [[NSMutableArray alloc] init];
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    if (dataArray && [dataArray isKindOfClass:[NSArray class]]) {
        if (dataArray.count) {
            for (int i =0 ; i < dataArray.count; i++) {
                NSDictionary * dict = [dataArray objectAtIndex:i];
                dict = [WiSeNetworkUtil replaceNullValues:dict];
                if (dict && [dict isKindOfClass:[NSDictionary class]]) {
                    WiSeCreatedSharesDetails * details = [WiSeCreatedSharesDetails new];
                    NSInteger intItemType =  [[dict objectForKey:GROUP_DEVICE] intValue];
                    if (intItemType == WiseItem) {
                        details.wiseItemType = WiseItem;
                    }else if (intItemType == WiseSubItem) {
                        details.wiseItemType = WiseSubItem;
                    }
                    details.friendId = [[dict objectForKey:SUB_USER_ID] intValue];
                    details.message = [dict objectForKey:MESSAGE];
                    details.sharedId = [[dict objectForKey:ID] intValue];
                    [arrCreatedSharedList addObject:details];
                }
            }
        }
    }
    return arrCreatedSharedList;
}

@end
