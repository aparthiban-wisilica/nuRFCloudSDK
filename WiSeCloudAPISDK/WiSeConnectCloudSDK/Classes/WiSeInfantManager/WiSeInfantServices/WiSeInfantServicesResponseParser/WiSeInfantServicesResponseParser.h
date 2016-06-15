//
//  WiSeInfantServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudInfantResponse;
@class WiSeCloudAPIResponseDetails;
@class WiSeCloudApiResponse;

@interface WiSeInfantServicesResponseParser : NSObject

+ (WiSeCloudInfantResponse *) parseAddInfantAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudInfantResponse *) parseEditInfantAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudInfantResponse *) parseDeleteInfantAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudInfantResponse *) parseGetInfantAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudInfantResponse *) parseGetArchivedInfantAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudInfantResponse *) parseInfantTagAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudInfantResponse *) parseGetInfantsFromOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudInfantResponse *) parseGetInfantPositionAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudInfantResponse *) appendBasicDetails : (WiSeCloudInfantResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse;

+ (NSMutableArray *) getInfantDetailsListFromResponseData : (NSArray *) arrOfInfants;

+ (NSMutableArray *) getInfantsFromOrganizationFromResponseData : (NSArray *) arrOfInfants;

@end
