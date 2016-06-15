//
//  AppDelegate.m
//  Demo
//
//  Created by Ashok Parthiban D on 16/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "AppDelegate.h"
#import "KeychainUserPass.h"
#import <WiSeAppLog/WiSeLogManager.h>
#import "UserDetails.h"
#import "WiSeCloudAPIURLInfo.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize m_appDeviceToken;
@synthesize loginInResponse;
@synthesize appId;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *strUDID = [KeychainUserPass load:@"phoneUDID"];
    if(nil == strUDID) {
        NSString * strUniqueIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString]; // IOS 6+
        strUniqueIdentifier = [strUniqueIdentifier stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [KeychainUserPass save:@"phoneUDID" data:strUniqueIdentifier];
    }
    
    _initer = [[WiSeCloudSDKInitializer alloc] sharedWiSeCloudSDKWithDataSource:self];
    
    loginInResponse = [WiSeLoginApiResponse new];
    loginInResponse.token = [[NSUserDefaults standardUserDefaults] objectForKey:@"USER_TOKEN"];
    loginInResponse.phoneCloudId = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"PHONE_ID"];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    WiSeLogInfo(@"My token is: %@", deviceToken);
    NSString *deviceTokenStr = [[[[deviceToken description]
                                  stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                 stringByReplacingOccurrencesOfString: @">" withString: @""]
                                stringByReplacingOccurrencesOfString: @" " withString: @""];
    WiSeLogInfo(@"Device token string is: %@", deviceTokenStr);
    if(m_appDeviceToken) {
        m_appDeviceToken = nil;
    }
    m_appDeviceToken = [[NSString alloc] initWithString:deviceTokenStr];
    
    if(nil != m_appDeviceToken)
    {
    }
}

- (NSString *)getBaseURL {
    return @"http://192.168.1.217/nzcms/public/";
}

- (NSString *)getBaseURLForAPI:(WiSeAPICall)apiName {
    
    NSURL * tmp   = [[NSURL alloc]initFileURLWithPath:[NSBundle mainBundle].bundlePath];
    NSString * sd = [NSString stringWithFormat:@"%@",tmp];
    switch (apiName) {

//            tmp   = [[NSURL alloc]initFileURLWithPath:[NSBundle mainBundle].bundlePath];
//            sd = [NSString stringWithFormat:@"%@",tmp];
//            break;
            
        default:
            sd = @"http://192.168.10.217/nzcms/nzcms/public/";
            break;
    }
    return sd;
}

- (NSString *)getFullURLForAPI:(WiSeAPICall)apiName {
    NSString * url = @"";
    NSURL * tmp   = [[NSURL alloc]initFileURLWithPath:[NSBundle mainBundle].bundlePath];
    NSString * sd = [NSString stringWithFormat:@"%@",tmp];
    switch (apiName) {
            //        case Login:
            //            url = @"Full URL";
            //            break;
            //        case Logout:
            //            url = @"Only Base URL";
            //            url = [url stringByAppendingString:[_initer getURLPathForAPI:Logout]];
            //            break;
//        case GetTrackingAlerts:
//            url = [NSString stringWithFormat:@"https://wiser.wisilica.com/nzcms/"];
//            break;
        default:
            url = @"http://192.168.10.242/nzcms/nzcms/public/";
            url = [url stringByAppendingString:[_initer getURLPathForAPI:apiName]];
            break;
    }
    return url;
}

- (WiSeCloudAPIURLInfo *) getURLInfoForAPI : (WiSeAPICall) apiName
{
    WiSeCloudAPIURLInfo * info = [WiSeCloudAPIURLInfo new];
    info.apiHttpMethod = @"POST";
    switch (apiName)
    {
        case SaveAppInfo:
        {
            info.apiURL = [NSString stringWithFormat:@"http://192.168.10.120/nuRF.2010.02.3/services/wisilica/app/MobileAppService.asmx/RegisterApplication"];
            
        }
            break;
        case Login:
        {
            info.apiURL = [NSString stringWithFormat:@"http://192.168.10.120/nuRF.2010.02.3/services/wisilica/user/MobileUserService.asmx/AuthenticateUser"];
            
        }
            break;
        case Logout:
        {
            info.apiURL = [NSString stringWithFormat:@"http://192.168.10.120/nuRF.2010.02.3/services/wisilica/user/MobileUserService.asmx/LogoutUser"];
            
        }
            break;
        case AddListener:
        {
            info.apiURL = [NSString stringWithFormat:@"http://192.168.10.120/nuRF.2010.02.3/services/wisilica/device_management/WiSeDeviceManagementService.asmx/AddDevice"];
            
        }
            break;
        case GetADevice:
        {
            info.apiURL =[NSString stringWithFormat:@"http://192.168.10.120/nuRF.2010.02.3/services/wisilica/device_management/WiSeDeviceManagementService.asmx/GetDevicePairingDetails"];
            
        }
            break;
        case AddSecureListener:
        {
            info.apiURL =[NSString stringWithFormat:@"http://192.168.10.120/nuRF.2010.02.3/services/wisilica/device_management/WiSeDeviceManagementService.asmx/GetDevicePairingDetails"];
        }
            break;
        case AddTag:
        {
            info.apiURL =[NSString stringWithFormat:@"http://192.168.10.120/nuRF.2010.02.3/services/wisilica/device_management/WiSeDeviceManagementService.asmx/AddNewTag"];
            
        }
            break;
        case GetTag:
        {
            info.apiURL =[NSString stringWithFormat:@"http://192.168.10.120/nuRF.2010.02.3/services/wisilica/device_management/WiSeDeviceManagementService.asmx/GetDevicePairingDetails"];
        }
        default:
            break;
    }
    return info;
}

@end
