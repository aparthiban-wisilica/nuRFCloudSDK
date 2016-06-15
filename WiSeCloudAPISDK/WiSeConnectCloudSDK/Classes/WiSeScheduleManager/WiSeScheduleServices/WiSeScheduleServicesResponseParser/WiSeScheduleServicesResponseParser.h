//
//  WiSeScheduleServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WiSeCloudScheduleResponse;
@class WiSeCloudAPIResponseDetails;
@class WiSeCloudApiResponse;

@interface WiSeScheduleServicesResponseParser : NSObject

+ (WiSeCloudScheduleResponse *) parseAddScheduleAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudScheduleResponse *) parseEditScheduleAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudScheduleResponse *) parseDeleteScheduleAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudScheduleResponse *) parseGetScheduleAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudScheduleResponse *) appendBasicDetails : (WiSeCloudScheduleResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse;

@end
