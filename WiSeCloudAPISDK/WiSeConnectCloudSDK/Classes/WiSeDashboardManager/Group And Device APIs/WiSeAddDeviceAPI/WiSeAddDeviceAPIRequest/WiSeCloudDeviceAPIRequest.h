//
//  WiSeAddDeviceAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
#import "WiSeCloudDeviceDetails.h"

@interface WiSeCloudDeviceAPIRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeCloudDeviceDetails *> * deviceList;// Array of WiSeCloudDeviceDetails objects

// Used in Single Device Delete
@property (nonatomic,assign) int                    deviceCloudId;

// Used In Get
@property (nonatomic,assign) int                    groupCloudId;
@property (nonatomic,assign) double                 start;
@property (nonatomic,assign) int                    limit;

@end
