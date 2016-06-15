//
//  WiSeUserManagerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 20/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@protocol WiSeUserManagerDelegate <NSObject>

- (void) userManagerServiceCallSuccessfulWithResponse : (id) response WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) userManagerServiceCallFailedWithError : (WiSeAppError *) error WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end
