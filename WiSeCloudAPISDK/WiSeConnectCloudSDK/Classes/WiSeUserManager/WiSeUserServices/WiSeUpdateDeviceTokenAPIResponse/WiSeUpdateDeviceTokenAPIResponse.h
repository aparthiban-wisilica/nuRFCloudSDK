//
//  WiSeUpdateDeviceTokenAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 25/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@interface WiSeUpdateDeviceTokenAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) UpdateDeviceTokenSuccessAndError statusCode;
@property (nonatomic,assign) int appId;

@end
