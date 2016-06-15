//
//  WiSeGroupDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 28/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeDashBoardItems.h"

@interface WiSeGroupDetails : WiSeDashBoardItems

@property (nonatomic,assign) double   timeStamp;
@property (nonatomic,copy  ) NSString * message;
@property (nonatomic,assign) int      status;

@end
