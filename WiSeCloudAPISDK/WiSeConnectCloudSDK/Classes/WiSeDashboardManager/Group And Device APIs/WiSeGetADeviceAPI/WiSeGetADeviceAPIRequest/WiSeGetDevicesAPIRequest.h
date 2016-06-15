//
//  WiSeGetADeviceAPIRequest.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 13/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"

@interface WiSeGetDevicesAPIRequest : WiSeBaseRequest

@property (nonatomic,assign) int deviceCloudId;
@property (nonatomic,assign) int groupCloudId;
@property (nonatomic,assign) int start;
@property (nonatomic,assign) int end;

@end
