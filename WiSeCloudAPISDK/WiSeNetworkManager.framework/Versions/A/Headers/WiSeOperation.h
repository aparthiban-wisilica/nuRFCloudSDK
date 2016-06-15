//
//  WiSeOperation.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 19/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WiSeCoreNetworkConstants.h"

@class WiSeCloudApiRequest;

/*!
 @class WiSeOperation
 
 @brief Operation details
 
 @discussion    This class was designed and implemented to perform API request from the Queue.
 
 @superclass SuperClass: NSObject
 
 @classdesign No special design is applied here.
 
 @coclass    WiSeOperationQueue
*/

@interface WiSeOperation : NSObject

/*!
 * @brief apiRequest object of WiSeCloudApiRequest.
 */
@property (nonatomic,retain) WiSeCloudApiRequest         * apiRequest;

/*!
 * @brief operationRegisteredTime Time of operation registeration in Queue.
 */
@property (nonatomic,retain) NSDate                      * operationRegisteredTime;

/*!
 * @brief operationCompletedTime Time of operation completion.
 */
@property (nonatomic,retain) NSDate                      * operationCompletedTime;

/*!
 * @brief totalTimeTaken Time taken for operation execution.
 */
@property (nonatomic,assign) NSTimeInterval              totalTimeTaken;

/*!
 * @brief retryCount Retry cout of operation.
 */
@property (nonatomic,assign) int                         retryCount;

/*!
 * @brief priority Operation Priority.
 */
@property (nonatomic,assign) WiSeCloudApiRequestPriority priority;

/*!
 * @brief requestStatus Request Status.
 */
@property (nonatomic,assign) WiSeCloudApiRequestStatus   requestStatus;

/*!
 * @brief requestRegisteredId Unique registered id for each API request.
 */
@property (nonatomic,assign) int                         requestRegisteredId;


/*!
 * @discussion Init method that inits WiSeOperation with all these parameters.
 * @param apiRequest Modal API Request (e.g) WiSeLoginRequest.
 * @param requestId Auto incremented integer value specifing request registration.
 * @return WiSeOperation.
 */

- (instancetype)initWithDefaultValuesAndWithCloudApiRequest : (WiSeCloudApiRequest *) apiRequest WithRegisteredId : (int) registeredId;

@end
