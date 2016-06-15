//
//  WiSeShutterUpdateAPI.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 21/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>
@class WiSeShutterUpdateAPIRequest;
@class WiSeShutterUpdateAPIResponse;
@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;

@protocol WiSeShutterUpdateAPIDelegate <NSObject>

- (void) shutterUpdateSuccessWithResponse : (WiSeShutterUpdateAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) shutterUpdateFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end

@interface WiSeShutterUpdateAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeShutterUpdateAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callShutterUpdateApiWithRequest : (WiSeShutterUpdateAPIRequest *) request ;

@end
