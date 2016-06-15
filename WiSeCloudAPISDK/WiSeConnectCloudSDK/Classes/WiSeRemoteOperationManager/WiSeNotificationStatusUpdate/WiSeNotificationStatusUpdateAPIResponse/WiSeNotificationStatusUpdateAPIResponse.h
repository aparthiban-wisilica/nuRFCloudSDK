//
//  WiSeNotificationStatusUpdateAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 10/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeUpdatedMessageDetails.h"

@interface WiSeNotificationStatusUpdateAPIResponse : WiSeCloudApiResponse

@property (nonatomic, assign) BOOL                      status;
@property (nonatomic, strong) NSString                  *message;
@property (nonatomic, strong) NSArray <WiSeUpdatedMessageDetails *> * notificationsList;// Array of WiSeUpdatedMessageDetails objects


@end
