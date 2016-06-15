//
//  WiSeAddDeviceAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"
#import "WiSeCloudDeviceDetails.h"

@interface WiSeCloudDeviceAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int                    statusCode;
@property (nonatomic,strong) NSArray <WiSeCloudDeviceDetails *> * deviceList;// Array of WiSeCloudDeviceDetails objects
@property (nonatomic,assign) int                    remainingDevices;


@end
