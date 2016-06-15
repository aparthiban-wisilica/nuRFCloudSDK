//
//  WiSeCloudClearAPIRequests.h
//  WiSeNetworkManager
//
//  Created by Ashok Parthiban D on 16/03/16.
//  Copyright © 2016 WiSilica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCoreNetworkConstants.h"

/*!
 @class WiSeCloudClearAPIRequestsInfo
 
 @brief The response for remove request
 
 @discussion    This class was designed and implemented to hold the remove request.
 
 @superclass SuperClass: NSObject
 
 @classdesign Not Singleton.
 
 */

@interface WiSeCloudClearAPIRequestsInfo : NSObject

/*!
 * @brief WiSeCloudApiRequestStatus request status .
 */

@property (nonatomic,assign) WiSeCloudApiRequestStatus requestStatus;

/*!
 * @brief Message about request remove.
 */

@property (nonatomic,copy) NSString * statusMessage;

/*!
 * @brief Request Id.
 */

@property (nonatomic,assign) int requestId;

@end
