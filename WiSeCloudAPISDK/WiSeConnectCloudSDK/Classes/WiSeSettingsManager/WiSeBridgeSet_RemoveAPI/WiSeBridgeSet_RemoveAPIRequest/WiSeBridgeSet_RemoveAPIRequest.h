//
//  WiSeBridgeSet_RemoveAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>
#import "WiSeBaseRequest.h"

@interface WiSeBridgeSet_RemoveAPIRequest : WiSeBaseRequest

@property (nonatomic,assign) WiSeBridgeAction bridgeAction;

@end
