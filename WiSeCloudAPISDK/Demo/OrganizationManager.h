//
//  OrganizationManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 11/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WiSeOrganizationManager.h"
#import "WiSeInfantManager.h"
#import "WiSeMapManager.h"

@interface OrganizationManager : UIViewController <WiSeOrganizationManagerDelegate,WiSeInfantManagerDelegate,WiSeMapManagerDelegate>

@end
