//
//  WiSeMessageManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved. 
//

#import <Foundation/Foundation.h>
#import "WiSeMessageManagerDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeGetMessageHistoryAPIRequest;
@class WiSeResetMessageQueueAPIRequest;
@class WiSeMessageFetchAPIRequest;
@class WiSeMessageStatusUpdateAPIRequest;
@class WiSeNotificationStatusUpdateAPIRequest;
@class WiSeAPIHeader;
@class WiSeCloudTrackingAlertAPIRequest;

@interface WiSeMessageManager : NSObject

@property (nonatomic,weak) id <WiSeMessageManagerDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) getMessageHistoryApiWithRequest : (WiSeGetMessageHistoryAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) resetMessageQueueApiWithRequest : (WiSeResetMessageQueueAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) messageFetchApiWithRequest : (WiSeMessageFetchAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) messageStatusUpdateApiWithRequest : (WiSeMessageStatusUpdateAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) notificationStatusUpdateApiWithRequest : (WiSeNotificationStatusUpdateAPIRequest *) request ;


/*!
 * @brief CMS APIs.
 */
 

- (WiSeCloudAPIRequestRegisteredDetails *) notificationUpdateApiWithRequest : (WiSeNotificationStatusUpdateAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) messageStatusUpdateApiWithRequest : (WiSeMessageStatusUpdateAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) resetMessageQueueApiWithRequest : (WiSeResetMessageQueueAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getTrackingAlertsApiWithRequest : (WiSeCloudTrackingAlertAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;




@end
