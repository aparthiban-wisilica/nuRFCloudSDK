//
//  SubscriptionManagerVC.h
//  WiSeCloudAPISDK
//
//  Created by Arjun on 09/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "SubscriptionSettingsCell.h"
#import "WiSeOperationManager.h"
#import "WiSeSettingsManager.h"

@interface SubscriptionManagerVC : UIViewController <UITableViewDataSource, UITableViewDelegate,WiSeOperationManagerDelegate,WiSeSettingsManagerDelegate>


@property (strong, nonatomic) IBOutlet UITableView *ui_SettingsList;

@end
