//
//  WiSeSensorAssociationResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"
#import "WiSeCloudSensorItems.h"

@interface WiSeCloudSensorAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int statusCode;

@property (nonatomic,assign) int remainingSensorDeviceAssociation;

@property (nonatomic,strong) NSArray <WiSeCloudSensorItems *> * wiseSensorItemsList; // Array of WiSeSensorAssociationItems

@end
