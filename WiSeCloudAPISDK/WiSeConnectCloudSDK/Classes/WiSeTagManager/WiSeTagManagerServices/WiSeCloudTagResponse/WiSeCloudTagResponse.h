//
//  WiSeCloudTagResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
@class WiSeCloudTagInfo;

@interface WiSeCloudTagResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int statusCode;
@property (nonatomic,assign) int remainingTags;
@property (nonatomic,strong) NSArray <WiSeCloudTagInfo *> * tagsList; // Array of WiSeCloudTagInfo


@end
