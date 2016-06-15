//
//  WiSeOrganizationManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeOrganizationManagerDelegate.h"

@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeCloudOrganizationRequest;
@class WiSeAPIHeader;


@interface WiSeOrganizationManager : NSObject

@property (nonatomic,weak) id <WiSeOrganizationManagerDelegate> delegate;

/*!
 * @brief CMS APIs.
 */

- (WiSeCloudAPIRequestRegisteredDetails *) addOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header;


@end
