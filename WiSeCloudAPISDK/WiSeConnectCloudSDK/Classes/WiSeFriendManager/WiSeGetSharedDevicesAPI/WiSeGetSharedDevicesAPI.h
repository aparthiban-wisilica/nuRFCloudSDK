//
//  WiSeGetSharedDevicesAPI.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>
#import <WiSeNetworkManager/WiSeAppError.h>
@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeGetSharedDevicesAPIResponse;
@class WiSeGetSharedDevicesAPIRequest;

@protocol WiSeGetSharedDevicesAPIDelegate <NSObject>

- (void) getSharedDevicesSuccessWithResponse : (WiSeGetSharedDevicesAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) getSharedDevicesFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end

@interface WiSeGetSharedDevicesAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeGetSharedDevicesAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callGetSharedDevicesApiWithRequest : (WiSeGetSharedDevicesAPIRequest *) request ;


@end
