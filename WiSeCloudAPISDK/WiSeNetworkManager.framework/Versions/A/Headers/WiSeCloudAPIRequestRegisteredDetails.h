//
//  WiSeCloudRequestRegisteredDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 16/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCoreNetworkConstants.h"

/*!
 @class WiSeCloudAPIRequestRegisteredDetails
 
 @brief Cloud API Request Registered Details
 
 @discussion    This class was designed and implemented to know about request registration status.
 
 @superclass SuperClass: NSObject
 
 @classdesign No special design is applied here.
 
 @coclass    Used Services class
 */

@interface WiSeCloudAPIRequestRegisteredDetails : NSObject


/*!
 * @brief requestRegisteredId Auto incremented integer value specifing request registration.
 */
@property (nonatomic,assign) int                       requestRegisteredId;

/*!
 * @brief requestStatus Request Status.
 */
@property (nonatomic,assign) WiSeCloudApiRequestStatus requestStatus;

/*!
 * @discussion Init method that inits WiSeCloudAPIRequestRegisteredDetails with all these parameters.
 * @param requestRegisteredId Auto incremented integer value specifing request registration.
 * @param requestStatus Request Status.
 * @return void.
 */

- (instancetype) initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId : (int) requestRegisteredId WithRequestStatus : (WiSeCloudApiRequestStatus) requestStatus;

@end
