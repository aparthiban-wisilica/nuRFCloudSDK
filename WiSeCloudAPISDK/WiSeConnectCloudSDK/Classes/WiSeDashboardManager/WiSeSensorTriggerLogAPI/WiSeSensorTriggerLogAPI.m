//
//  WiSeSensorTriggerLogAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 17/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSensorTriggerLogAPI.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeSensorTriggerLogAPIRequest.h"
#import "WiSeSensorTriggerLogAPIResponse.h"
#import "WiSeSensorTriggerLogDetails.h"
#import "WiseSensorTriggerLogRequestDetails.h"
#import "WiSeParsedAPIResponse.h"
#import <WiSeAppLog/WiSeLogManager.h>

@implementation WiSeSensorTriggerLogAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

- (WiSeCloudAPIRequestRegisteredDetails *) callSensorTriggerLogApiWithRequest : (WiSeSensorTriggerLogAPIRequest *) request {
    
    if (!request) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerLogInitErrorDomain  withErrorDescription:SensorTriggerLogInitErrorDescription withDomainCode:NotificaitonStatusUpdateErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;

    }
    
    NSString * token = request.token?request.token:@"";
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    [objRequestBodyParams setValue:token forKey:TOKEN];
    
    NSDictionary * dict = [self createApiParameters:request];
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@",serverIP,UrlSensorTriggerLog];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    WiSeCloudAPIRequestRegisteredDetails * status;
    
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_POST withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:SensorTriggerLogURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:SensorTriggerLog];
    
    return  status = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    
}

-(NSDictionary*)createApiParameters:(WiSeSensorTriggerLogAPIRequest*)request
{
    
    NSString * strTrigger = [WiSeNetworkUtil convertDataToBase64StringWithData:request.trigger];
    strTrigger = strTrigger?strTrigger:@"";
    
    NSString * strPhoneDeviceId = [NSString stringWithFormat:@"%d",request.phoneCloudId];
    NSString * strSeqNumber = [NSString stringWithFormat:@"%d",request.sequenceNumber];
    strPhoneDeviceId = strPhoneDeviceId?strPhoneDeviceId:@"";
    
    NSString * strSensorId = [WiSeNetworkUtil convertMeshIdToBase64StringWithMeshId:request.sensorShortId];
    
    NSArray *keys = [NSArray arrayWithObjects:TRIGGER,PHONEID,SENSORID,SEQUENCENUMBER, nil];
    NSArray *objects = [NSArray arrayWithObjects:strTrigger,strPhoneDeviceId,strSensorId,strSeqNumber, nil];
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    return nil;
    
}

-(NSMutableArray*)createApiParameters1:(WiSeSensorTriggerLogAPIRequest*)request
{
    NSArray * arrTemp = request.wiseSensorTriggerLogRequestDetailsList;
    NSMutableArray * jsonArray = nil;
    if ([WiSeNetworkUtil isArrayValid:arrTemp]) {
        jsonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrTemp.count; i++) {
            WiseSensorTriggerLogRequestDetails * details = [WiseSensorTriggerLogRequestDetails new];
            if (details) {
                NSString * strTrigger = [WiSeNetworkUtil convertDataToBase64StringWithData:details.trigger];
                strTrigger = strTrigger?strTrigger:@"";
                
                NSString * strPhoneDeviceId = [NSString stringWithFormat:@"%d",request.phoneCloudId];
                NSString * strSeqNumber = [NSString stringWithFormat:@"%d",details.sequenceNumber];
                strPhoneDeviceId = strPhoneDeviceId?strPhoneDeviceId:@"";
                
                NSString * strSensorId = [WiSeNetworkUtil convertMeshIdToBase64StringWithMeshId:details.sensorShortId];
                
                NSArray *keys = [NSArray arrayWithObjects:TRIGGER,PHONEID,SENSORID,SEQUENCENUMBER, nil];
                NSArray *objects = [NSArray arrayWithObjects:strTrigger,strPhoneDeviceId,strSensorId,strSeqNumber, nil];
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [jsonArray addObject:jsonDictionary];
                }
                
            }
        }
    }
    
    return jsonArray;
    
}

