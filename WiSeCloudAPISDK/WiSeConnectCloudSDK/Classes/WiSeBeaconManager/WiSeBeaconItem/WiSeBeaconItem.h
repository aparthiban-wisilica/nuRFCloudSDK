//
//  WiSeBeaconItem.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 14/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"

@interface WiSeBeaconItem : NSObject

@property (nonatomic,copy   ) NSString * beaconName;
@property (nonatomic,copy   ) NSString * beaconRangeName;

@property (nonatomic,assign ) int      beaconSlot;
@property (nonatomic,assign ) int      beaconCloudId;
@property (nonatomic,assign ) int      beaconType;
@property (nonatomic,assign ) int      beaconStatus;

@property (nonatomic, assign) int      beaconMeshId;
@property (nonatomic,copy   ) NSString * beaconUUID;
@property (nonatomic,assign ) int      major;
@property (nonatomic,assign ) int      minor;
@property (nonatomic,assign ) int      txPower;
@property (nonatomic, assign) int      calibratedValue;
@property (nonatomic, assign) int      capability;
@property (nonatomic, assign) int      advertisingInterval;
@property (nonatomic, strong) NSData   * beaconPrefix;
@property (nonatomic,assign ) int      rangerSSI;

@property (nonatomic, strong) NSData   * deviceCapability;
@property (nonatomic, strong) NSData   * beaconData;

@property (nonatomic,strong ) NSString * deviceUUID;
@property (nonatomic,copy   ) NSString * deviceName;
@property (nonatomic,assign ) int      deviceCloudId;
@property (nonatomic,assign ) int      deviceMeshId;
@property (nonatomic,assign ) int      batteryLevel;


@end
