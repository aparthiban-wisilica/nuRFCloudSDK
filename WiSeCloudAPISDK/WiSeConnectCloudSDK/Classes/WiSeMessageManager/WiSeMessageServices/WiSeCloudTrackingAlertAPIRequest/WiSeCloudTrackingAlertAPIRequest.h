//
//  WiSeCloudTrackingAlertAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 26/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"

@class WiSeCloudTrackingAlertDetails;

@interface WiSeCloudTrackingAlertAPIRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeCloudTrackingAlertDetails *> * trackingAlertsList;// Array of WiSeCloudTrackingAlertDetails

@property (nonatomic,assign) int                           alertType;
@property (nonatomic,assign) int                           infantCloudId;

// Used In Get
@property (nonatomic,assign) double                        start;
@property (nonatomic,assign) int                           limit;

@end
