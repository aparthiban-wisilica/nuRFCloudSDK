//
//  WiSeCloudInfantPositionInfo.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 07/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeCloudInfantPositionInfo : NSObject

@property (nonatomic,assign) double   timestamp;
@property (nonatomic,assign) int      tagId;
@property (nonatomic,assign) int      rssiValue;
@property (nonatomic,assign) int      listenerCloudId;
@property (nonatomic,assign) double   latitude;
@property (nonatomic,assign) double   longtitude;
@property (nonatomic,assign) int      confidenceLevel;
@property (nonatomic,assign) int      status;
@property (nonatomic,copy  ) NSString *  message;

@end
