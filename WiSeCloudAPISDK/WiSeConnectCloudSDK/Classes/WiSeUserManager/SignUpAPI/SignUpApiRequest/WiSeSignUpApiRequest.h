//
//  SignUpApiRequest.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 17/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
#import "WiSeCloudOrganizationInfo.h"

@interface WiSeSignUpApiRequest : WiSeBaseRequest

@property (nonatomic,copy  ) NSString * userName;
@property (nonatomic,copy  ) NSString * userEmail;
@property (nonatomic,copy  ) NSString * userDisplayName;
@property (nonatomic,copy  ) NSString * userPassword;
@property (nonatomic,assign) int      userType;
@property (nonatomic,assign) int      orgId;

@end
