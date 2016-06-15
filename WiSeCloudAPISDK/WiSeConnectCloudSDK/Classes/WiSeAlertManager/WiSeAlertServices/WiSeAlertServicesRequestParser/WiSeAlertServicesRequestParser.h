//
//  WiSeAlertServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudSnoozeSettingRequest;
@class WiSeCheckOutRequest;
@class WiSeSelfAssignResetAPIRequest;

@interface WiSeAlertServicesRequestParser : NSObject

+ (NSMutableArray *) createSetUpdateSnoozeTimeApiParameters : (WiSeCloudSnoozeSettingRequest *)    request;

+ (NSDictionary *) createEnableDisableCheckOutApiParameters : (WiSeCheckOutRequest *)    request;

+ (NSDictionary *) createSelfAssignResetApiParameters : (WiSeSelfAssignResetAPIRequest *)    request;

@end
