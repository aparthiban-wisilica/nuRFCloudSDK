//
//  WiSeSettingsServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeSettingsServicesRequestParser.h"

#import "WiSeBridgeSet_RemoveAPIRequest.h"
#import "WiSeCloudSubscriptionAPIRequest.h"
#import "WiSeHealthCheckAPIRequest.h"

@implementation WiSeSettingsServicesRequestParser

#pragma mark - Bridge Set and Remove

+ (NSDictionary *) createBridgeSet_RemoveApiParameters : (WiSeBridgeSet_RemoveAPIRequest *) request{
    
    NSDictionary *jsonDictionary = nil;

    NSString * strBirdgeAction   = [NSString stringWithFormat:@"%d",request.bridgeAction];

    NSArray *keys                = [NSArray arrayWithObjects:ACTION, nil];
    NSArray *objects             = [NSArray arrayWithObjects:strBirdgeAction,nil];
    if (keys.count == objects.count) {
        jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        
    }
    return jsonDictionary;
}

# pragma mark --- Create/Update Subscription ---

+ (NSDictionary *) createCreateUpdateSubscriptionApiParameters : (WiSeCloudSubscriptionAPIRequest *) request {
    
    NSDictionary *jsonDictionary = nil;

    NSString * subscriptionId    = [NSString stringWithFormat:@"%d",request.subscryptionId];

    NSArray *keys                = [NSArray arrayWithObjects:SUBSCRIPTIONID,nil];
    NSArray *objects             = [NSArray arrayWithObjects:subscriptionId,nil];
    
    if (keys.count == objects.count) {
        jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        
    }
    
    return jsonDictionary;
    
}

# pragma mark --- Health Check ---

+ (NSDictionary *) createHealthCheckApiParameters : (WiSeHealthCheckAPIRequest *) request {
    NSDictionary *jsonDictionary = nil;

    NSString * tagCount          = [NSString stringWithFormat:@"%d",request.tagCount];
    NSString * listenerCount     = [NSString stringWithFormat:@"%d",request.listenerCount];

    NSArray *keys                = [NSArray arrayWithObjects:TAG_COUNT,LISTENER_COUNT,nil];
    NSArray *objects             = [NSArray arrayWithObjects:tagCount,listenerCount,nil];
    
    if (keys.count == objects.count) {
        jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        
    }
    return jsonDictionary;
}


@end
