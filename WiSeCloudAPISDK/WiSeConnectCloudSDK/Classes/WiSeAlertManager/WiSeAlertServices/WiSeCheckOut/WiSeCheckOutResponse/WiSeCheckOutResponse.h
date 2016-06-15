//
//  WiSeCheckOutResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"

@interface WiSeCheckOutResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int      statusCode;
@property (nonatomic,assign) int      tagId;
@property (nonatomic,assign) int      checkOutInterval;
@property (nonatomic,assign) int      action;
@property (nonatomic,assign) int      status;
@property (nonatomic,copy  ) NSString * message;

@end
