//
//  WiSeMapSettingServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudMapAPIResponse;
@class WiSeCloudApiResponse;
@class WiSeCloudAPIResponseDetails;
@class WiSeCloudMapInfo;

@interface WiSeMapSettingServicesResponseParser : NSObject

+ (WiSeCloudMapAPIResponse *) parseGetMapSettingsAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudMapInfo *) getMapSettingInfo : (NSDictionary *) dict;

+ (NSArray *) getMapSettingInfoList : (NSArray *) array ;

+ (NSArray *) getMapBoudaries : (NSArray *) arrBoundaries;

@end
