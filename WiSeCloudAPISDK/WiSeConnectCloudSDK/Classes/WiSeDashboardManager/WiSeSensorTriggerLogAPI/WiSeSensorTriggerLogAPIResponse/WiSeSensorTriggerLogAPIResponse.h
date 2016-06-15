//
//  WiSeSensorTriggerLogAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 17/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@interface WiSeSensorTriggerLogAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) SetSensorTriggerSuccesAndError statusCode;

@end
