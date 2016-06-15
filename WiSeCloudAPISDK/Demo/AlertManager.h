//
//  AlertManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WiSeAlertManager.h"
#import "WiSeTagManager.h"
#import "WiSeZoneManager.h"

@interface AlertManager : UIViewController <WiSeAlertManagerDelegate,WiSeTagManagerDelegate,WiSeZoneManagerDelegate>

@end
