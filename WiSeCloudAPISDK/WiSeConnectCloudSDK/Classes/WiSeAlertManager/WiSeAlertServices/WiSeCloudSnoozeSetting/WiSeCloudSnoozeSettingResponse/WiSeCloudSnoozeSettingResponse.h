//
//  WiSeCloudSnoozeSettingResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
@class WiSeCloudSnoozeSettingDetails;

@interface WiSeCloudSnoozeSettingResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int                       statusCode;
@property (nonatomic,strong) NSArray <WiSeCloudSnoozeSettingDetails *> * snoozeSettingsList;// Array of WiSeCloudSnoozeSettingDetails objects

@end
