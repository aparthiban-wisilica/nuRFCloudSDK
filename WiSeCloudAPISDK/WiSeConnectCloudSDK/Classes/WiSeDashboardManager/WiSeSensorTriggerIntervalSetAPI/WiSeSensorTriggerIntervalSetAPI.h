//
//  WiSeSensorTriggerIntervalSetAPI.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 17/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeAppError.h>

@class WiSeSensorTriggerIntervalSetAPIRequest;
@class WiSeSensorTriggerIntervalSetAPIResponse;
@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;

@protocol WiSeSensorTriggerIntervalSetAPIDelegate <NSObject>

- (void) sensorTriggerIntervalSetSuccessWithResponse : (WiSeSensorTriggerIntervalSetAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) sensorTriggerIntervalSetFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end

@interface WiSeSensorTriggerIntervalSetAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeSensorTriggerIntervalSetAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callSensorTriggerIntervalSetApiWithRequest : (WiSeSensorTriggerIntervalSetAPIRequest *) request ;

@end
