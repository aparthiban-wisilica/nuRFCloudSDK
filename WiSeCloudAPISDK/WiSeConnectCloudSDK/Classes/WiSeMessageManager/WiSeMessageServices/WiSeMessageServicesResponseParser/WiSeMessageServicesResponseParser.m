//
//  WiSeMessageServicesResponseParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeMessageServicesResponseParser.h"

#import "WiSeGetMessageHistoryAPIResponse.h"
#import "WiSeResetMessageQueueAPIResponse.h"
#import "WiSeMessageFetchAPIResponse.h"
#import "WiSeMessageStatusUpdateAPIResponse.h"
#import "WiSeMessageFetchAPIRequest.h"
#import "WiSeNotificationStatusUpdateAPIResponse.h"

#import "WiSeParsedAPIResponse.h"
#import "WiSeNetworkUtil.h"

#import "WiSeOtherMessageBase.h"
#import "WiSeSensorTriggerMessageDetails.h"
#import "WiSeOperationMessageDetails.h"
#import "WiSeOtherMessage.h"
#import "WiSeUpdatedMessageDetails.h"
#import "WiSeCloudTrackingAlertAPIResponse.h"
#import "WiSeCloudTrackingAlertDetails.h"

@implementation WiSeMessageServicesResponseParser

# pragma mark --- Get Message History        ---

+ (WiSeGetMessageHistoryAPIResponse *) parseGetMessageHistoryAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    
    WiSeGetMessageHistoryAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeGetMessageHistoryAPIResponse new];
            WiSeCloudApiResponse * statusResponse       = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                              = statusResponse.statusMessage;
            response.apiId                                      = statusResponse.apiId;
            response.startTime                                  = statusResponse.startTime;
            response.endTime                                    = statusResponse.endTime;
            response.executionTime                              = statusResponse.executionTime;
            response.urlResponseStatusCode                      = statusResponse.urlResponseStatusCode;
            //            response.statusCode                                 = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            
            
        }
    }
    return response;
    
}

# pragma mark --- Reset Message Queue        ---

+ (WiSeResetMessageQueueAPIResponse *) parseResetMessageQueueAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    return nil;
}

# pragma mark --- Message Fetch              ---

+ (WiSeMessageFetchAPIResponse *) parseMessageFetchAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo withRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo {
    
    WiSeMessageFetchAPIResponse * response;
    
    if (responseInfo) {
        
        WiSeMessageFetchAPIRequest * request = requestInfo.request;
        WiSeParsedAPIResponse * parseAPIRes  = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse          = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                         = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeMessageFetchAPIResponse new];
            WiSeCloudApiResponse * statusResponse  = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                              = statusResponse.statusMessage;
            response.apiId                                      = statusResponse.apiId;
            response.startTime                                  = statusResponse.startTime;
            response.endTime                                    = statusResponse.endTime;
            response.executionTime                              = statusResponse.executionTime;
            response.urlResponseStatusCode                      = statusResponse.urlResponseStatusCode;
            //            response.statusCode                                 = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            NSDictionary * dict = [dictResponse objectForKey:DATA];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:MESSAGE_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)])
                {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:MESSAGE_COUNT]intValue];
                    
                    if (totalCount > 0) {
                        if (request.messageType == OperationMessages) {
                            response.messageList      = [self getOperationMessageListFromArrayResponse:[[dictResponse objectForKey:DATA] objectForKey:MESSAGE_DETAILS]];
                        }else if (request.messageType == OtherMessages) {
                            response.messageList      = [self getMessageListFromArrayResponse:[[dictResponse objectForKey:DATA] objectForKey:MESSAGE_DETAILS]];
                        }
                        
                        int messageCount          = (int)response.messageList.count;
                        response.remainingMessage = totalCount - messageCount;
                        
                    }
                    
                }
            }
            
        }
    }
    return response;
    
}


// Get Operation Message List

