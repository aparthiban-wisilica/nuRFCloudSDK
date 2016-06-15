//
//  ForgotPasswordAPIRequest.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 24/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"

@interface WiSeForgotPasswordAPIRequest : WiSeBaseRequest

@property (nonatomic, strong) NSString *userName;
@property (nonatomic,assign ) int      organizationId;

@end
