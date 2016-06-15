//
//  WiSeListRolesAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeRoleInfo.h"

@interface WiSeListRolesAPIResponse : WiSeCloudApiResponse

@property (nonatomic,strong) NSArray <WiSeRoleInfo *> * rolesList;
@property (nonatomic,assign) int          statusCode;

@end
