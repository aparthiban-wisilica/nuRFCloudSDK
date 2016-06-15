//
//  WiSeAddGroupAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
#import "WiSeDashBoardItems.h"

@interface WiSeCloudGroupAPIRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeDashBoardItems *> * groupList;// Array of WiSeDashBoardItems

// Used Only A Single Group Delete
@property (nonatomic,assign) int                groupCloudId;

// Used In Get Group
@property (nonatomic,assign) double             start;
@property (nonatomic,assign) int                limit;


@end
