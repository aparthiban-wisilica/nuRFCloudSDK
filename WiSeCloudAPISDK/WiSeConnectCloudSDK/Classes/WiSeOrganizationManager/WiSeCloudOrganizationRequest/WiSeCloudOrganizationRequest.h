//
//  WiSeCloudOrganizationRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WiSeBaseRequest.h"
@class WiSeCloudOrganizationInfo;

@interface WiSeCloudOrganizationRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeCloudOrganizationInfo *> * organizationList;// Array of WiSeCloudOrganizationInfo objects

// Used In Get
@property (nonatomic,assign) double                    start;
@property (nonatomic,assign) int                       limit;

@property (nonatomic,assign) int                       organizationId;// Used in sigle delete


@end
