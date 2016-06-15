//
//  WiSeUpdateDeviceTokenAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 25/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"

@interface WiSeUpdateDeviceTokenAPIRequest : WiSeBaseRequest

@property (nonatomic,assign) int      organizationId;
@property (nonatomic,copy  ) NSString * deviceToken;

@end
