//
//  AppDelegate.h
//  Demo
//
//  Created by Ashok Parthiban D on 16/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WiSeLoginApiResponse.h"
#import "WiSeCloudSDKInitializer.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate,WiSeCloudSDKinitializerDelegate>

@property (strong, nonatomic) UIWindow                *window;
@property (nonatomic, strong) NSString                *m_appDeviceToken;
@property (nonatomic, strong) WiSeLoginApiResponse    *loginInResponse;
@property (nonatomic, assign) int                     appId;
@property (nonatomic, strong) NSData                  * triggerData;
@property (nonatomic, strong) WiSeCloudSDKInitializer * initer;

@end

