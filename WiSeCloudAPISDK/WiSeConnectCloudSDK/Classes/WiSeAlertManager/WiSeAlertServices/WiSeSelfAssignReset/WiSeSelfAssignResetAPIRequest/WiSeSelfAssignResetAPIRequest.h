//
//  WiSeSelfAssignResetAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"

@interface WiSeSelfAssignResetAPIRequest : WiSeBaseRequest

@property (nonatomic,assign) int      tagCloudId;
@property (nonatomic,assign) int      messageId;
@property (nonatomic,copy  ) NSString * assignName;

@end
