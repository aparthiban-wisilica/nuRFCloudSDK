//
//  WiSeMessageServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@class WiSeGetMessageHistoryAPIResponse;
@class WiSeResetMessageQueueAPIResponse;
@class WiSeMessageFetchAPIResponse;
@class WiSeMessageStatusUpdateAPIResponse;
@class WiSeNotificationStatusUpdateAPIResponse;
@class WiSeCloudTrackingAlertAPIResponse;

@interface WiSeMessageServicesResponseParser : NSObject

+ (WiSeGetMessageHistoryAPIResponse *) parseGetMessageHistoryAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeResetMessageQueueAPIResponse *) parseResetMessageQueueAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeMessageFetchAPIResponse *) parseMessageFetchAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo withRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeMessageStatusUpdateAPIResponse *) parseMessageStatusUpdateAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeNotificationStatusUpdateAPIResponse *) parseNotificationStatusUpdateAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudTrackingAlertAPIResponse *) parseGetTrackingAlertsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (NSMutableArray *) getOperationMessageListFromArrayResponse : (NSArray *) arrResponse;

+ (NSMutableArray *) getMessageListFromArrayResponse : (NSArray *) arrResponse;

+ (NSMutableArray *) getUpdatedMessageDetails : (NSArray *) dataArray;

+ (NSArray *) getTrackingAlertsListFromDataArray : (NSArray *) dataArray;

@end
