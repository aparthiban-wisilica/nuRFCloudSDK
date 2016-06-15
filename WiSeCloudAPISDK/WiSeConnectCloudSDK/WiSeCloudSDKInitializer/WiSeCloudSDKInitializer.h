//
//  WiSeCloudSDKInitializer.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudSDKinitializerDelegate.h"
#import "WiSeAPIConstants.h"

@class WiSeCloudAPIURLInfo;

@interface WiSeCloudSDKInitializer : NSObject

@property (nonatomic,weak) id <WiSeCloudSDKinitializerDelegate> dataSource;

- (instancetype) sharedWiSeCloudSDKWithDataSource : (id<WiSeCloudSDKinitializerDelegate>) dataSource ;

+ (id)sharedWiSeCloudSDKInitializer;

- (NSString *) getURLPathForAPI : (WiSeAPICall) apiName;

@end
