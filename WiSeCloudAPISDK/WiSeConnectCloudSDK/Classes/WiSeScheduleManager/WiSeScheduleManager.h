//
//  WiSeScheduleManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeScheduleManagerDelegate.h"

@class WiSeCloudAPIRequestDetails;
@class WiSeAPIHeader;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeCloudScheduleRequest;

@interface WiSeScheduleManager : NSObject

@property (nonatomic,weak) id <WiSeScheduleManagerDelegate> delegate;

/*!
 * @brief CMS APIs.
 */

- (WiSeCloudAPIRequestRegisteredDetails *) addScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getScheduleApiWithRequest : (WiSeCloudScheduleRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
