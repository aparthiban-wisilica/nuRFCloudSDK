//
//  WiSeCloudMapAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"

@class WiSeCloudMapInfo;

@interface WiSeCloudMapAPIResponse : WiSeCloudApiResponse

//@property (nonatomic,retain) WiSeCloudMapInfo * mapInfo;
@property (nonatomic,retain) NSArray <WiSeCloudMapInfo *> * mapInfoList;
@property (nonatomic,assign) int  statusCode;

@end
