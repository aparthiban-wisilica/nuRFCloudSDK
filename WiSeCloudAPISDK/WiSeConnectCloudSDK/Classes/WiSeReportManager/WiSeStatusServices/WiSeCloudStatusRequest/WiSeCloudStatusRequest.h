//
//  WiSeCloudStatusRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 06/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
#import "WiSeNetworkConstants.h"

@interface WiSeCloudStatusRequest : WiSeBaseRequest

// Used In Get
@property (nonatomic,assign) double      start;
@property (nonatomic,assign) int         limit;

@property (nonatomic,assign) WiSeAPICall apiId;
@property (nonatomic,assign) double      lastUpdatedTime;

@end
