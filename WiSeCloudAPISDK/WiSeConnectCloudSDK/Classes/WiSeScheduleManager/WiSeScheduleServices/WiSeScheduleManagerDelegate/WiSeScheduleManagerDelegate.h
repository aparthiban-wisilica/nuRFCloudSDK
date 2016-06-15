//
//  WiSeScheduleManagerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@protocol WiSeScheduleManagerDelegate <NSObject>

- (void) scheduleManagerServiceCallSuccessfulWithResponse : (id) response WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) scheduleManagerServiceCallFailedWithError : (WiSeAppError *) error WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;


@end
