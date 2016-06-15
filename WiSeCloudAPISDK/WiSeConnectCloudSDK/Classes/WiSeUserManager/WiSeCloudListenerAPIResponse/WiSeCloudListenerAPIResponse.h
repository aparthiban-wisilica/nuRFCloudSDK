//
//  WiSeCloudListenerAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 20/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
@class WiSeCloudListenerInfo;
@class WiSeCloudZoneRules;

@class WiSeListenersInOrganization;

@interface WiSeCloudListenerAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int                         statusCode;
@property (nonatomic,assign) int                         remainingListeners;
@property (nonatomic,assign) int                         remainingListenersZoneMappingCount;
@property (nonatomic,strong) NSArray <WiSeCloudListenerInfo       *> * listenerList;// Array of WiSeCloudListenerInfo objects

// Only used in Listener Zone Mapping Get
@property (nonatomic,strong) NSArray <WiSeCloudZoneRules          *> * listenerZoneMappingList;// Array of WiSeCloudZoneRules

// Only used in Get Listeners from Organization

@property (nonatomic,strong) NSArray <WiSeListenersInOrganization *> * listenersListFromOrganizations;

@end
