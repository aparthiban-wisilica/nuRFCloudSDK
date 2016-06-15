//
//  WiSeShareCreate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>
#import <WiSeNetworkManager/WiSeAppError.h>
@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeShareCreateAPIRequest;
@class WiSeShareCreateAPIResponse;

@protocol WiSeShareCreateAPIDelegate <NSObject>

- (void) createShareSuccessWithResponse : (WiSeShareCreateAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) createShareFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end

@interface WiSeShareCreateAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeShareCreateAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callCreateShareApiWithRequest : (WiSeShareCreateAPIRequest *) request ;


@end
