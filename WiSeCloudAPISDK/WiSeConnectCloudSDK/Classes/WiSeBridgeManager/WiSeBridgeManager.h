//
//  WiSeBridgeManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBridgeManagerDelegate.h"

@class WiSeCloudAPIRequestDetails;
@class WiSeAPIHeader;
@class WiSeCloudAPIRequestRegisteredDetails;

@interface WiSeBridgeManager : NSObject

@property (nonatomic,weak) id <WiSeBridgeManagerDelegate> delegate;

/*!
 * @brief CMS APIs.
 */

//- (WiSeCloudAPIRequestRegisteredDetails *) getMapSettingsApiWithRequest : (WiSeCloudMapAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
