//
//  WiSeCloudSDKinitializerDelegate.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"

@class WiSeCloudAPIURLInfo;

@protocol WiSeCloudSDKinitializerDelegate <NSObject>

@optional

// At least any one method should be implemented, in case user wants to costomize API Urls

- (NSString *) getBaseURL;

- (NSString *) getBaseURLForAPI : (WiSeAPICall) apiName;

- (NSString *) getFullURLForAPI : (WiSeAPICall) apiName;

- (WiSeCloudAPIURLInfo *) getURLInfoForAPI : (WiSeAPICall) apiName;

@end
