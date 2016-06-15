//
//  WiseSensorTriggerLogRequestDetails.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiseSensorTriggerLogRequestDetails : NSObject

@property (nonatomic,strong) NSData * trigger;
@property (nonatomic,assign) int    sensorShortId;
@property (nonatomic,assign) int    sequenceNumber;

@end
