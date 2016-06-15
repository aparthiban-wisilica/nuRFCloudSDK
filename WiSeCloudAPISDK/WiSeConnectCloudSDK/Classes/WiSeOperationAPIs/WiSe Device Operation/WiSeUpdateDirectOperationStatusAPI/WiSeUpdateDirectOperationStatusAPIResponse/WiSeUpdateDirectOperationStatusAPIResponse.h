//
//  WiSeUpdateDirectOperationStatusAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 04/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"
#import "WiSeDirectRemoteOperationDetails.h"

@interface WiSeUpdateDirectOperationStatusAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) DeviceDirectOperationStatusSuccesAndError statusCode;
@property (nonatomic,strong) NSArray <WiSeDirectRemoteOperationDetails *> * updatedOperationList; // Array of WiSeDirectRemoteOperationDetails

@end
