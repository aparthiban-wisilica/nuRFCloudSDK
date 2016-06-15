//
//  WiSeFriendManagerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 14/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@protocol WiSeFriendManagerDelegate <NSObject>

- (void) friendManagerAPICallSuccessWithResponse : (id) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) friendManagerAPICallFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end
