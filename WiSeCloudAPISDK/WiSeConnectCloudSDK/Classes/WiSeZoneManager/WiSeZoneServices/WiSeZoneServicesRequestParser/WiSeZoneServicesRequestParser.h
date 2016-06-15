//
//  WiSeZoneServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 22/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudZoneAPIRequest;

@interface WiSeZoneServicesRequestParser : NSObject

+ (NSMutableArray *) createAddZoneApiParameters : (WiSeCloudZoneAPIRequest *) request;

+ (NSMutableArray *) createEditZoneApiParameters : (WiSeCloudZoneAPIRequest *) request;

+ (NSMutableArray *) createDeleteZoneApiParameters : (WiSeCloudZoneAPIRequest *) request;

+ (NSMutableArray *) createGetZonesFromOrganizationApiParameters : (WiSeCloudZoneAPIRequest *) request;

+ (NSMutableArray *) createMapZoneAndListenerApiParameters : (WiSeCloudZoneAPIRequest *) request;

@end
