//
//  WiSeZonesInOrganizations.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 10/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WiSeCloudZoneRules;

@interface WiSeZonesInOrganizations : NSObject

@property (nonatomic,assign) int                remainingZones;
@property (nonatomic,assign) int                organizationId;
@property (nonatomic,strong) NSArray <WiSeCloudZoneRules *> * zoneList;// Array of WiSeCloudZoneRules objects

@end
