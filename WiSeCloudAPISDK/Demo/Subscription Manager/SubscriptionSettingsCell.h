//
//  SubscriptionSettingsCell.h
//  WiSeCloudAPISDK
//
//  Created by Arjun on 09/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubscriptionSettingsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UISwitch *ui_SettingSwitch;
@property (strong, nonatomic) IBOutlet UILabel *ui_SettingLabel;

@end
