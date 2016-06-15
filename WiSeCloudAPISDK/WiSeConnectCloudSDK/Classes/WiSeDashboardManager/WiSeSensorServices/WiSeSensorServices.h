//
//  WiSeSensorServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 03/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeCloudSensorAPIRequest;
@class WiSeSensorTriggerLogAPIRequest;
@class WiSeSensorTriggerIntervalSetAPIRequest;
@class WiSeMakeMultiSensorAPIRequest;

@interface WiSeSensorServices : NSObject 

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) sensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getSensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedSensorAssociationApiWithRequest : (WiSeCloudSensorAPIRequest *) request;

- (WiSeCloudAPIRequestRegisteredDetails *) sensorTriggerLogApiWithRequest : (WiSeCloudSensorAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) sensorTriggerIntervelSetApiWithRequest : (WiSeSensorTriggerIntervalSetAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) makeMultiSensorApiWithRequest : (WiSeMakeMultiSensorAPIRequest *) request ;

@end
