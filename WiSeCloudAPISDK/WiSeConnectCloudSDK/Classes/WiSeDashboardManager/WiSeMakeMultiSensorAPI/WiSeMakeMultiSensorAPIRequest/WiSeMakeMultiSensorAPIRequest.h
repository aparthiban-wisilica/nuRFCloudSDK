//
//  WiSeMakeMultiSensorAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 17/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import "WiSeBaseRequest.h"

@interface WiSeMakeMultiSensorAPIRequest : WiSeBaseRequest

@property (nonatomic, assign) int                       callFor;
@property (nonatomic, assign) MultiSensorOperationTypes operationId;
@property (nonatomic, assign) int                       sequenceNumber;
@property (nonatomic, assign) WiSeItemType              wiseItemType;
@property (nonatomic, assign) NSInteger                 deviceCloudId;
@property (nonatomic, assign) NSInteger                 deviceType;
@property (nonatomic, assign) NSInteger                 status;



@end
