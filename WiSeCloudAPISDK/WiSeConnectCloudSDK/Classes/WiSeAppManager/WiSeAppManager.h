//
//  WiSeAppManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAppManagerDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeAppError;

@class WiSeRegisterAppAPIRequest;
@class WiSeAPIHeader;

@interface WiSeAppManager : NSObject

@property (nonatomic,weak) id <WiSeAppManagerDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) registerAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request;

- (WiSeCloudAPIRequestRegisteredDetails *) updateRegisterAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request ;

/*!
 * @brief CMS APIs.
 */

- (WiSeCloudAPIRequestRegisteredDetails *) registerAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) updateRegisterAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
