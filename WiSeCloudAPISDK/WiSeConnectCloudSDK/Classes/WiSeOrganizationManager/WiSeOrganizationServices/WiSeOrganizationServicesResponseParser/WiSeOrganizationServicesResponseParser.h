//
//  WiSeOrganizationServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudOrganizationResponse;
@class WiSeCloudApiResponse;
@class WiSeCloudAPIResponseDetails;

@interface WiSeOrganizationServicesResponseParser : NSObject

+ (WiSeCloudOrganizationResponse *) parseAddOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudOrganizationResponse *) parseEditOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudOrganizationResponse *) parseDeleteOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudOrganizationResponse *) parseGetOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudOrganizationResponse *) appendBasicDetails : (WiSeCloudOrganizationResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse;

+ (NSMutableArray *) getOrganizationDetailsListFromResponseData : (NSArray *) arrOfOrgs;

@end
