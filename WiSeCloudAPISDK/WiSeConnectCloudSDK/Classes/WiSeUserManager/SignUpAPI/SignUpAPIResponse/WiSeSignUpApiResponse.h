//
//  SignUpAPIResponse.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 23/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@interface WiSeSignUpApiResponse : WiSeCloudApiResponse

@property (nonatomic,assign) SignUpSuccesAndError statusCode;
@property (nonatomic,assign) int                  userId;


@end
