//
//  WiSeCloudScheduleResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
@class WiSeCloudScheduleInfo;

@interface WiSeCloudScheduleResponse : WiSeCloudApiResponse

@property (nonatomic,strong) NSArray <WiSeCloudScheduleInfo *> * scheduleList;// Array of WiSeCloudScheduleInfo
@property (nonatomic,assign) int statusCode;

@end
