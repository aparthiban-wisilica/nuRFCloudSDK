//
//  WiSeCloudSnoozeSettingDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeCloudSnoozeSettingDetails : NSObject

@property (nonatomic,assign) int      alertType;
@property (nonatomic,assign) int      alertId;
@property (nonatomic,assign) int      organizationId;
@property (nonatomic,assign) int      snoozeTime;
@property (nonatomic,assign) int      snoozeCount;
@property (nonatomic,assign) int      status;
@property (nonatomic,copy  ) NSString * message;

@end
