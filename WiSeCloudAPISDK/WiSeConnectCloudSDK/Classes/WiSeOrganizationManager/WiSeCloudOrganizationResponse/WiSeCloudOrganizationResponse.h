//
//  WiSeCloudOrganizationResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
@class WiSeCloudOrganizationInfo;

@interface WiSeCloudOrganizationResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int                       statusCode;
@property (nonatomic,strong) NSArray <WiSeCloudOrganizationInfo *> * organizationList;// Array of WiSeCloudOrganizationInfo objects
@property (nonatomic,assign) int                       remainingOrganization;

@end
