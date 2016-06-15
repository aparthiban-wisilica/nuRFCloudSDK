//
//  HomeVC.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 13/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "HomeVC.h"

@implementation HomeVC {
    NSArray * arrVCIndentifiers;
    NSArray * arrVCNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    arrVCIndentifiers = [NSArray arrayWithObjects:@"userManager",@"dashboardManager",@"remoteManager",@"beaconManager",@"settingManager",@"orgManager",@"friendManager",@"alertManager", nil];
    arrVCNames = [NSArray arrayWithObjects:@"User Manager",@"Dashboard Manager",@"Remote Manager",@"Beacon Manager",@"Settings Manager",@"Organization & Infant Manager",@"Friend Manager",@"Alert & Tag Manager", nil];
    
}

#pragma mark = TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrVCIndentifiers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * strIndentifier = [arrVCIndentifiers objectAtIndex:indexPath.row];
    UITableViewCell * cell    = [tableView dequeueReusableCellWithIdentifier:strIndentifier];
    if (cell == nil) {
        cell                  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIndentifier];
    }
    cell.textLabel.text       = [arrVCNames objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
