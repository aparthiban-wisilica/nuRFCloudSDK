//
//  WiSeCloudZoneAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 22/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
@class WiSeCloudZoneRules;

@interface WiSeCloudZoneAPIRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeCloudZoneRules *> * zoneList;// Array of WiSeCloudZoneRules

// Used In Get
@property (nonatomic,assign) double             start;
@property (nonatomic,assign) int                limit;
@property (nonatomic,retain) NSArray <NSNumber           *> * organizationList;

// Used In Single Infant Delete
@property (nonatomic,assign) int                zoneCloudId;

@end
