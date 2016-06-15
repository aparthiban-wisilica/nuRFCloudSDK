//
//  WiSeCloudTagRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
@class WiSeCloudTagInfo;

@interface WiSeCloudTagRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeCloudTagInfo *> * tagsList;// Array of WiSeCloudTagInfo objects

// Used In Get
@property (nonatomic,assign) double           start;
@property (nonatomic,assign) int              limit;
@property (nonatomic,assign) int              tagType;

// Used In Single Delete
@property (nonatomic,assign) int              tagCloudId;

@end
