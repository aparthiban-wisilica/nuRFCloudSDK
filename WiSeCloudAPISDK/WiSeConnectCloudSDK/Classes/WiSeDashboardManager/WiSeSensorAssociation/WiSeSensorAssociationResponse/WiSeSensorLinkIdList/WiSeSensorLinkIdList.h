//
//  WiSeSensorLinkIdList.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeSensorLinkIdList : NSObject

@property (nonatomic,assign) int      deviceId;
@property (nonatomic,assign) BOOL     status;
@property (nonatomic,copy  ) NSString * message;

@end
