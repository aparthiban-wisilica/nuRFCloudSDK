//
//  ChangePasswordApiRequest.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 24/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"

@interface WiSeChangePasswordApiRequest : WiSeBaseRequest

@property (nonatomic, strong) NSString *oldPassword;
@property (nonatomic, strong) NSString *changedPassword;

@end
