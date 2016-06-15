//
//  WiSeMapManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeMapManagerDelegate.h"

@class WiSeCloudAPIRequestDetails;
@class WiSeAPIHeader;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeCloudMapAPIRequest;

@interface WiSeMapManager : NSObject

@property (nonatomic,weak) id <WiSeMapManagerDelegate> delegate;

/*!
 * @brief CMS APIs.
 */

- (WiSeCloudAPIRequestRegisteredDetails *) getMapSettingsApiWithRequest : (WiSeCloudMapAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
