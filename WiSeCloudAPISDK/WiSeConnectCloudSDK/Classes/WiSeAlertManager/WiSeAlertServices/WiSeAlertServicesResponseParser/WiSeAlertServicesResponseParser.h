//
//  WiSeAlertServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudSnoozeSettingResponse;
@class WiSeCloudSnoozeSettingDetails;
@class WiSeCloudApiResponse;
@class WiSeCloudAPIResponseDetails;
@class WiSeCheckOutResponse;
@class WiSeSelfAssignResetAPIResponse;

@interface WiSeAlertServicesResponseParser : NSObject

+ (WiSeCloudSnoozeSettingResponse *) parseSetUpdateSnoozeTimingAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCheckOutResponse *) parseEnableDisableCheckOutAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeSelfAssignResetAPIResponse *) parseSelfAssignResetAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (NSMutableArray *) getSnoozeSettingsDetailsListFromResponseData : (NSArray *) arrOfSnoozes;

@end
