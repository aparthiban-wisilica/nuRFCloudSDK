//
//  WiSeCloudApiRequestDelegate.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 23/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCoreNetworkConstants.h"

@class WiSeAppError;
@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;

/*!
 @typedef Core Delegate used in calling of every API
 @discussion API Callbacks.
 */
@protocol WiSeCloudApiRequestDelegate <NSObject>

/*!
 * @discussion Triggered when an API is success or fail.
 * @param requestInfo Contains the request details of received response
 * @param responseInfo Contains the response details
 * @return void.
 */

- (void) apiCallBackWithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo WithResponseDetails : (WiSeCloudAPIResponseDetails *) responseInfo;

@end
