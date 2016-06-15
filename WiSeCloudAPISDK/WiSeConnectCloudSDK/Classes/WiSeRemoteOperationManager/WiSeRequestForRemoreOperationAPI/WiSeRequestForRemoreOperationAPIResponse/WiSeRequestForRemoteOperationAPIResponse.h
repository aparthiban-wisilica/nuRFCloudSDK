//
//  WiSeRequestForRemoreOperationAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@interface WiSeRequestForRemoteOperationAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) DeviceRemoteOperationRequestSuccesAndError statusCode;
@property (nonatomic,assign) int                                        operationLogId;

@end
