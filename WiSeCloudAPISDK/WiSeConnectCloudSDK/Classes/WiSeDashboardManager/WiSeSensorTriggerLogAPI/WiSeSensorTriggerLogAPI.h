//
//  WiSeSensorTriggerLogAPI.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 17/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>
#import <WiSeNetworkManager/WiSeAppError.h>

@class WiSeSensorTriggerLogAPIRequest;
@class WiSeSensorTriggerLogAPIResponse;
@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;

@protocol WiSeSensorTriggerLogAPIDelegate <NSObject>

- (void) sensorTriggerLogAPISuccessWithResponse : (WiSeSensorTriggerLogAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) sensorTriggerLogAPIFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end

@interface WiSeSensorTriggerLogAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeSensorTriggerLogAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callSensorTriggerLogApiWithRequest : (WiSeSensorTriggerLogAPIRequest *) request ;

@end
