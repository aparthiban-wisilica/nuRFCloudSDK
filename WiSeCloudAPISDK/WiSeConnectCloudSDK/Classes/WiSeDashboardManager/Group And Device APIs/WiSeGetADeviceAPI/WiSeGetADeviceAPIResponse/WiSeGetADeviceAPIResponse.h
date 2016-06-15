//
//  WiSeGetADeviceAPIResponse.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 13/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@class WiSeDashBoardSubItems;

@interface WiSeGetADeviceAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int                   statusCode;
@property (nonatomic,strong) WiSeDashBoardSubItems * deviceDetails;

@end
