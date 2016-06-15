//
//  WiSeSettingsServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

@class WiSeBridgeSet_RemoveAPIResponse;
@class WiSeCloudSubscriptionAPIResponse;
@class WiSeHealthCheckAPIResponse;

@interface WiSeSettingsServicesResponseParser : NSObject

+ (WiSeBridgeSet_RemoveAPIResponse *) parseBridgeSet_RemoveAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSubscriptionAPIResponse *) parseCreateUpdateSubscriptionAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudSubscriptionAPIResponse *) parseGetSubscriptionAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeHealthCheckAPIResponse *) parseHealthCheckAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (NSArray *) getSubscriptionList : (NSArray *) dataArray;

@end
