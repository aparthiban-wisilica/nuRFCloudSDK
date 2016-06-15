//
//  WiSeSensorTriggerLogDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 17/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeSensorTriggerLogDetails : NSObject

@property (nonatomic,assign) BOOL      status;
@property (nonatomic,assign) NSInteger sensorCloudId;
@property (nonatomic,copy  ) NSString  * message;
@property (nonatomic,assign) BOOL      notificationStatus;

@end
