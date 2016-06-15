//
//  WiSeDashboardManagerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 20/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeAppError;
@class WiSeCloudAPIRequestDetails;

@protocol WiSeDashboardManagerDelegate <NSObject>

- (void) dashboardManagerServiceCallSuccessfulWithResponse : (id) response WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) dashboardManagerServiceCallFailedWithError : (WiSeAppError *) error WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end
