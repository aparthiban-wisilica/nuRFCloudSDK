//
//  WiSeCloudOrganizationInfo.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeCloudOrganizationInfo : NSObject

@property (nonatomic,assign) int      organizationId;
@property (nonatomic,assign) int      rootOrganizationId;
@property (nonatomic,copy  ) NSString * organizationName;
@property (nonatomic,assign) int      customerId;
@property (nonatomic,copy  ) NSString * message;
@property (nonatomic,assign) int      status;
@property (nonatomic,assign) double   timestamp;
@property (nonatomic,assign) int      permissionId;
@property (nonatomic,assign) int      networkId;

@property (nonatomic,assign) int      tempId;

@end
