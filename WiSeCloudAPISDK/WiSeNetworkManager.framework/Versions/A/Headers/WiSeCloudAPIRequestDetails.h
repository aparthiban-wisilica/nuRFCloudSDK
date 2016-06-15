//
//  WiSeCloudAPIRequestDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 14/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCoreNetworkConstants.h"

/*!
 @class WiSeCloudAPIRequestDetails
 
 @brief Cloud API Request Details
 
 @discussion    This class was designed and implemented to contain request details.
 
 @superclass SuperClass: NSObject
 
 @classdesign No special design is applied here.
 
 @coclass    WiSeOperation
 */

@interface WiSeCloudAPIRequestDetails : NSObject

/*!
 * @brief Modal API Request (e.g) WiSeLoginRequest.
 */
@property (nonatomic,strong) id request;

/*!
 * @brief Auto incremented integer value specifing request registration.
 */
@property (nonatomic,assign) int requestId;

/*!
 * @brief Request Status.
 */
@property (nonatomic,assign) WiSeCloudApiRequestStatus requestStatus;

/*!
 * @brief Name of the API for which the request belongs too.
 */
@property (nonatomic,assign) int  apiId;

/*!
 * @discussion Init method that inits the object with all these parameters.
 * @param request Modal API Request (e.g) WiSeLoginRequest.
 * @param requestId Auto incremented integer value specifing request registration.
 * @param requestStatus Request Status.
 * @param apiCallName Name of the API for which the request belongs too.
 * @return void.
 */

- (instancetype) initRequestDetailsWithRequest : (id) request withRequestId : (int) requestId withRequestStatus : (WiSeCloudApiRequestStatus) requestStatus withAPICallName : (int) apiCallName;

@end
