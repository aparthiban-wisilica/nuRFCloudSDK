//
//  WiSeCloudTagInfo.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeCloudTagInfo : NSObject

@property (nonatomic,assign) int      tagCloudId;
@property (nonatomic,assign) int      tagMeshId;
@property (nonatomic,assign) int      tagMajor;
@property (nonatomic,assign) int      tagMinor;
@property (nonatomic,assign) int      status;
@property (nonatomic,copy  ) NSString * tagName;
@property (nonatomic,copy  ) NSString * message;
@property (nonatomic,assign) double   timestamp;
@property (nonatomic,assign) int      organizationId;
@property (nonatomic,copy  ) NSString * deviceUUID;
@property (nonatomic,copy  ) NSString * deviceSecurityKey;
@property (nonatomic,copy  ) NSString * devicePairingKey;
@property (nonatomic,copy  ) NSString * customerId;
@property (nonatomic,strong) NSData   * networkKey;
@property (nonatomic,assign) int      txPower;
@property (nonatomic,assign) int      advInterval;
@property (nonatomic,assign) int      channel;
@property (nonatomic,assign) int      active;
@property (nonatomic,strong) NSString  * layerId;

@property (nonatomic,assign) int      tempId;

@end
