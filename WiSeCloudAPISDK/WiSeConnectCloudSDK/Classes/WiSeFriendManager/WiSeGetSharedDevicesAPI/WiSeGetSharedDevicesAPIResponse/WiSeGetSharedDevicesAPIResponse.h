//
//  WiSeGetSharedDevicesAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeGetSharedDevicesAPIResponse : NSObject

@property (nonatomic,assign) BOOL     status;
@property (nonatomic,copy  ) NSString * message;
@property (nonatomic,strong) NSArray  * sharedDevicesDetailsList;

@end
