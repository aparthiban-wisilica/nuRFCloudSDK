//
//  WiSeSettingsServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeBridgeSet_RemoveAPIRequest;

@class WiSeCloudSubscriptionAPIRequest;

@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeAPIHeader;
@class WiSeHealthCheckAPIRequest;

@interface WiSeSettingsServices : NSObject

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) bridgeSet_RemoveApiWithRequest : (WiSeBridgeSet_RemoveAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) createUpdateSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request ;

// CMS
- (WiSeCloudAPIRequestRegisteredDetails *) createUpdateSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) healthCheckApiWithRequest : (WiSeHealthCheckAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
