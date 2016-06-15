//
//  WiSeCreateUpdateSubscriptionAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"
#import "WiSeSubscriptionDetails.h"

@interface WiSeCloudSubscriptionAPIResponse : WiSeCloudApiResponse

@property (nonatomic,strong) WiSeSubscriptionDetails * subscriptionDetails;
@property (nonatomic,assign) int                     statusCode;
@property (nonatomic,assign) int                     status;
@property (nonatomic,copy  ) NSString                * message;


@end
