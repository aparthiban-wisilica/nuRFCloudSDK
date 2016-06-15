//
//  UserProfileAPIResponse.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 24/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"

@interface WiSeUpdateUserProfileAPIResponse : WiSeCloudApiResponse

@property (nonatomic, assign) BOOL     status;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) int      statusCode;

@end
