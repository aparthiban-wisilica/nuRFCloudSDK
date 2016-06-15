//
//  WiSeNotificationStatusUpdateAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 10/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>
#import "WiSeBaseRequest.h"

@interface WiSeNotificationStatusUpdateAPIRequest : WiSeBaseRequest

@property (nonatomic,assign) NSInteger notificationId;
@property (nonatomic,assign) NSInteger status;
@property (nonatomic,strong) NSArray <NSNumber *>* notificationIds;

@end
