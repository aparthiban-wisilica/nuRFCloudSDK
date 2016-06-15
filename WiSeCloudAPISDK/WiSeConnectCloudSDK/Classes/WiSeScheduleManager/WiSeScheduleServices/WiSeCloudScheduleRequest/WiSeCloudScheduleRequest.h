//
//  WiSeCloudScheduleRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
@class WiSeCloudScheduleInfo;

@interface WiSeCloudScheduleRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeCloudScheduleInfo *> * scheduleList;// Array of WiSeCloudScheduleInfo

// Used In Get
@property (nonatomic,assign) double             start;
@property (nonatomic,assign) int                limit;

@end
