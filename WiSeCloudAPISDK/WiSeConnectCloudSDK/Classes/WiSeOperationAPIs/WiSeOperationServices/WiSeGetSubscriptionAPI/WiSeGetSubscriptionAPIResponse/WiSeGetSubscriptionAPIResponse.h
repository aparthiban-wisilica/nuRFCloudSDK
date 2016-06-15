//
//  WiSeGetSubscriptionAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"
#import "WiSeSubscriptionDetails.h"

@interface WiSeGetSubscriptionAPIResponse : WiSeCloudApiResponse

@property (nonatomic,strong) WiSeSubscriptionDetails                     * subscriptionDetails;
@property (nonatomic,assign) UpdateRemoteOperationFeedbackSuccesAndError statusCode;


@end
