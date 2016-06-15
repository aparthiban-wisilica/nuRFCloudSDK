//
//  ChangePasswordApiResponse.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 24/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"
#import "WiSeCloudApiResponse.h"

@interface WiSeChangePasswordApiResponse : WiSeCloudApiResponse

@property (nonatomic,assign) ChangePasswordSuccesAndError statusCode;

@end
