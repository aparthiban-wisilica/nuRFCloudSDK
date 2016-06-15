//
//  WiSeSensorServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 03/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

@class WiSeCloudSensorAPIResponse;
@class WiSeSensorTriggerIntervalSetAPIResponse;
@class WiSeSensorTriggerLogAPIResponse;
@class WiSeMakeMultiSensorAPIResponse;
@class WiSeCloudApiResponse;


@interface WiSeSensorServicesResponseParser : NSObject

+ (WiSeCloudSensorAPIResponse *) parseSensorAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSensorAPIResponse *) parseGetSensorAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSensorAPIResponse *) parseSensorTriggerLogAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeSensorTriggerIntervalSetAPIResponse *) parseSensorTriggerIntervelSetAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeMakeMultiSensorAPIResponse *) parseMakeMultiSensorAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSensorAPIResponse *) appendBasicDetails : (WiSeCloudSensorAPIResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse;


+ (NSMutableArray *) getAssociationDetailsForGetWithDataArray : (NSArray *) dataArray;

+ (NSMutableArray *) getAssociationDetailsWithDataArray : (NSArray *) dataArray;



@end
