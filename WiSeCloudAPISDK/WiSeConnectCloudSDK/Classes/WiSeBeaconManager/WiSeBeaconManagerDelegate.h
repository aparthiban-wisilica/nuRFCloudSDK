//
//  WiSeBeaconManagerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 14/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;


@protocol WiSeBeaconManagerDelegate <NSObject>

- (void) beaconMangerAPICallSuccessWithResponse : (id) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) beaconMangerAPICallFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end
