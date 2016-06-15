//
//  WiSeOperationManagerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@protocol WiSeOperationManagerDelegate <NSObject>

- (void) operationManagerServiceCallSuccessfulWithResponse : (id) response WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

- (void) operationManagerServiceCallFailedWithError : (WiSeAppError *) error WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end
