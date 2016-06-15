//
//  WiSeMessageBase.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 10/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"

@interface WiSeOtherMessageBase : NSObject

@property (nonatomic,strong) NSString             * messageString;
@property (nonatomic,assign) int                  messageStatus;
@property (nonatomic,assign) WiSeOtherMessageType type;
@property (nonatomic,assign) int                  device_groupCloudId;
@property (nonatomic,assign) int                  messageId;
@property (nonatomic,strong) NSString             * deviceUUID;
@property (nonatomic,assign) WiSeItemType         wiseItemType;
@property (nonatomic,assign) int                  operationLogId;
@property (nonatomic,assign) int                  status;
@property (nonatomic,assign) int                  deviceType;
@property (nonatomic,assign) int                  intencity;
@property (nonatomic,assign) int                  warm_coolLevel;
@property (nonatomic,assign) int                  timer;
@property (nonatomic,copy  ) NSString             * rgbValue;
@property (nonatomic,assign) double               timestamp;
@property (nonatomic,retain) NSDate               * time;
@property (nonatomic,assign) int                  operatePhoneLongId;

@end
