//
//  WiSeOperationQueue.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 19/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @class WiSeOperationQueue
 
 @brief The core queue
 
 @discussion    This class was designed and implemented to manage API request operations.
 
 @superclass SuperClass: NSObject
 
 @classdesign No special design is applied here.
 
 @coclass    WiSeOperation
*/

@interface WiSeOperationQueue : NSObject

/*!
* @brief queue which is an array where operations are managed.
*/
@property (nonatomic,strong) NSMutableArray * queue;

/*!
 * @brief maxConcurrentOperations that can be executed by queue.
 */
@property (nonatomic,assign) int            maxConcurrentOperations;

/*!
 * @brief maxQueueSize Size of array, we set it as 20 for now.
 */
@property (nonatomic,assign) int            maxQueueSize;

@end
