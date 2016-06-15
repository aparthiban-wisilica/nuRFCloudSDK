//
//  ViewController.h
//  Demo
//
//  Created by Ashok Parthiban D on 16/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import "WiSeUserManager.h"
#import "WiSeCloudSDKinitializerDelegate.h"
#import "WiSeAppManager.h"

//@interface ViewController : UIViewController <SignUpAPIDelegate,WiSeCloudApiRequestDelegate,LoginUpAPIDelegate,ChangePasswordAPIDelegate,ForgotPasswordAPIDelegate,DashBoardAPIDelegate>
@interface ViewController : UIViewController <WiSeUserManagerDelegate,WiSeAppManagerDelegate>

@end

