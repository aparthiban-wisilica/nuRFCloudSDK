//
//  SettingsManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WiSeSettingsManager.h"
@interface SettingsManager : UIViewController <WiSeSettingsManagerDelegate> {
    IBOutlet UIButton * btnBridge;
}

@end