#pragma mark - API Callback

// When request fail
- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sensorTriggerLogAPIFailedWithError:withRequestDetails:)]) {
        
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerLogFailedErrorDomain  withErrorDescription:description withDomainCode:SensorTriggerLogErrorCode];
        [self.delegate sensorTriggerLogAPIFailedWithError:err withRequestDetails:request];
    }
    
}

// When request is success
- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    
    
    WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:dataJSON];
    NSDictionary * dictResponse = (NSDictionary *) parseAPIRes.responseData;
    
    if (dictResponse) { // True
        dictResponse = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        int statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
        
        if (statusCode == SENSOR_TRIGGER_LOG_SUCCESSFULL ) { // True
            
            WiSeSensorTriggerLogAPIResponse * response = [self parseAddDeviceResponseWithDictResponse:dictResponse];
            
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(sensorTriggerLogAPISuccessWithResponse:withRequestDetails:)]) {
                [self.delegate sensorTriggerLogAPISuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(sensorTriggerLogAPIFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                
                NSString * strErrorDes = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];

                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerLogFailedErrorDomain  withErrorDescription:strErrorDes withDomainCode:statusCode];
                [self.delegate sensorTriggerLogAPIFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (parseAPIRes.error) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(sensorTriggerLogAPIFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                NSString * strErrorDes = parseAPIRes.error.localizedDescription;
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerLogFailedErrorDomain  withErrorDescription:strErrorDes withDomainCode:SensorTriggerLogErrorCode];
                [self.delegate sensorTriggerLogAPIFailedWithError:error withRequestDetails:request];
                
            }
        } else {
            if (self.delegate && [self.delegate respondsToSelector:@selector(sensorTriggerLogAPIFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerLogFailedErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:SensorTriggerLogErrorCode];
                [self.delegate sensorTriggerLogAPIFailedWithError:error withRequestDetails:request];
                
            }
        }
        
    }
    
}

// Parse Sensor Trigger Logs

//- (NSMutableArray *) parseSensorTriggerLogsFromDataArray : (NSArray *) dataArray {
//    NSMutableArray * arrSensorTriggerLogsList = [[NSMutableArray alloc] init];
//    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
//    
//    if (dataArray && [dataArray isKindOfClass:[NSArray class]]) {
//        
//        if (dataArray && dataArray.count) {
//            
//            for (int i = 0; i < dataArray.count; i++) {
//                
//                NSDictionary * dict = [dataArray objectAtIndex:i];
//                dict = [WiSeNetworkUtil replaceNullValues:dict];
//                
//                if (dict && [dict isKindOfClass:[NSDictionary class]]) {
//                    WiSeSensorTriggerLogDetails * details = [WiSeSensorTriggerLogDetails new];
//                    details.status = [[dict objectForKey:STATUS] boolValue];
//                    details.notificationStatus = [[dict objectForKey:NOTIFICATION_STATUS] boolValue];
//                    details.sensorCloudId = [[dict objectForKey:SENSOR_LONG_ID] intValue];
//                    details.message = [dict objectForKey:MESSAGE];
//                    
//                    [arrSensorTriggerLogsList addObject:details];
//                }
//                
//            }
//            
//        }
//
//    }
//    
//    return arrSensorTriggerLogsList;
//}

// Parsing

- (WiSeSensorTriggerLogAPIResponse *) parseAddDeviceResponseWithDictResponse : (NSDictionary *) dictResponse {
    
    WiSeSensorTriggerLogAPIResponse * response = [WiSeSensorTriggerLogAPIResponse new];
    response.statusMessage = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
    response.apiId = [[[dictResponse objectForKey:STATUS] objectForKey:API_ID] intValue];
    response.startTime = [WiSeNetworkUtil convertMillisencondsToDate:[[dictResponse objectForKey:STATUS] objectForKey:TIEM]];
    response.statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
    
    return response;
    
}



@end
