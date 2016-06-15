//
//  WiSeSettingsServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeBridgeSet_RemoveAPIRequest;
@class WiSeCloudSubscriptionAPIRequest;
@class WiSeHealthCheckAPIRequest;

@interface WiSeSettingsServicesRequestParser : NSObject

+ (NSDictionary *) createBridgeSet_RemoveApiParameters : (WiSeBridgeSet_RemoveAPIRequest *) request;

+ (NSDictionary *) createCreateUpdateSubscriptionApiParameters : (WiSeCloudSubscriptionAPIRequest *) request;

+ (NSDictionary *) createHealthCheckApiParameters : (WiSeHealthCheckAPIRequest *) request;

@end
