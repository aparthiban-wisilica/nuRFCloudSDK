//
//  WiSeMakeMultiSensorAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 17/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@interface WiSeMakeMultiSensorAPIResponse : WiSeCloudApiResponse

@property (nonatomic, assign) int                            sequenceNumber;
@property (nonatomic, assign) NSInteger                      deviceCloudId;
@property (nonatomic, assign) BOOL                           status;
@property (nonatomic, copy  ) NSString                       * message;
@property (nonatomic,assign ) SetSensorTriggerSuccesAndError statusCode;

@end
