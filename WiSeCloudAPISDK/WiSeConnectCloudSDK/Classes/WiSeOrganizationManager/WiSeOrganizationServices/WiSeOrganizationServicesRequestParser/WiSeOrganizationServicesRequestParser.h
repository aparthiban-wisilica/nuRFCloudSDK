//
//  WiSeOrganizationServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudOrganizationRequest;

@interface WiSeOrganizationServicesRequestParser : NSObject

+ (NSMutableArray *) createAddOrganizationApiParameters : (WiSeCloudOrganizationRequest *)    request;

+ (NSMutableArray *) createEditOrganizationApiParameters : (WiSeCloudOrganizationRequest *)   request;

+ (NSMutableArray *) createDeleteOrganizationApiParameters : (WiSeCloudOrganizationRequest *) request;

@end
