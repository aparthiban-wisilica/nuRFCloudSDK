//
//  WiSeBridgeManagerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@protocol WiSeBridgeManagerDelegate <NSObject>

- (void) bridgeManagerServiceCallSuccessfulWithResponse : (id) response WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) bridgeManagerServiceCallFailedWithError : (WiSeAppError *) error WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end
