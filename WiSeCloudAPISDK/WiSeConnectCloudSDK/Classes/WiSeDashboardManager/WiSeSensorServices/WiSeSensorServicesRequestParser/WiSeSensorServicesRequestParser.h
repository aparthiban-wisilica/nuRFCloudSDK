//
//  WiSeSensorServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 03/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudSensorAPIRequest;
@class WiSeSensorTriggerIntervalSetAPIRequest;
@class WiSeSensorTriggerLogAPIRequest;
@class WiSeMakeMultiSensorAPIRequest;

@interface WiSeSensorServicesRequestParser : NSObject

+ (NSMutableArray *) createSensorAssociationApiParameters : (WiSeCloudSensorAPIRequest *) request;

+ (NSMutableArray *) createSensorTriggerLogApiParameters : (WiSeCloudSensorAPIRequest *) request;

+ (NSMutableArray *) createSensorTriggerIntervalSetApiParameters: (WiSeSensorTriggerIntervalSetAPIRequest *) request;

+ (NSMutableArray *) createMakeMultiSensorApiParameters : (WiSeMakeMultiSensorAPIRequest *) request;

@end
