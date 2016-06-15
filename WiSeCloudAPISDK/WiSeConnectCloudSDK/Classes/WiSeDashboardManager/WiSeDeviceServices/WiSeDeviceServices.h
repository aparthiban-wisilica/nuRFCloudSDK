//
//  WiSeDeviceServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 29/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeCloudDeviceAPIRequest;
@class WiSeAPIHeader;
@class WiSeCloudListenerAPIRequest;

@interface WiSeDeviceServices : NSObject

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) addDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) editDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getADeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getAllDeviceAgainstUserApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getAllDevicesAgainstAGroupApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedDevicesApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getSecureDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) clearSecureDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

// Device Group Association

- (WiSeCloudAPIRequestRegisteredDetails *) deviceGroupAssociationApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getDeviceGroupAssociationApiWithRequest : (WiSeCloudDeviceAPIRequest *) request ;

/*!
 * @brief CMS APIs.
 */

- (WiSeCloudAPIRequestRegisteredDetails *) addDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getAllDeviceAgainstUserApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedDeviceApiWithRequest : (WiSeCloudDeviceAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getListenersAgainstUserApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getListenerZoneMappingApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getListenersFromOrganizationsApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) addListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) addSecureListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteSecureListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteListenerApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedListenersApiWithRequest : (WiSeCloudListenerAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
