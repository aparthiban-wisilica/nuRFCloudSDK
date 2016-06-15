//
//  WiSeSaveAppInfoAPIRequest.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"


@interface WiSeRegisterAppAPIRequest : WiSeBaseRequest

@property (nonatomic,copy  ) NSString * deviceId;
@property (nonatomic,copy  ) NSString * osInfo;
@property (nonatomic,copy  ) NSString * modelInfo;
@property (nonatomic,copy  ) NSString * deviceToken;
@property (nonatomic,assign) int      organizationId;
@property (nonatomic,copy  ) NSString * appVersion;

@end
