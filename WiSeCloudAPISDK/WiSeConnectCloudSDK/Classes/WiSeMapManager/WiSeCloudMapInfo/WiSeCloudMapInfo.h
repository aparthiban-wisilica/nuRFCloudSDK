//
//  WiSeCloudMapInfo.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WiSeCloudMapBoundaries;

@interface WiSeCloudMapInfo : NSObject

@property (nonatomic,copy  ) NSString * version;
@property (nonatomic,copy  ) NSString * fileName;
@property (nonatomic,copy  ) NSString * filePath;
@property (nonatomic,strong) NSArray  <WiSeCloudMapBoundaries *>* mapBoundaries;
@property (nonatomic,assign) int      scalingFactor;
@property (nonatomic,assign) int      fileSize;
@property (nonatomic,assign) int      status;
@property (nonatomic,copy  ) NSString * layerId;

@end
