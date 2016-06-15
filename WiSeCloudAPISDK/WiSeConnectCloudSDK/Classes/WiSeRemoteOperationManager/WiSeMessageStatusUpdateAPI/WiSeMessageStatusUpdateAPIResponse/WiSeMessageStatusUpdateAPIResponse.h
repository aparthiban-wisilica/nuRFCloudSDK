//
//  WiSeMessageStatusUpdateAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 11/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"
#import "WiSeUpdatedMessageDetails.h"

@interface WiSeMessageStatusUpdateAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) UpdateMessageStatusSuccesAndError statusCode;
@property (nonatomic,strong) NSArray   <WiSeUpdatedMessageDetails                 *> * updatedMessagesDetails;// Array of WiSeUpdatedMessageDetails

@end
