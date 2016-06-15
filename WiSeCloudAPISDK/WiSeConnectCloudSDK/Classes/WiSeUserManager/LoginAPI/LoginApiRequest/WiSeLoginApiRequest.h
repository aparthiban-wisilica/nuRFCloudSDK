//
//  LoginApiRequest.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 23/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"

@interface WiSeLoginApiRequest : WiSeBaseRequest

@property (nonatomic,copy  ) NSString * userName;
@property (nonatomic,copy  ) NSString * password;
@property (nonatomic,assign) int      userType;
@property (nonatomic,assign) int      organizationId;


@end
