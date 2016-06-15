//
//  WiSeRoleInfo.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeRoleInfo : NSObject

@property (nonatomic,assign) int      roleId;
@property (nonatomic,assign) int      permissionId;
@property (nonatomic,copy  ) NSString * roleName;

@end
