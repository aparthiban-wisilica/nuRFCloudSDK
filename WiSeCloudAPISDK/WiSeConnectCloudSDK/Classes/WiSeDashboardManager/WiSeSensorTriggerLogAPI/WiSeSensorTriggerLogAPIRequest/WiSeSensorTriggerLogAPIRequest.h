//
//  WiSeSensorTriggerLogAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 17/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"

@interface WiSeSensorTriggerLogAPIRequest : WiSeBaseRequest

@property (nonatomic,strong) NSData  * trigger;
@property (nonatomic,assign) int     sensorShortId;
@property (nonatomic,assign) int     sequenceNumber;
@property (nonatomic,strong) NSArray * wiseSensorTriggerLogRequestDetailsList;

@end