+ (NSMutableArray *) getOperationMessageListFromArrayResponse : (NSArray *) arrResponse {
    
    NSMutableArray * arrOperationMessageList = [[NSMutableArray alloc] init];
    
    if ([WiSeNetworkUtil isArrayValid:arrResponse]) {
        for (int i = 0; i < arrResponse.count; i++)
        {
            NSDictionary * dict = [arrResponse objectAtIndex:i];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                WiSeOperationMessageDetails * details = [WiSeOperationMessageDetails new];
                
                details.operationId                   = [[dict objectForKey:OPERATIONID] intValue];
                details.operationLogId                = [[dict objectForKey:OPERATION_LOG_ID] intValue];
                details.device_groupMeshId            = [[dict objectForKey:GRPDVCSHOARTID]intValue];
                details.device_groupCloudId           = [[dict objectForKey:GRPDVCID] intValue];
                details.uuid                          = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:UUID]];
                details.sequenceNumber                = [[dict objectForKey:SEQUENCENUMBER] intValue];
                details.bridgeData                    = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:BRIDGEDATA]];
                details.encBridgeData                 = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:ENCBRIDGEDATA]];
                details.encKey                        = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:ENCKEY]];
                details.encData                       = [WiSeNetworkUtil getValidStringFromObject:[dict objectForKey:ENCDATA]];
                details.timestamp                     = [[dict objectForKey:TIMESTAMP] doubleValue];
                details.messageId                     = [[dict objectForKey:MESSAGEID] intValue];
                details.messageStatus                 = [[dict objectForKey:_STATUS] intValue];
                details.time                          = [WiSeNetworkUtil getFormattedDateFromString:[dict objectForKey:TIME]];
                details.operatePhoneLongId            = [[dict objectForKey:OPERATE_PHONE_ID] intValue];
                
                // Check group or device
                if ([[dict objectForKey:GRP_DVC] intValue] == WiseItem) {
                    details.wiseItemType                  = WiseItem;
                }else if ([[dict objectForKey:GRP_DVC] intValue] == WiseSubItem) {
                    details.wiseItemType                  = WiseSubItem;
                }
                [arrOperationMessageList addObject:details];
            }
        }
    }
    
    return arrOperationMessageList;
}


