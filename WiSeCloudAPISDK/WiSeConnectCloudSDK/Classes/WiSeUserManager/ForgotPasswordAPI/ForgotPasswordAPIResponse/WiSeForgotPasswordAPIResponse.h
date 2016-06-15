//
//  ForgotPasswordAPIResponse.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 24/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@interface WiSeForgotPasswordAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) ForgorPasswordSuccesAndError statusCode;

@end
