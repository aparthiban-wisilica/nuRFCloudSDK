//
//  WiSeCloudZoneAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 22/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
@class WiSeCloudZoneRules;
@class WiSeZonesInOrganizations;

@interface WiSeCloudZoneAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int                      statusCode;
@property (nonatomic,strong) NSArray <WiSeCloudZoneRules       *> * zoneList;// Array of WiSeCloudZoneRules objects
@property (nonatomic,assign) int                      remainingZones;

@property (nonatomic,strong) NSArray <WiSeZonesInOrganizations *> * zonesListFromOrganizations;// Array of WiSeZonesInOrganizations objects

@end
