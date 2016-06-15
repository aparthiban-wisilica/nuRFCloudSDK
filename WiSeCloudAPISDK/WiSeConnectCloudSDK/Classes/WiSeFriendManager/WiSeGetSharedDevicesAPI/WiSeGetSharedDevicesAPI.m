//
//  WiSeGetSharedDevicesAPI.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeGetSharedDevicesAPI.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeGetSharedDevicesAPIRequest.h"
#import "WiSeGetSharedDevicesAPIResponse.h"
#import "WiSeDashBoardSubItems.h"
#import <WiSeAppLog/WiSeLogManager.h>

#define Device @"2"

@implementation WiSeGetSharedDevicesAPI {
    WiSeNetworkManager * wiseNetworkManager;
}

// API Call

- (WiSeCloudAPIRequestRegisteredDetails *)callGetSharedDevicesApiWithRequest:(WiSeGetSharedDevicesAPIRequest *)request {
    
    if (!request) {
        WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:GetSharedDevicesInitErrorDomain withErrorDescription:GetSharedDevicesInitErrorDescription withDomainCode:GetSharedDevicesErrorCode];
        WiSeLogInfo(@"%@",error);
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;
        
    }
    
    NSString * token = request.token?request.token:@"";
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    [objRequestBodyParams setValue:token forKey:TOKEN];
    [objRequestBodyParams setValue:Device forKey:CHECK];
    
    NSString * strURL = [NSString stringWithFormat:@"%@%@%ld",serverIP,UrlGetSharedDevices,(long)request.groupCloudId];
    
    wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
    WiSeCloudAPIRequestRegisteredDetails * status;
    WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:REQUEST_METHOD_GET withHeader:objRequestBodyParams withDictionaryRequestBody:nil withURLKey:GetSharedDevicesURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetSharedDevices];
    
    return  status = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
}

#pragma mark - API Callbacks

- (void)apiRequestFailedWithError:(WiSeAppError *)error withResponse:(NSDictionary *)dictResponse withJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(getSharedDevicesFailedWithError:withRequestDetails:)]) {
        // Request Status
        request.requestStatus = RequestFailedToExecute;
        NSString *description = [NSString stringWithFormat:@"%@",error.localizedDescription];
        WiSeAppError * err = [WiSeNetworkUtil getErrorWithDomainName:GetSharedDevicesFailedErrorDomain  withErrorDescription:description withDomainCode:GetSharedDevicesErrorCode];
        [self.delegate getSharedDevicesFailedWithError:err withRequestDetails:request];
    }
    
}

- (void)apiRequestSuccessWithJSON:(NSData *)dataJSON forRequest:(WiSeCloudAPIRequestDetails *)request withRequestStatus:(WiSeCloudApiRequestStatus)requestStatus{
    NSDictionary * dictResponse;
    if (dictResponse) { // True
        if ([[dictResponse objectForKey:RESPONSE_STATUS] boolValue]) { // True
            
            WiSeGetSharedDevicesAPIResponse * response = [self getSharedDevicesResponseFromDictResponse:dictResponse];
            // Request Status
            request.requestStatus = RequestSuccess;
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(getSharedDevicesSuccessWithResponse:withRequestDetails:)]) {
                [self.delegate getSharedDevicesSuccessWithResponse:response withRequestDetails:request];
            }
            
        }else { // False
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(getSharedDevicesFailedWithError:withRequestDetails:)]) {
                
                // Request Status
                request.requestStatus = RequestFailed;
                WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:GetSharedDevicesFailedErrorDomain  withErrorDescription:[dictResponse objectForKey:MESSAGE]withDomainCode:GetSharedDevicesErrorCode];
                [self.delegate getSharedDevicesFailedWithError:error withRequestDetails:request];
                
            }
            
        }
    }else {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(getSharedDevicesFailedWithError:withRequestDetails:)]) {
            
            // Request Status
            request.requestStatus = RequestFailed;
            WiSeAppError * error = [WiSeNetworkUtil getErrorWithDomainName:GetSharedDevicesFailedErrorDomain  withErrorDescription:RESPONSE_IS_NIL withDomainCode:GetSharedDevicesErrorCode];
            [self.delegate getSharedDevicesFailedWithError:error withRequestDetails:request];
            
        }
        
    }
    
}

- (WiSeGetSharedDevicesAPIResponse *) getSharedDevicesResponseFromDictResponse : (NSDictionary *) dictResponse {
    WiSeGetSharedDevicesAPIResponse * response = [WiSeGetSharedDevicesAPIResponse new];
    response.status = [[dictResponse objectForKey:STATUS] boolValue];
    response.message = [dictResponse objectForKey:MESSAGE];
    response.sharedDevicesDetailsList = [self getSharedDevicesListFromDataArray:[dictResponse objectForKey:DATA]];
    return response;
}

