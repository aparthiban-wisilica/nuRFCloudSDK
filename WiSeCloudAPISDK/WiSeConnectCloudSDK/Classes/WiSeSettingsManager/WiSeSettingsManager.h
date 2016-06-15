//
//  WiSeSettingsManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeSettingsManagerDelegate.h"


@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeAppError;
@class WiSeBridgeSet_RemoveAPIRequest;
@class WiSeCloudSubscriptionAPIRequest;
@class WiSeAPIHeader;
@class WiSeHealthCheckAPIRequest;

@interface WiSeSettingsManager : NSObject 

@property (nonatomic,weak) id <WiSeSettingsManagerDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) bridgeSet_RemoveApiWithRequest : (WiSeBridgeSet_RemoveAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) createUpdateSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request;

- (WiSeCloudAPIRequestRegisteredDetails *) getSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request;

/*!
 * @brief CMS APIs.
 */

- (WiSeCloudAPIRequestRegisteredDetails *) createUpdateSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getSubscriptionApiWithRequest : (WiSeCloudSubscriptionAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) healthCheckApiWithRequest : (WiSeHealthCheckAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
