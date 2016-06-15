//
//  WiSeCloudBeaconAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
#import "WiSeCloudBeaconDetails.h"


@interface WiSeCloudBeaconAPIRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeCloudBeaconDetails *> * beaconsList; // Array of WiSeCloudBeaconDetails

// Used In Single Beacon Delete

@property (nonatomic,assign) int beaconCloudId;

// Update Beacon Data Log

@property (nonatomic,retain) NSData * beaconData;

// Used In Get
@property (nonatomic,assign) double start;
@property (nonatomic,assign) int limit;

@end
