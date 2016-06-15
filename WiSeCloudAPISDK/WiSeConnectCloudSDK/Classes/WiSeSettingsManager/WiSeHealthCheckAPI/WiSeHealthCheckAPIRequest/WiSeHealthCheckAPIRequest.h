//
//  WiSeHealthCheckAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"

@interface WiSeHealthCheckAPIRequest : WiSeBaseRequest

@property (nonatomic,assign) int tagCount;
@property (nonatomic,assign) int listenerCount;

@end