// Get Message List From Arrary Response
+ (NSMutableArray *) getMessageListFromArrayResponse : (NSArray *) arrResponse {
    NSMutableArray * arrMessageList = nil;
    arrResponse = [WiSeNetworkUtil replaceNullValues:arrResponse];
    
    if (arrResponse && [arrResponse isKindOfClass:[NSArray class]]) {
        if (arrResponse && arrResponse.count) {
            arrMessageList = [[NSMutableArray alloc] init];
            for (int i = 0; i < arrResponse.count; i++) {
                NSDictionary * dict = [arrResponse objectAtIndex:i];
                dict = [WiSeNetworkUtil replaceNullValues:dict];
                
                if (dict && [dict isKindOfClass:[NSDictionary class]]) {
                    
                    
                    NSDictionary * dictMessage = [dict objectForKey:MESSAGE];
                    dictMessage = [WiSeNetworkUtil replaceNullValues:dictMessage];
                    if ([WiSeNetworkUtil isDictionaryValid:dictMessage]) {
                        
                        
                        WiSeOtherMessageType type                 = [[dictMessage objectForKey:TYPE] intValue];
                        if (type == SensorTrigger) {
                            
                            WiSeSensorTriggerMessageDetails * details = [WiSeSensorTriggerMessageDetails new];
                            details.messageString                     = [dictMessage objectForKey:MESSAGE];
                            details.applicationData                   = [WiSeNetworkUtil convertBase64StringToDataWithString:[dictMessage objectForKey:APPLICATIONDATA]];
                            details.deviceUUID                        = [WiSeNetworkUtil getValidStringFromObject:[dictMessage objectForKey:UUID]];
                            
                            details.device_groupCloudId               = [[dictMessage objectForKey:DEVICEID] intValue];
                            
                            details.messageId                         = [[dictMessage objectForKey:MESSAGEID] intValue];
                            details.type                              = SensorTrigger;
                            details.messageStatus                     = [[dict objectForKey:MESSAGESTATUS] intValue];
                            details.status                            = [[dictMessage objectForKey:_STATUS] intValue];
                            details.timestamp                         = [[dictMessage objectForKey:TIMESTAMP] doubleValue];
                            details.sequenceNumber                    = [[dictMessage objectForKey:SEQUENCENUMBER] intValue];
                            details.time                              = [WiSeNetworkUtil getFormattedDateFromString:[dictMessage objectForKey:TIME]];
                            details.operatePhoneLongId                = [[dictMessage objectForKey:OPERATE_PHONE_ID] intValue];

                            [arrMessageList addObject:details];

                        }else if (type == RemoteOperationStatus || type == DirectOperationStatus) {

                            WiSeOtherMessage * baseMessage            = [WiSeOtherMessage new];

                            baseMessage.messageStatus                 = [[dict objectForKey:MESSAGESTATUS] intValue];
                            baseMessage.status                        = [[dictMessage  objectForKey:_STATUS] intValue];
                            baseMessage.type                          = type;
                            baseMessage.messageString                 = [dictMessage objectForKey:MESSAGE];
                            baseMessage.deviceUUID                    = [WiSeNetworkUtil getValidStringFromObject:[dictMessage objectForKey:UUID]];
                            baseMessage.device_groupCloudId           = [[dictMessage objectForKey:GRPDVCID] intValue];
                            baseMessage.operationLogId                = [[dictMessage objectForKey:OPID] intValue];
                            baseMessage.deviceType                    = [[dictMessage objectForKey:WISE_DEVICE_TYPE] intValue];
                            baseMessage.rgbValue                      = [WiSeNetworkUtil getValidStringFromObject:[dictMessage objectForKey:RGB]];
                            baseMessage.intencity                     = [[dictMessage objectForKey:INTENSITY] intValue];
                            baseMessage.warm_coolLevel                = [[dictMessage objectForKey:WARM_COOL] intValue];
                            baseMessage.messageId                     = [[dict objectForKey:MESSAGEID] intValue];
                            baseMessage.timer                         = [[dictMessage objectForKey:TIMER] intValue];
                            baseMessage.timestamp                     = [[dictMessage objectForKey:TIMESTAMP] doubleValue];
                            baseMessage.time                          = [WiSeNetworkUtil getFormattedDateFromString:[dictMessage objectForKey:TIME]];
                            baseMessage.operatePhoneLongId            = [[dictMessage objectForKey:OPERATE_PHONE_ID] intValue];
                            
                            // Check group or device
                            if ([[dictMessage objectForKey:GRP_DVC] intValue] == WiseItem) {
                                baseMessage.wiseItemType                  = WiseItem;
                            }else if ([[dictMessage objectForKey:GRP_DVC] intValue] == WiseSubItem) {
                                baseMessage.wiseItemType                  = WiseSubItem;
                            }
                            
                            [arrMessageList addObject:baseMessage];
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    return arrMessageList;
}



# pragma mark --- Message Status Update      ---

+ (WiSeMessageStatusUpdateAPIResponse *) parseMessageStatusUpdateAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo{
    
    WiSeMessageStatusUpdateAPIResponse * response = nil;
    
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse         = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                        = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeMessageStatusUpdateAPIResponse new];
            WiSeCloudApiResponse * statusResponse       = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                              = statusResponse.statusMessage;
            response.apiId                                      = statusResponse.apiId;
            response.startTime                                  = statusResponse.startTime;
            response.endTime                                    = statusResponse.endTime;
            response.executionTime                              = statusResponse.executionTime;
            response.urlResponseStatusCode                      = statusResponse.urlResponseStatusCode;
            response.statusCode                                 = [[[dictResponse objectForKey:STATUS] objectForKey:STATUS_CODE] intValue];
            
            response.updatedMessagesDetails = [self getUpdatedMessageDetails:[dictResponse objectForKey:DATA]];
            
        }
    }
    return response;
}

+ (NSMutableArray *) getUpdatedMessageDetails : (NSArray *) dataArray {
    NSMutableArray * arrUpdatedMessageDeatails = nil;
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        arrUpdatedMessageDeatails = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                WiSeUpdatedMessageDetails * details = [WiSeUpdatedMessageDetails new];
                details.messageId                   = [[dict objectForKey:MESSAGEID] intValue];
                details.notificationId              = [[dict objectForKey:NOTIFICATION_ID] intValue];
                details.status                      = [[dict objectForKey:_STATUS] boolValue];
                [arrUpdatedMessageDeatails addObject:details];
            }
        }
    }
    return arrUpdatedMessageDeatails;
}


# pragma mark --- Notification Status Update ---

+ (WiSeNotificationStatusUpdateAPIResponse *) parseNotificationStatusUpdateAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    
    WiSeNotificationStatusUpdateAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes                = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse                        = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                                       = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeNotificationStatusUpdateAPIResponse new];
            WiSeCloudApiResponse * statusResponse              = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                             = statusResponse.statusMessage;
            response.apiId                                     = statusResponse.apiId;
            response.startTime                                 = statusResponse.startTime;
            response.endTime                                   = statusResponse.endTime;
            response.executionTime                             = statusResponse.executionTime;
            response.urlResponseStatusCode                     = statusResponse.urlResponseStatusCode;
            
            if ([WiSeNetworkUtil isDictionaryValid:[dictResponse objectForKey:DATA]]) {
                response.status                                    = [[[dictResponse objectForKey:DATA]objectForKey:RESPONSE_STATUS] boolValue];
                response.message                                   = [[dictResponse objectForKey:DATA]objectForKey:MESSAGE];
            }
            
            if ([WiSeNetworkUtil isArrayValid:[dictResponse objectForKey:DATA]]) {
                response.notificationsList = [self getUpdatedMessageDetails:[dictResponse objectForKey:DATA]];
            }
            
        }
    }
    return response;
}

