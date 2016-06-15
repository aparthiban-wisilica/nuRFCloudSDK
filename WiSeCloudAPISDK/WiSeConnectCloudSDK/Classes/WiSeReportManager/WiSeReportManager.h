//
//  WiSeReportManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 06/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeReportManagerDelegate.h"

@class WiSeCloudAPIRequestDetails;
@class WiSeAPIHeader;
@class WiSeCloudAPIRequestRegisteredDetails;

@interface WiSeReportManager : NSObject

@property (nonatomic,weak) id <WiSeReportManagerDelegate> delegate;

/*!
 * @brief CMS APIs.
 */

@end
