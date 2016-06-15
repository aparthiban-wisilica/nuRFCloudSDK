//
//  WiSeNetworkManager.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 17/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiRequestDelegate.h"
#import "WiSeCoreNetworkConstants.h"

@class WiSeOperationQueue;
@class WiSeCloudApiRequest;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeCloudClearAPIRequestsInfo;

/*!
 @class WiSeOperationQueue
 
 @brief The core queue
 
 @discussion    This class was designed and implemented to manage API request operations.
 
 @superclass SuperClass: NSObject
 
 @classdesign It is a Singleton class.
 
 */

@interface WiSeNetworkManager : NSObject

/*!
 * @brief WiSeCloudApiRequestDelegate invoking callbacks .
 */
@property (nonatomic,weak) id <WiSeCloudApiRequestDelegate> delegate;

/*!
 * @brief WiSeOperationQueue that holds api operation requests.
 */
@property (nonatomic,retain) WiSeOperationQueue * operationQueue;

/*!
 * @brief maximumNumberOfCuncurrentOperations.
 */
@property (nonatomic,assign) int maximumNumberOfCuncurrentOperations;

/*!
 * @brief requestTimeout value.
 */
@property (nonatomic,assign) NSInteger requestTimeout;

/*!
 * @brief Call API using given Request.
 */
- (WiSeCloudAPIRequestRegisteredDetails *)callApiWithRequest:(WiSeCloudApiRequest *)apiRequest;

/*!
 * @brief Creates singleton object of NetworkManager.
 */
+ (id)sharedWiSeNetworkManager;

/*!
 * @brief Check Request Queue is Empty or Not.
 */

- (BOOL) isRequestQueueEmpty;

/*!
 * @brief Clear Request Queue.
 */

- (WiSeCloudClearAPIRequestsInfo *) clearRequestQueue;

/*!
 * @brief Remove requests from Queue with request Id.
 */

- (NSArray <WiSeCloudClearAPIRequestsInfo *> *) removeRequestsFromQueueWithListOfRequestId : (NSArray <NSNumber *> *) requestIds;

/*!
 * @brief Remove single request from Queue with request Id.
 */

- (WiSeCloudClearAPIRequestsInfo *) removeRequestFromQueueWithRequestId : (int) requestId;

@end