# pragma mark --- Get Tracking Alerts ---

+ (WiSeCloudTrackingAlertAPIResponse *) parseGetTrackingAlertsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudTrackingAlertAPIResponse * response = nil;
    if (responseInfo) {
        WiSeParsedAPIResponse * parseAPIRes                = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
        NSDictionary * dictResponse                        = (NSDictionary *) parseAPIRes.responseData;
        dictResponse                                       = [WiSeNetworkUtil checkForNullInResponse:dictResponse];
        
        if ([WiSeNetworkUtil isDictionaryValid:dictResponse]) {
            
            response = [WiSeCloudTrackingAlertAPIResponse new];
            WiSeCloudApiResponse * statusResponse              = [WiSeNetworkUtil getCloudAPIResponseFromStatusDict:[dictResponse objectForKey:STATUS] WithResponseInfo:responseInfo];
            
            response.statusMessage                             = statusResponse.statusMessage;
            response.apiId                                     = statusResponse.apiId;
            response.startTime                                 = statusResponse.startTime;
            response.endTime                                   = statusResponse.endTime;
            response.executionTime                             = statusResponse.executionTime;
            response.urlResponseStatusCode                     = statusResponse.urlResponseStatusCode;
            response.statusCode                                = [[[dictResponse objectForKey:STATUS] objectForKey:_STATUS_CODE] intValue];
            
            NSDictionary * dict = [dictResponse objectForKey:DATA];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                id value = [[dictResponse objectForKey:DATA] objectForKey:MESSAGE_COUNT];
                
                if([value respondsToSelector:@selector(integerValue)])
                {
                    int totalCount = [[[dictResponse objectForKey:DATA] objectForKey:MESSAGE_COUNT]intValue];
                    
                    if (totalCount > 0) {
                        response.trackingAlertsList = [self getTrackingAlertsListFromDataArray:[[dictResponse objectForKey:DATA] objectForKey:MESSAGE_DETAILS]];
                        int messageCount            = (int)response.trackingAlertsList.count;
                        response.remainingAlerts    = totalCount - messageCount;
                        
                    }
                    
                }
            }
            
        }
    }
    return response;
}

// Get the list of tracking alerts details

+ (NSArray *) getTrackingAlertsListFromDataArray : (NSArray *) dataArray {
    NSMutableArray * arrAlertsList = nil;
    
    dataArray = [WiSeNetworkUtil replaceNullValues:dataArray];
    if ([WiSeNetworkUtil isArrayValid:dataArray]) {
        arrAlertsList = [[NSMutableArray alloc] init];
        for (int i = 0; i<dataArray.count; i++) {
            NSDictionary * dict = [dataArray objectAtIndex:i];
            dict = [WiSeNetworkUtil replaceNullValues:dict];
            if ([WiSeNetworkUtil isDictionaryValid:dict]) {
                
                if ([dict objectForKey:MESSAGEID]) {
                    WiSeCloudTrackingAlertDetails * details = [WiSeCloudTrackingAlertDetails new];
                    details.messageId                       = [[dict objectForKey:MESSAGEID] intValue];
                    details.message                         = [dict objectForKey:MESSAGE];
                    details.messageType                     = [[dict objectForKey:MESSAGE_TYPE] intValue];
                    details.tagCloudId                      = [[dict objectForKey:TAG_ID] intValue];
                    details.tagMeshId                       = [[dict objectForKey:TAG_MESH_ID] intValue];
                    details.tagName                         = [dict objectForKey:TAG_NAME];
                    details.infantCloudId                   = [[dict objectForKey:INFANT_ID] intValue];
                    details.infantName                      = [dict objectForKey:INFANT_NAME];
                    details.batteryLevel                    = [[dict objectForKey:BATTARY_LEVEL] intValue];
                    details.latitude                        = [[dict objectForKey:LATITUDE] doubleValue];
                    details.longtitude                      = [[dict objectForKey:LONGTITUDE] doubleValue];
                    details.layerId                         = [dict objectForKey:LAYER_ID];
                    details.extraMessage                    = [dict objectForKey:EXTRA_MESSAGE];
                    details.timestamp                       = [[dict objectForKey:TIMESTAMP] doubleValue];
                    details.status                          = [[dict objectForKey:STATUS] intValue];
                    details.subOrganizationId               = [[dict objectForKey:SUB_ORG_ID] intValue];
                    [arrAlertsList addObject:details];
                }
                
            }
        }
    }
    return arrAlertsList;
}

@end
