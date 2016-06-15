//
//  WiSeOrganizationServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeCloudOrganizationRequest;
@class WiSeAPIHeader;

@interface WiSeOrganizationServices : NSObject

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) addOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getOrganizationApiWithRequest : (WiSeCloudOrganizationRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
