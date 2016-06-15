//
//  UserProfileAPIRequest.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 24/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"

@interface WiSeUpdateUserProfileAPIRequest : WiSeBaseRequest

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *emaiId;

@end
