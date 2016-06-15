//
//  WiseRequestForRemoteOperationRequestDetails.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"

@interface WiseRequestForRemoteOperationRequestDetails : NSObject

@property (nonatomic,assign) int          device_groupCloudId;
@property (nonatomic,assign) WiSeItemType itemType;
@property (nonatomic,assign) int          operationId;
@property (nonatomic,copy  ) NSString     * coolValue;
@property (nonatomic,copy  ) NSString     * intensity;

@end
