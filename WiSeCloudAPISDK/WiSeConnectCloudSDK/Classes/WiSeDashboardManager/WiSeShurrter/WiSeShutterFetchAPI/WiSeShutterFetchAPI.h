//
//  WiSeShutterFetchAPI.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 21/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>

@class WiSeShutterFetchAPIRequest;
@class WiSeShutterFetchAPIResponse;
@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;

@protocol WiSeShutterFetchAPIDelegate <NSObject>

- (void) shutterFetchSuccessWithResponse : (WiSeShutterFetchAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) shutterFetchFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end

@interface WiSeShutterFetchAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeShutterFetchAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callShutterFetchApiWithRequest : (WiSeShutterFetchAPIRequest *) request ;


@end
