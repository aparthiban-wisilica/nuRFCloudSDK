//
//  WiSeRequestForRemoreOperationAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>
#import "WiSeBaseRequest.h"

@class WiSeDirectRemoteOperationDetails;

@interface WiSeRequestForRemoteOperationAPIRequest : WiSeBaseRequest

//@property (nonatomic,assign) int device_groupCloudId;
//@property (nonatomic,assign) WiSeItemType itemType;
//@property (nonatomic,assign) int operationId;
//@property (nonatomic,copy) NSString * coolValue;
//@property (nonatomic,copy) NSString * intensity;

@property (nonatomic,retain) WiSeDirectRemoteOperationDetails * requestInfo;

// Not Used Now
@property (nonatomic,strong) NSMutableArray                   * wiseRequestForRemoteOperationRequestDetailsList;

@end
