//
//  WiSeUpdateRemoteOperationFeedbackAPIRequest.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 13/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@interface WiSeUpdateRemoteOperationFeedbackAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) UpdateRemoteOperationFeedbackSuccesAndError statusCode;
@property (nonatomic,strong) NSArray                                     * updatedRemoteOperationList;

@end
