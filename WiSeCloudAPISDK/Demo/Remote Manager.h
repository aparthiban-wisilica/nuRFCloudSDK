//
//  Remote Manager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WiSeUserManager.h"
#import "WiSeOperationManager.h"
#import "WiSeMessageManager.h"

@interface Remote_Manager : UIViewController <WiSeUserManagerDelegate,WiSeOperationManagerDelegate,WiSeMessageManagerDelegate>

@end
