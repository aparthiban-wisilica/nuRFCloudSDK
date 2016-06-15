//
//  WiSeShareAccept_RejectAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeShareAccept_RejectAPI.h"
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

#import "WiSeShareAccept_RejectAPIRequest.h"
#import "WiSeShareAccept_RejectAPIResponse.h"

#import <WiSeAppLog/WiSeLogManager.h>


@implementation WiSeShareAccept_RejectAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

- (WiSeCloudAPIRequestRegisteredDetails *)callShareAccept_RejectApiWithRequest:(WiSeShareAccept_RejectAPIRequest *)request {
    if (!request) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:ShareAccept_RejectInitErrorDomain withErrorDescription:ShareAccept_RejectInitErrorDescription withDomainCode:ShareAccept_RejectErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;
    }
    
    NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequest];
    
    NSDictionary * dict = [self createApiParametersWithRequest:request];
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@%ld",serverIP,UrlShareAccept_Reject,(long)request.device_Group_CloudId];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    WiSeCloudAPIRequestRegisteredDetails * status;
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_PUT withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:ShareAccept_RejectURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:ShareAccept_Reject];
    
    return  status = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
}

- (NSDictionary *) createApiParametersWithRequest : (WiSeShareAccept_RejectAPIRequest *) request {
    request.token = request.token?request.token:@"";
    NSString *strShareAction = [NSString stringWithFormat:@"%d",request.shareAction];
    NSString * strShareUserId = [NSString stringWithFormat:@"%ld",(long)request.shareUserId];
    NSString * strMessageId = [NSString stringWithFormat:@"%ld",(long)request.messageId];
    NSString * strItemType = [NSString stringWithFormat:@"%d",request.wiseItemType];
    
    NSArray *keys = [NSArray arrayWithObjects:TOKEN,ACPT_REJECT,SHARE_USER,@"",GRP_DVC, nil];
    
    NSArray *objects = [NSArray arrayWithObjects:request.token,strShareAction,strShareUserId,strMessageId,strItemType,nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    
    return nil;
}

#pragma mark - API Callbacks

- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareAccept_RejectFailedWithError:withRequestDetails:)]) {
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:ShareAccept_RejectFailedErrorDomain  withErrorDescription:description withDomainCode:ShareAccept_RejectErrorCode];
        [self.delegate shareAccept_RejectFailedWithError:err withRequestDetails:request];
    }
    
    
}

- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    NSDictionary * dictResponse;
    if (dictResponse) { // True
        
        if ([[dictResponse objectForKey:RESPONSE_STATUS] boolValue]) { // True
            
            WiSeShareAccept_RejectAPIResponse * response = [self parseDictResponse:dictResponse WithRequestDetails:request];
            
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(shareAccept_RejectSuccessWithResponse:withRequestDetails:)]) {
                [self.delegate shareAccept_RejectSuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(shareAccept_RejectFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:ShareAccept_RejectFailedErrorDomain  withErrorDescription:[dictResponse objectForKey:MESSAGE]withDomainCode:ShareAccept_RejectErrorCode];
                [self.delegate shareAccept_RejectFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(shareAccept_RejectFailedWithError:withRequestDetails:)]) {
            
            // Request Status
            request.requestStatus = RequestFailed;
            WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:ShareAccept_RejectFailedErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:ShareAccept_RejectErrorCode];
            [self.delegate shareAccept_RejectFailedWithError:error withRequestDetails:request];
            
        }
        
    }
    
}

// Parsing

- (WiSeShareAccept_RejectAPIResponse *) parseDictResponse : (NSDictionary *) dictResponse WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails {
    WiSeShareAccept_RejectAPIResponse * response = [WiSeShareAccept_RejectAPIResponse new];
    response.message = [dictResponse objectForKey:MESSAGE];
    response.notificationStatus = [dictResponse objectForKey:NOTIFICATION_STATUS];
    
    NSDictionary * dict = [dictResponse objectForKey:DATA];
    dict = [WiSeNetworkUtil replaceNullValues:dict];
    if (dict && [dict isKindOfClass:[NSDictionary class]]) {
        response.actionMessage = [dict objectForKey:MESSAGE];
        response.count = [[dict objectForKey:COUNT] intValue];
    }
    
    WiSeShareAccept_RejectAPIRequest * req = [requestDetails request];
    response.shareAction = req.shareAction;
    return response;
}


@end
