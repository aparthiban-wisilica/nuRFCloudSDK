//
//  WiSeBridgeSet_RemoveAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@interface WiSeBridgeSet_RemoveAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) BridgeSetRemoveSuccesAndError statusCode;

@end
