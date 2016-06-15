//
//  WiSeGetMessageHistoryAPIRequest.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 15/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>

@interface WiSeGetMessageHistoryAPIRequest : NSObject

@property (nonatomic,strong ) NSString                    * token;
@property (nonatomic, assign) WiSeCloudApiRequestPriority priority;
@property (nonatomic,assign ) int                         start;
@property (nonatomic,assign ) int                         limit;
@property (nonatomic,assign ) int                         phoneCloudId;
@property (nonatomic,assign ) WiSeMessageType             messageType;

@end
