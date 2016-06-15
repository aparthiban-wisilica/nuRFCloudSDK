//
//  EditVC.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 24/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "WiSeDashboardManager.h"

//@interface EditVC : UIViewController <UpdateUserProfileAPIDelegate,WiSeAddDeviceAPIDelegate,WiSeEditDeviceAPIDelegate,WiSeDeleteDeviceAPIDelegate>

@interface EditVC : UIViewController <WiSeDashboardManagerDelegate> {
    IBOutlet UISegmentedControl * seg;
}

@end
