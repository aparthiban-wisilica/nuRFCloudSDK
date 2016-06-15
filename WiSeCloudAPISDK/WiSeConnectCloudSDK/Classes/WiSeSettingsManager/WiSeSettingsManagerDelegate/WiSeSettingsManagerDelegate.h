//
//  WiSeSettingsManagerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 20/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeAppError;
@class WiSeCloudAPIRequestDetails;

@protocol WiSeSettingsManagerDelegate <NSObject>
- (void) settingsManagerAPICallSuccessWithResponse : (id) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) settingsManagerAPICallFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
@end
