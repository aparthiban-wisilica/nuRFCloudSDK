//
//  WiSeZoneServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 22/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudZoneAPIResponse;
@class WiSeCloudAPIResponseDetails;
@class WiSeCloudApiResponse;

@interface WiSeZoneServicesResponseParser : NSObject

+ (WiSeCloudZoneAPIResponse *) parseAddZoneAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeCloudZoneAPIResponse *) parseEditZoneAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeCloudZoneAPIResponse *) parseDeleteZoneAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeCloudZoneAPIResponse *) parseGetZoneAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeCloudZoneAPIResponse *) parseGetZonesFromOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;
+ (WiSeCloudZoneAPIResponse *) parseMapZoneListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;


+ (WiSeCloudZoneAPIResponse *) appendBasicDetails : (WiSeCloudZoneAPIResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse;


+ (NSMutableArray *) getZoneDetailsListFromResponseData : (NSArray *) arrOfZone;
+ (NSArray *) getMappings : (NSArray *) mappingArray;
+ (NSMutableArray *) getZonesOfOrganizationListFromResponseData : (NSArray *) arrOfZone;


@end
