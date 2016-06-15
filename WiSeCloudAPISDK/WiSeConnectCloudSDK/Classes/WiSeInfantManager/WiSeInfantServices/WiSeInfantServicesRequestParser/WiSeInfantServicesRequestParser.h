//
//  WiSeInfantServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudInfantRequest;

@interface WiSeInfantServicesRequestParser : NSObject

+ (NSMutableArray *) createAddInfantApiParameters : (WiSeCloudInfantRequest *) request;

+ (NSMutableArray *) createEditInfantApiParameters : (WiSeCloudInfantRequest *) request;

+ (NSMutableArray *) createDeleteInfantApiParameters : (WiSeCloudInfantRequest *) request;

+ (NSMutableArray *) createInfantTagAssociationApiParameters : (WiSeCloudInfantRequest *) request;

+ (NSMutableArray *) createAddRuleApiParameters : (WiSeCloudInfantRequest *) request;

+ (NSMutableArray *) createGetInfantFromOrganizationApiParameters : (WiSeCloudInfantRequest *) request;

@end
