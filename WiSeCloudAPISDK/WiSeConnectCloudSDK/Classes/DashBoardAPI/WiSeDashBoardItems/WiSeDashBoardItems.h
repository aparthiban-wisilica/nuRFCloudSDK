//
//  WiSeDashBoardItems.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 27/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeDashBoardItems : NSObject

@property (nonatomic, assign) int      groupCloudId;
@property (nonatomic, strong) NSString * groupName;
@property (nonatomic, assign) int      groupIconId;
@property (nonatomic, assign) int      sensorStatus;// Need more clarity on this property
@property (nonatomic, assign) int      groupMeshId;
@property (nonatomic, assign) int      groupStatus;
@property (nonatomic, assign) int      groupSequenceNumber;
@property (nonatomic, copy  ) NSString * groupPath;
@property (nonatomic, assign) int      groupLevel;

@property (nonatomic, assign) int      parentGroupCloudId;
@property (nonatomic, assign) int      parentGroupMeshId;
@property (nonatomic, copy  ) NSString * parentGroupPath;

@property (nonatomic,assign) int      tempId;

@end
