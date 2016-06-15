//
//  WiSeTagManagerServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudTagResponse;
@class WiSeCloudApiResponse;

@interface WiSeTagManagerServicesResponseParser : NSObject

+ (WiSeCloudTagResponse *) parseAddTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudTagResponse *) parseEditTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudTagResponse *) parseGetTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudTagResponse *) parseGetArchivedTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudTagResponse *) parseDeleteTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudTagResponse *) parseSecureTagAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudTagResponse *) appendBasicDetails : (WiSeCloudTagResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse;


+ (NSMutableArray *) getTagDetailsFromResponseData : (NSArray *) dataArray;

@end
