//
//  WiSeCloudTrackingAlertAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 26/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
@class WiSeCloudTrackingAlertDetails;

@interface WiSeCloudTrackingAlertAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int                           statusCode;

@property (nonatomic,strong) NSArray <WiSeCloudTrackingAlertDetails *> * trackingAlertsList;// Array of WiSeCloudTrackingAlertDetails

@property (nonatomic,assign) int                           remainingAlerts;

@end
