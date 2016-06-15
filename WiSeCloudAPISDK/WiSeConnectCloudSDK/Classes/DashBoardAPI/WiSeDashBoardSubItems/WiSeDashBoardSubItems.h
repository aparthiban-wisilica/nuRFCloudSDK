//
//  WiSeDashBoardSubItems.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 27/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"

@interface WiSeDashBoardSubItems : NSObject

@property (nonatomic, assign) NSInteger deviceCloudId;// Long Id
@property (nonatomic, assign) NSInteger deviceIconId;
@property (nonatomic, strong) NSString  * deviceName;
@property (nonatomic, strong) NSString  * deviceUUID;
@property (nonatomic, assign) NSInteger deviceType;
@property (nonatomic, assign) NSInteger sensorStatus;// Need more clarity on this property
@property (nonatomic, assign) NSInteger rgbRValue;
@property (nonatomic, assign) NSInteger rgbGValue;
@property (nonatomic, assign) NSInteger rgbBValue;
@property (nonatomic, assign) NSInteger intensityValue;
@property (nonatomic, assign) NSInteger warmCoolValue;
@property (nonatomic, strong) NSString  * devicePairString;
@property (nonatomic, strong) NSString  * hardwareVersion;
@property (nonatomic, strong) NSString  * softwareVersion;
@property (nonatomic, strong) NSString  * firmwareVersion;
@property (nonatomic, assign) NSString  * meshNetworkId;//base64 encoded NSData
@property (nonatomic, assign) BOOL      isFeedbackEnabled;
@property (nonatomic, assign) NSInteger isConnectable;


//
@property (nonatomic, assign) int       deviceMeshId;// Short Id
@property (nonatomic,strong ) NSString  * networkType;
@property (nonatomic,strong ) NSString  * deviceMac;

@property (nonatomic,assign ) int       triggerTimer;
@property (nonatomic,assign ) NSInteger deviceStatus;
@property (nonatomic,assign ) NSInteger nextStatus;
@property (nonatomic, assign) NSInteger batteryLevel;
@property (nonatomic, assign) NSInteger deviceSequenceNumber;


@end
