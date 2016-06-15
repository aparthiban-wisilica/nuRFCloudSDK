//
//  WiSeMakeMultiSensorAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 17/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeMakeMultiSensorAPI.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeMakeMultiSensorAPIRequest.h"
#import "WiSeMakeMultiSensorAPIResponse.h"
#import <WiSeAppLog/WiSeLogManager.h>

@implementation WiSeMakeMultiSensorAPI  {
    WiSeNetworkManager * wiseNetworkManager;
}

- (WiSeCloudAPIRequestRegisteredDetails *) callMakeMultiSensorApiWithRequest : (WiSeMakeMultiSensorAPIRequest *) request {
    
    if (!request) { // Check for nil
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:MakeMultiSensorInitErrorDomain  withErrorDescription:MakeMultiSensorInitErrorDescription withDomainCode:MakeMultiSensorErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;

    }
    
    NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequest];
    
    NSDictionary * dict = [self createAPIParameter:request];
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@%ld",serverIP,UrlMakeMultiSensor,(long)request.deviceCloudId];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    WiSeCloudAPIRequestRegisteredDetails * status;
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_PUT withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:MakeMultiSensorURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:MakeMultiSensor];
    
    return  status = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    
}


- (NSDictionary *) createAPIParameter : (WiSeMakeMultiSensorAPIRequest *) request {
    
    request.token = request.token?request.token:@"";
    NSString * strCallFor = [NSString stringWithFormat:@"%ld",(long)request.callFor];
    NSString * strItemType = [NSString stringWithFormat:@"%d",request.wiseItemType];
    NSString * strDeviceType = [NSString stringWithFormat:@"%ld",(long)request.deviceType];
    NSString * strOperationId = [NSString stringWithFormat:@"%d",request.operationId];
    NSString * strStutus = [NSString stringWithFormat:@"%ld",(long)request.status];
    NSString * strSeqNum = [NSString stringWithFormat:@"%d",request.sequenceNumber];
    NSString * strPhoneCloudId = [NSString stringWithFormat:@"%d",request.phoneCloudId];
    
    NSArray *keys;// = [NSArray arrayWithObjects:TOKEN,CALL_FOR,GRP_DVC,DEVICE_TYPE,OPERATION_ID,STATUS,SEQUENCE_NUM,PHONE_LONG_ID, nil];
    
    NSArray *objects = [NSArray arrayWithObjects:request.token,strCallFor,strItemType,strDeviceType,strOperationId,strStutus,strSeqNum,strPhoneCloudId,nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }

    return nil;
    
}

#pragma mark - API Callbacks

- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    if (self.delegate && [self.delegate respondsToSelector:@selector(makeMultiSensorFailedWithError:withRequestDetails:)]) {
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:MakeMultiSensorFailedErrorDomain  withErrorDescription:description withDomainCode:MakeMultiSensorErrorCode];
        // Request Status
//        request.requestStatus = RequestFailedToExecute;
        
        [self.delegate makeMultiSensorFailedWithError:err withRequestDetails:request];
    }
}


- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    NSDictionary * dictResponse;
    
    if (dictResponse) { // True
        if ([[dictResponse objectForKey:RESPONSE_STATUS] boolValue]) { // True
            
            WiSeMakeMultiSensorAPIResponse * response = [WiSeMakeMultiSensorAPIResponse new];
            response.sequenceNumber = [[dictResponse objectForKey:SEQUENCENUMBER] intValue];
            response.deviceCloudId = [[dictResponse objectForKey:ID] intValue];
            response.status = [[dictResponse objectForKey:STATUS] boolValue];
            response.message = [dictResponse objectForKey:MESSAGE];
            
            // Request Status
//            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(makeMultiSensorSuccessWithResponse:withRequestDetails:)]) {
                [self.delegate makeMultiSensorSuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(makeMultiSensorFailedWithError:withRequestDetails:)]) {
                
                // Request Status
//                request.requestStatus = RequestFailed;
                
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:MakeMultiSensorFailedErrorDomain  withErrorDescription:[dictResponse objectForKey:MESSAGE] withDomainCode:MakeMultiSensorErrorCode];
                [self.delegate makeMultiSensorFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(makeMultiSensorFailedWithError:withRequestDetails:)]) {
            
            // Request Status
//            request.requestStatus = RequestFailed;
            
            WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:MakeMultiSensorFailedErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:MakeMultiSensorErrorCode];
            [self.delegate makeMultiSensorFailedWithError:error withRequestDetails:request];
            
        }
        
    }
    
}


@end
