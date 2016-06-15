//
//  WiSeReportManagerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 06/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@protocol WiSeReportManagerDelegate <NSObject>

- (void) reportManagerServiceCallSuccessfulWithResponse : (id) response WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

- (void) reportManagerServiceCallFailedWithError : (WiSeAppError *) error WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end
