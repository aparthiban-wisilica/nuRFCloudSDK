//
//  WiSeCloudSnoozeSettingRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
@class WiSeCloudSnoozeSettingDetails;

@interface WiSeCloudSnoozeSettingRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeCloudSnoozeSettingDetails *> * snoozeSettingsList;// Array of WiSeCloudOrganizationInfo objects

@end
