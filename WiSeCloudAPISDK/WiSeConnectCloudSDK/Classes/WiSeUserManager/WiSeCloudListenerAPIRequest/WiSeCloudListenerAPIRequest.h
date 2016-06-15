//
//  WiSeCloudListenerAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 20/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
#import "WiSeCloudListenerInfo.h"

@interface WiSeCloudListenerAPIRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeCloudListenerInfo *> * listenerList;// Array of WiSeCloudListenerInfo objects
@property (nonatomic,assign) int                   listenerCloudId;

// Used In Get Listeners from Organization
@property (nonatomic,retain) NSArray <NSNumber              *> * organizationList;

// Used In Get
@property (nonatomic,assign) double                start;
@property (nonatomic,assign) int                   limit;
@property (nonatomic,assign) int                   userCloudId;

@end
