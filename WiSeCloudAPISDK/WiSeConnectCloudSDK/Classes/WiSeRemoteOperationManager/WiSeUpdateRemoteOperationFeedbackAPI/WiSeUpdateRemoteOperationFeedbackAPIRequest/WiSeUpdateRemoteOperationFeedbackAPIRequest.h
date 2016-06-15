//
//  WiSeUpdateRemoteOperationFeedbackAPIRequest.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 13/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>
#import "WiSeBaseRequest.h"
#import "WiSeDirectRemoteOperationDetails.h"

@interface WiSeUpdateRemoteOperationFeedbackAPIRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeDirectRemoteOperationDetails *> * wiseUpdateRemoteOperationFeedbackRequestDetailsList; // Array of WiSeDirectRemoteOperationDetails objects

@end
