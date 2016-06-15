//
//  WiSeSensorTriggerIntervalSetAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 17/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>
#import "WiSeSensorTriggerIntervalSetAPI.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeSensorTriggerIntervalSetAPIRequest.h"
#import "WiSeSensorTriggerIntervalSetAPIResponse.h"
#import "WiSeSensorTriggerLogDetails.h"
#import "WiSeParsedAPIResponse.h"
#import <WiSeAppLog/WiSeLogManager.h>

@implementation WiSeSensorTriggerIntervalSetAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

- (WiSeCloudAPIRequestRegisteredDetails *) callSensorTriggerIntervalSetApiWithRequest : (WiSeSensorTriggerIntervalSetAPIRequest *) request {
    
    if (!request) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerIntervalSetInitErrorDomain withErrorDescription:SensorTriggerIntervalSetInitErrorDescription withDomainCode:SensorTriggerIntervalSetErrorCode];
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
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@",serverIP,UrlSensorTriggerIntervalSet];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    WiSeCloudAPIRequestRegisteredDetails * status;
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_POST withHeader:objRequestBodyParams withDictionaryRequestBody:dict withURLKey:SensorTriggerIntervalSetURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:SensorTriggerIntervalSet];
    
    return  status = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    
}

-(NSDictionary*)createApiParameters:(WiSeSensorTriggerIntervalSetAPIRequest *)request
{

    NSString * strTime = [WiSeNetworkUtil convertDataToBase64StringWithData:request.trigger];
    NSString * strPhoneDeviceId = [NSString stringWithFormat:@"%d",request.phoneCloudId];
    
    NSArray *keys = [NSArray arrayWithObjects:TRIGGER,PHONEID,nil];
    NSArray *objects = [NSArray arrayWithObjects:strTime,strPhoneDeviceId,nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    return nil;
}

#pragma mark - API Callback

// When request fail
- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sensorTriggerIntervalSetFailedWithError:withRequestDetails:)]) {
        
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerIntervalSetErrorDomain  withErrorDescription:description withDomainCode:SensorTriggerIntervalSetErrorCode];
        [self.delegate sensorTriggerIntervalSetFailedWithError:err withRequestDetails:request];
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
            
            WiSeSensorTriggerIntervalSetAPIResponse * response = [self parseDictResponse:dictResponse];
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(sensorTriggerIntervalSetSuccessWithResponse:withRequestDetails:)]) {
                [self.delegate sensorTriggerIntervalSetSuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(sensorTriggerIntervalSetFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                
                NSString * strMessage = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
                
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerIntervalSetErrorDomain  withErrorDescription:strMessage withDomainCode:statusCode];
                [self.delegate sensorTriggerIntervalSetFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (parseAPIRes.error) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(sensorTriggerIntervalSetFailedWithError:withRequestDetails:)]) {
                NSString * strErrorDes = parseAPIRes.error.localizedDescription;
                // Request Status
                request.requestStatus = RequestFailed;
                
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerIntervalSetErrorDomain  withErrorDescription:strErrorDes withDomainCode:SensorTriggerIntervalSetErrorCode];
                [self.delegate sensorTriggerIntervalSetFailedWithError:error withRequestDetails:request];
                
            }

        } else {
            if (self.delegate && [self.delegate respondsToSelector:@selector(sensorTriggerIntervalSetFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:SensorTriggerIntervalSetErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:SensorTriggerIntervalSetErrorCode];
                [self.delegate sensorTriggerIntervalSetFailedWithError:error withRequestDetails:request];
                
            }

        }
    }
    
}

// Parsing

- (WiSeSensorTriggerIntervalSetAPIResponse *) parseDictResponse : (NSDictionary *) dictResponse {
    
    WiSeSensorTriggerIntervalSetAPIResponse * response = [WiSeSensorTriggerIntervalSetAPIResponse new];
    response.statusMessage = [[dictResponse objectForKey:STATUS] objectForKey:STATUS_MESSAGE];
    response.apiId = [[[dictResponse objectForKey:STATUS] objectForKey:API_ID] intValue];
    response.startTime = [WiSeNetworkUtil convertMillisencondsToDate:[[dictResponse objectForKey:STATUS] objectForKey:TIEM]];
    response.statusCode = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
    
    return response;
    
}

// Parse Sensor Trigger Logs
//
//- (NSMutableArray *) parseSensorTriggerLogsFromDataArray : (NSArray *) dataArray {
//    NSMutableArray * arrSensorTriggerLogsList = [[NSMutableArray alloc] init];
//    
//    if (dataArray && dataArray.count) {
//        
//        for (int i = 0; i < dataArray.count; i++) {
//            
//            NSDictionary * dict = [dataArray objectAtIndex:i];
//            dict = [WiSeNetworkUtil replaceNullValues:dict];
//            
//            WiSeSensorTriggerLogDetails * details = [WiSeSensorTriggerLogDetails new];
//            details.status = [[dict objectForKey:STATUS] boolValue];
//            details.notificationStatus = [[dict objectForKey:NOTIFICATION_STATUS] boolValue];
//            details.sensorCloudId = [[dict objectForKey:SENSOR_LONG_ID] intValue];
//            details.message = [dict objectForKey:MESSAGE];
//            
//            [arrSensorTriggerLogsList addObject:details];
//            
//        }
//        
//    }
//    
//    return arrSensorTriggerLogsList;
//}
//


@end
