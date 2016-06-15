//
//  WiSeMakeMultiSensorAPI.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 17/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeAppError.h>

@class WiSeMakeMultiSensorAPIRequest;
@class WiSeMakeMultiSensorAPIResponse;
@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;

@protocol WiSeMakeMultiSensorAPIDelegate <NSObject>

- (void) makeMultiSensorSuccessWithResponse : (WiSeMakeMultiSensorAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) makeMultiSensorFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
@end

@interface WiSeMakeMultiSensorAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeMakeMultiSensorAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callMakeMultiSensorApiWithRequest : (WiSeMakeMultiSensorAPIRequest *) request ;

@end
