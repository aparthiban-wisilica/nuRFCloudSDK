//
//  WiSeScheduleServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudScheduleRequest;

@interface WiSeScheduleServicesRequestParser : NSObject

+ (NSMutableArray *) createAddScheduleApiParameters : (WiSeCloudScheduleRequest *) request;

+ (NSMutableArray *) createEditScheduleApiParameters : (WiSeCloudScheduleRequest *) request;

+ (NSMutableArray *) createDeleteScheduleApiParameters : (WiSeCloudScheduleRequest *) request;

@end
