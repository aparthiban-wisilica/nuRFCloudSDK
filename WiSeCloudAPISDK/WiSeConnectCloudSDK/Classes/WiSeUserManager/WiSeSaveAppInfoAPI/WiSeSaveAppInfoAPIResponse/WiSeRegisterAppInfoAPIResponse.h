//
//  WiSeSaveAppInfoAPIResponse.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@interface WiSeRegisterAppInfoAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int appId;
@property (nonatomic,assign) SaveAppInfoSuccesAndError statusCode;

@end
