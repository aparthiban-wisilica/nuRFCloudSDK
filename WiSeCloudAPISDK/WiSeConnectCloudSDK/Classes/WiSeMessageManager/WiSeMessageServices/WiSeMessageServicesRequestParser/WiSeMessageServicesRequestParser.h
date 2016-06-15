//
//  WiSeMessageServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeResetMessageQueueAPIRequest;
@class WiSeMessageStatusUpdateAPIRequest;
@class WiSeNotificationStatusUpdateAPIRequest;

@interface WiSeMessageServicesRequestParser : NSObject

+ (NSMutableArray *) createResetMessageQueueApiParameters : (WiSeResetMessageQueueAPIRequest *) request;

+ (NSDictionary *) createMessageStatusUpdateApiParameters : (WiSeMessageStatusUpdateAPIRequest *) request;

+ (NSDictionary *) createNotificationStatusUpdateApiParameters : (WiSeNotificationStatusUpdateAPIRequest *) request;

+ (NSDictionary *) createNotificationUpdateApiParameters : (WiSeNotificationStatusUpdateAPIRequest *) request;

@end
