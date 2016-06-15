//
//  WiSeOperationMessageDetails.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 14/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"

@interface WiSeOperationMessageDetails : NSObject

@property (nonatomic,assign) int          messageId;
@property (nonatomic,assign) int          messageStatus;
@property (nonatomic,assign) int          status;
@property (nonatomic,assign) int          operationLogId;
@property (nonatomic,assign) int          operationId;
@property (nonatomic,assign) WiSeItemType wiseItemType;
@property (nonatomic,copy  ) NSString     * encData;
@property (nonatomic,copy  ) NSString     * encBridgeData;
@property (nonatomic,copy  ) NSString     * encKey;
@property (nonatomic,assign) int          device_groupMeshId;
@property (nonatomic,assign) int          device_groupCloudId;
@property (nonatomic,copy  ) NSString     * uuid;
@property (nonatomic,assign) int          sequenceNumber;
@property (nonatomic,copy  ) NSString     * bridgeData;
@property (nonatomic,assign) double       timestamp;
@property (nonatomic,assign) int          operatePhoneLongId;
@property (nonatomic,retain) NSDate       * time;


@end
