//
//  MessageFetchAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 10/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>
#import "WiSeBaseRequest.h"

@interface WiSeMessageFetchAPIRequest : WiSeBaseRequest

@property (nonatomic,assign ) int             messageId;
@property (nonatomic,assign ) WiSeMessageType messageType;

@property (nonatomic,assign ) double          start;
@property (nonatomic,assign ) int             limit;

@end
