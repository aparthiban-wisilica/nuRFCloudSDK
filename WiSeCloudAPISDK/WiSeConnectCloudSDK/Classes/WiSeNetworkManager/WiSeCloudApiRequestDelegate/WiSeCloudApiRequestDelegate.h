//
//  WiSeCloudApiRequestDelegate.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 23/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCoreNetworkConstants.h"
#import "WiSeAppError.h"

@class WiSeCloudAPIRequestDetails;

/*!
 @typedef Core Delegate used in calling of every API
 @discussion API Callbacks.
 */
@protocol WiSeCloudApiRequestDelegate <NSObject>

/*!
 * @discussion Triggered when an API is success.
 * @param dictResponse Parsed response in Dictionary Format
 * @param dataJSON Actual json data from response
 * @param requestDetails Contains the request details of received response
 * @param requestStatus Status of the request
 * @return void.
 */

- (void) apiRequestSuccessWithJSON : (NSData *) dataJSON forRequest : (WiSeCloudAPIRequestDetails *) requestDetails withRequestStatus : (WiSeCloudApiRequestStatus) requestStatus;

/*!
 * @discussion Triggered when an API is failed.
 * @param error Error details of the failed request
 * @param dataJSON Actual json data from response
 * @param requestDetails Contains the request details of received response
 * @param requestStatus Status of the request
 * @return void.
 */

- (void) apiRequestFailedWithError: (WiSeAppError *) error withResponse: (NSDictionary *) dictResponse withJSON : (NSData *) dataJSON forRequest : (WiSeCloudAPIRequestDetails *) requestDetails withRequestStatus : (WiSeCloudApiRequestStatus) requestStatus;

@end
