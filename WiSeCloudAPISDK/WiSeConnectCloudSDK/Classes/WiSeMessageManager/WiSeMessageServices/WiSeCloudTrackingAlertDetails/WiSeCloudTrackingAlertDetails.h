//
//  WiSeCloudTrackingAlertDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 26/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeCloudTrackingAlertDetails : NSObject

@property (nonatomic,assign) int      messageId;
@property (nonatomic,assign) int      messageType;
@property (nonatomic,assign) int      tagCloudId;
@property (nonatomic,assign) int      tagMeshId;
@property (nonatomic,assign) int      batteryLevel;
@property (nonatomic,assign) int      status;
@property (nonatomic,assign) int      infantCloudId;
@property (nonatomic,assign) int      subOrganizationId;
@property (nonatomic,assign) double   latitude;
@property (nonatomic,assign) double   longtitude;
@property (nonatomic,assign) double   timestamp;
@property (nonatomic,copy  ) NSString * message;
@property (nonatomic,copy  ) NSString * tagName;
@property (nonatomic,copy  ) NSString * layerId;
@property (nonatomic,copy  ) NSString * extraMessage;
@property (nonatomic,copy  ) NSString * infantName;

@end
