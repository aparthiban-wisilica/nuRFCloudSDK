//
//  WiSeMessageStatusUpdateAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 11/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>
#import "WiSeBaseRequest.h"

@interface WiSeMessageStatusUpdateAPIRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <NSNumber *> * messageIds;
@property (nonatomic,assign) WiSeMessageType messageType;


@end
