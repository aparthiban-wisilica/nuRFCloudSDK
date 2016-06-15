//
//  WiSeSensorTriggerMessageDetails.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 14/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import "WiSeOtherMessageBase.h"

@interface WiSeSensorTriggerMessageDetails : WiSeOtherMessageBase

@property (nonatomic,retain) NSData * applicationData;
@property (nonatomic,assign) int sequenceNumber;
//@property (nonatomic,assign) int messageStatus;

@end
