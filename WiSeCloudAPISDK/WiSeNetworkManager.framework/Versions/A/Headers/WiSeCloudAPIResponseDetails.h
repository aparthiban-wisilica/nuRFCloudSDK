//
//  WiSeCloudAPIResponseDetails.h
//  WiSeNetworkManager
//
//  Created by Ashok Parthiban D on 26/01/16.
//  Copyright © 2016 WiSilica. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeAppError;


/*!
 @class WiSeCloudAPIResponseDetails
 
 @brief Cloud API Response Details
 
 @discussion    This class was designed and implemented to contain response details.
 
 @superclass SuperClass: NSObject
 
 @classdesign No special design is applied here.
 
 @coclass    WiSeNetworkManager
 */

@interface WiSeCloudAPIResponseDetails : NSObject

/*!
 * @brief NSData that was received after request execution.
 */
@property (nonatomic,retain) NSData * responseData;

/*!
 * @brief NSURLResponse that was received after request execution.
 */
@property (nonatomic,retain) NSURLResponse * urlResponse;

/*!
 * @brief error incase of any issue.
 */
@property (nonatomic,retain) WiSeAppError * error;

/*!
 * @brief HTTP response status code.
 */
@property (nonatomic,assign) NSInteger statusCode;

/*!
 * @brief Total time taken for performing a request.
 */
@property (nonatomic,assign) NSTimeInterval executionTime;


/*!
 * @discussion Init method that inits WiSeCloudAPIResponseDetails.
*/

- (instancetype) initWiSeCloudAPIResponseDetailsWithResponseData : (NSData *) responseData WithURLResponse : (NSURLResponse *) urlResponse  withError : (WiSeAppError *) error WithExecutionTime : (NSTimeInterval) executionTime;

@end
