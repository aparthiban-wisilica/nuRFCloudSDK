//
//  WiSeZoneManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 22/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeZoneManagerDelegate.h"

@class WiSeCloudZoneAPIRequest;
@class WiSeCloudZoneRules;
@class WiSeCloudAPIRequestDetails;
@class WiSeAPIHeader;
@class WiSeCloudAPIRequestRegisteredDetails;

@interface WiSeZoneManager : NSObject

@property (nonatomic,weak) id <WiSeZoneManagerDelegate> delegate;

/*!
 * @brief CMS APIs.
 */

- (WiSeCloudAPIRequestRegisteredDetails *) addZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedZoneApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getZonesFromOrganizationsApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) mapZoneAndListenerApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getZoneListenerMappingApiWithRequest : (WiSeCloudZoneAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
