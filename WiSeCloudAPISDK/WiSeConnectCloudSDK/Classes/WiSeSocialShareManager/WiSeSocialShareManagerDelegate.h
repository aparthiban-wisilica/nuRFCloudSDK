//
//  WiSeSocialShareManagerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 11/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@protocol WiSeSocialShareManagerDelegate <NSObject>

- (void) socialShareManagerAPICallSuccessWithResponse : (id) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) socialShareManagerAPICallFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end
