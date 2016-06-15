//
//  WiSeMessageServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeMessageServicesRequestParser.h"
#import "WiSeNetworkUtil.h"

#import "WiSeResetMessageQueueAPIRequest.h"
#import "WiSeMessageStatusUpdateAPIRequest.h"
#import "WiSeNotificationStatusUpdateAPIRequest.h"

@implementation WiSeMessageServicesRequestParser

# pragma mark --- Reset Message Queue        ---

+ (NSMutableArray *) createResetMessageQueueApiParameters : (WiSeResetMessageQueueAPIRequest *) request {
    return nil;
}

# pragma mark --- Message Status Update      ---

+ (NSDictionary *) createMessageStatusUpdateApiParameters : (WiSeMessageStatusUpdateAPIRequest *) request {
    
    NSString * strMessageIds;
    NSDictionary *jsonDictionary = nil;
    if (request.messageIds && request.messageIds.count) {
        strMessageIds = [request.messageIds componentsJoinedByString:@","];
    }else {
        strMessageIds = @"";
    }
    
    
    NSArray *keys = [NSArray arrayWithObjects:MSG_ID_ARRAY, nil];
    
    NSArray *objects = [NSArray arrayWithObjects:strMessageIds,nil];
    
    if (keys.count == objects.count) {
        jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        
    }
    
    return jsonDictionary;

}

# pragma mark --- Notification Status Update ---

+ (NSDictionary *) createNotificationStatusUpdateApiParameters : (WiSeNotificationStatusUpdateAPIRequest *) request {
    NSDictionary *jsonDictionary = nil;
    NSString * token             = request.token?request.token:@"";
    NSString * strStatus         = [NSString stringWithFormat:@"%ld",(long)request.status];
    strStatus                    = strStatus?strStatus:@"";
    NSArray *keys                = [NSArray arrayWithObjects:TOKEN,STATUS, nil];
    NSArray *objects             = [NSArray arrayWithObjects:token,strStatus, nil];
    if (keys.count == objects.count) {
    jsonDictionary               = [NSDictionary dictionaryWithObjects:objects forKeys:keys];

    }
    return jsonDictionary;
}
# pragma mark --- Notification Update ---

+ (NSDictionary *) createNotificationUpdateApiParameters : (WiSeNotificationStatusUpdateAPIRequest *) request {
    NSDictionary *jsonDictionary = nil;
    if (request) {
        NSString * notificationIds = [request.notificationIds componentsJoinedByString:@","];
        NSArray *keys              = [NSArray arrayWithObjects:NOTIFICATION_ID_ARRAY, nil];
        NSArray *objects           = [NSArray arrayWithObjects:notificationIds, nil];
        if (keys.count == objects.count) {
            jsonDictionary               = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        }
    }
    return jsonDictionary;
}

@end
