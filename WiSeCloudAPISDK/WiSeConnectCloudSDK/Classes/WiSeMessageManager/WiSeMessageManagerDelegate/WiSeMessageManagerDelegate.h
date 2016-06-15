//
//  WiSeMessageManagerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 10/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@protocol WiSeMessageManagerDelegate <NSObject>

- (void) messageManagerServiceCallSuccessfulWithResponse : (id) response WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

- (void) messageManagerServiceCallFailedWithError : (WiSeAppError *) error WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end
