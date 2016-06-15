//
//  WiSeGroupServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 28/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>


@class WiSeCloudGroupAPIResponse;
@class WiSeCloudApiResponse;
@class WiSeCloudAPIResponseDetails;

@interface WiSeGroupServicesResponseParser : NSObject

+ (WiSeCloudGroupAPIResponse *) parseAddGroupAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudGroupAPIResponse *) parseEditGroupAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudGroupAPIResponse *) parseDeleteGroupAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudGroupAPIResponse *) parseGetGroupAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudGroupAPIResponse *) appendBasicDetails : (WiSeCloudGroupAPIResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse;

+ (NSMutableArray *) getGroupDetailsFromResponseData : (NSDictionary *) dictResponse;

+ (NSMutableArray *) getGroupDetailsFromResponseData1 : (NSDictionary *) dictResponse;

+ (NSMutableArray * ) getSensorLinkedInStatusFromDataArray : (NSArray *) dataArray;

@end
