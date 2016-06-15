//
//  WiSeInfantServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudInfantRequest;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeAPIHeader;

@interface WiSeInfantServices : NSObject

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) addInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails*) getInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails*) getArchivedInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getInfantsFromOrganizationsApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails*) infantTagAssociationApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails*) addRuleApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails*) editRuleApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails*) getInfantPositionApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
