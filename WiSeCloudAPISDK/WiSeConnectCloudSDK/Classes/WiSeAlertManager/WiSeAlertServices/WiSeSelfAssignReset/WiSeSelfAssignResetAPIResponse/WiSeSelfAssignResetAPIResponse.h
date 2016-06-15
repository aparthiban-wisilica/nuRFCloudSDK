//
//  WiSeSelfAssignResetAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"

@interface WiSeSelfAssignResetAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int      statusCode;
@property (nonatomic,assign) int      status;
@property (nonatomic,assign) int      tagCloudId;
@property (nonatomic,assign) int      messageId;
@property (nonatomic,copy  ) NSString * assignName;
@property (nonatomic,copy  ) NSString * message;

@end
