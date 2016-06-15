//
//  WiSeCloudBeaconDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBeaconItem.h"

@interface WiSeCloudBeaconDetails : WiSeBeaconItem

@property (nonatomic,copy) NSString * message;
@property (nonatomic,assign) int status;

@property (nonatomic,assign) double timeStamp;

@property (nonatomic,assign) int      tempId;

@end
