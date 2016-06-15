//
//  WiSeShareAccept_RejectAPI.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>
#import <WiSeNetworkManager/WiSeAppError.h>
//#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>


@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeShareAccept_RejectAPIRequest;
@class WiSeShareAccept_RejectAPIResponse;

@protocol WiSeShareAccept_RejectAPIDelegate <NSObject>

- (void) shareAccept_RejectSuccessWithResponse : (WiSeShareAccept_RejectAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) shareAccept_RejectFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
@end

@interface WiSeShareAccept_RejectAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeShareAccept_RejectAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callShareAccept_RejectApiWithRequest : (WiSeShareAccept_RejectAPIRequest *) request ;

@end
