//
//  WiSeLogoutAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 10/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@interface WiSeLogoutAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) LogoutSuccesAndError statusCode;

@end