- (NSMutableArray *) getSharedDevicesListFromDataArray : (NSArray *) dataArray {
    NSMutableArray * arrSharedDevicesList = [[NSMutableArray alloc] init];
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    if (dataArray && [dataArray isKindOfClass:[NSArray class]]) {
        for (int i = 0; i < dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            
            if (dict && [dict isKindOfClass:[NSDictionary class]]) {
                WiSeDashBoardSubItems * wiSeDashBoardSubItems = [WiSeDashBoardSubItems new];

                wiSeDashBoardSubItems.deviceIconId            = [[dict objectForKey:@""] intValue];
                wiSeDashBoardSubItems.deviceName              = [dict objectForKey:WISE_DEVICE_NAME];
                wiSeDashBoardSubItems.deviceUUID              = [dict objectForKey:WISE_DEVICE_UUID];
                wiSeDashBoardSubItems.deviceType              = [[dict objectForKey:WISE_DEVICE_TYPE] intValue];
                wiSeDashBoardSubItems.intensityValue          = [[dict objectForKey:INTENSITY] intValue];
                wiSeDashBoardSubItems.warmCoolValue           = [[dict objectForKey:COOL] intValue];
                wiSeDashBoardSubItems.devicePairString        = [dict objectForKey:WISE_DEVICE_PAIR_INFO];
                wiSeDashBoardSubItems.hardwareVersion         = [dict objectForKey:HARDWARD_VERSION];
                wiSeDashBoardSubItems.softwareVersion         = [dict objectForKey:SOFTWARE_VERSION];
                wiSeDashBoardSubItems.firmwareVersion         = [dict objectForKey:FIRMWARE_VERSION];
                wiSeDashBoardSubItems.deviceCloudId           = [[dict objectForKey:@""] intValue];
                wiSeDashBoardSubItems.isFeedbackEnabled       = [[dict objectForKey:FEEDBACK] boolValue];
                wiSeDashBoardSubItems.sensorStatus            = 0;// [[[arrTempData objectAtIndex:i] objectForKey:@""] intValue];
                wiSeDashBoardSubItems.meshNetworkId           = [dict objectForKey:NETWORK_ID] ;
                wiSeDashBoardSubItems.isConnectable           = [[dict objectForKey:IS_CONNECTABLE] boolValue];
                wiSeDashBoardSubItems.networkType             = [dict objectForKey:@""];
                wiSeDashBoardSubItems.deviceMac               = [dict objectForKey:WISE_DEVICE_MAC];
                wiSeDashBoardSubItems.triggerTimer            = [[dict objectForKey:TIMER] intValue];

//                int strSensorType = [[dict objectForKey:@""] intValue];
//
//                switch (strSensorType) {
//                    case PIR:
//                        wiSeDashBoardSubItems.sensorType = PIR;
//                        break;
//                    case LDR:
//                        wiSeDashBoardSubItems.sensorType = LDR;
//                        break;
//                    case NoType:
//                        wiSeDashBoardSubItems.sensorType = NoType;
//                        break;
//                    default:
//                        break;
//                }


                NSArray * atmpArryRGB                         = [[dict objectForKey:RGB] componentsSeparatedByString:@","];
                if (atmpArryRGB && (atmpArryRGB.count == 3)) {
                atmpArryRGB                                   = [WiSeNetworkUtil replaceNullValues:atmpArryRGB];
                    if (atmpArryRGB && [atmpArryRGB isKindOfClass:[NSArray class]] ) {
                        wiSeDashBoardSubItems.rgbRValue               = [[atmpArryRGB objectAtIndex:0] intValue];
                        wiSeDashBoardSubItems.rgbGValue               = [[atmpArryRGB objectAtIndex:1] intValue];
                        wiSeDashBoardSubItems.rgbBValue               = [[atmpArryRGB objectAtIndex:2] intValue];
                    }
                }

                NSData *decodedDeviceID                       = [[NSData alloc] initWithBase64EncodedString:[dict objectForKey:WISE_DEVICE_SHORT_ID] options:0];
                const uint8_t *decodedDevID                   = [decodedDeviceID bytes];
                if(decodedDevID != nil)
                {
                wiSeDashBoardSubItems.deviceMeshId            = decodedDevID[0];
                }

                [arrSharedDevicesList addObject:wiSeDashBoardSubItems];

            }
        }
    }
    return arrSharedDevicesList;
}



@end
