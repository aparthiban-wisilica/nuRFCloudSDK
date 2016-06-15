//
//  WiSeCloudBeaconAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeCloudBeaconDetails.h"

@interface WiSeCloudBeaconAPIResponse : WiSeCloudApiResponse

@property (nonatomic,strong) NSArray <WiSeCloudBeaconDetails *> * beaconsList;// Array of WiSeCloudBeaconDetails
@property (nonatomic,assign) int                    statusCode;

@property (nonatomic,assign) int                    remainingCount;

// Used in Beacon Data Log
@property (nonatomic,assign) int                    phoneCloudId;
@property (nonatomic,assign) int                    status;
@property (nonatomic,copy  ) NSString               * message;

@end
