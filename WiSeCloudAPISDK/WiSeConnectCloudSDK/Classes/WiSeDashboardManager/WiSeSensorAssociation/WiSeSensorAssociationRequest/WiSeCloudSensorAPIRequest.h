//
//  WiSeSensorAssociationRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WiSeBaseRequest.h"
#import "WiSeCloudSensorItems.h"

@interface WiSeCloudSensorAPIRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeCloudSensorItems *> * wiseSensorItemsList;// Array of WiSeCloudSensorItems

// Used In Get Sensor Association

@property (nonatomic,assign) double               start;
@property (nonatomic,assign) int                  limit;



@end
