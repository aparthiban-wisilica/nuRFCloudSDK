//
//  WiSeInfantManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeInfantManagerDelegate.h"

@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeCloudInfantRequest;
@class WiSeAPIHeader;

@interface WiSeInfantManager : NSObject

@property (nonatomic,weak) id <WiSeInfantManagerDelegate> delegate;

/*!
 * @brief CMS APIs.
 */


- (WiSeCloudAPIRequestRegisteredDetails *) addInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) infantTagAssociationApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) addRuleApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editRuleApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getInfantsFromOrganizationsApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails*) getArchivedInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails*) getInfantPositionApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
