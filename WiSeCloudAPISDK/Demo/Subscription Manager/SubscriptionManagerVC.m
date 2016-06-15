//
//  SubscriptionManagerVC.m
//  WiSeCloudAPISDK
//
//  Created by Arjun on 09/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "SubscriptionManagerVC.h"
#import "WiSeOperationServices.h"
#import "WiSeNetworkConstants.h"
#import "WiSeCloudSubscriptionAPIRequest.h"
#import "AppDelegate.h"
#import "WiSeGetSubscriptionAPIRequest.h"
#import "WiSeGetSubscriptionAPIResponse.h"
#import "WiSeCloudSubscriptionAPIResponse.h"
#import "WiSeSettingsManager.h"
#import "WiSeBridgeSet_RemoveAPIRequest.h"
#import "WiSeBridgeSet_RemoveAPIResponse.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@implementation SubscriptionManagerVC {
    WiSeOperationManager * services;
    WiSeSettingsManager *settings;
    NSString * strToken;
    int phoneCloudId;
    
    int currentSubscription;
    BOOL isBridge;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    settings = [WiSeSettingsManager new];
    settings.delegate = self;
    
    AppDelegate * mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;
    strToken = loginResponse.token;
    phoneCloudId = loginResponse.phoneCloudId;
    
    [self getCurrentSubscription];
}


-(void)getCurrentSubscription
{
    WiSeGetSubscriptionAPIRequest * request = [WiSeGetSubscriptionAPIRequest new];
    request.token = strToken;
    request.phoneCloudId = phoneCloudId;
    [settings getSubscriptionApiWithRequest:request];
}
#pragma mark - Operation Manager Callbacks

- (void)operationManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case CreateUpdateSubscription:
            
            break;
        case GetSubcription:
            
            break;
        default:
            break;
    }
}

- (void)operationManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case CreateUpdateSubscription:
        {

            WiSeCloudSubscriptionAPIRequest *request = (WiSeCloudSubscriptionAPIRequest *)requestDetails.request;
            currentSubscription = request.subscryptionId;
            
        }
            
            break;
        case GetSubcription:
        {
            WiSeCloudSubscriptionAPIResponse *subscriptionResponse = (WiSeCloudSubscriptionAPIResponse*)response;
            currentSubscription = subscriptionResponse.subscriptionDetails.subscriptionId;
            isBridge = subscriptionResponse.subscriptionDetails.isBridge;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.ui_SettingsList reloadData];
            });
        }
            break;
        default:
            break;
    }

}


- (void)settingsManagerAPICallFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails
{
    switch (requestDetails.apiId)
    {
        case SetBridge:
        {
            
        }
            break;
        default:
            break;
    }
}

- (void)settingsManagerAPICallSuccessWithResponse:(id)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails
{
   switch (requestDetails.apiId)
    {
        case SetBridge:
        {
            
        }
            break;
        default:
            break;
    }
}

#pragma mark - Switch Methods
- (IBAction)didToggleSwitch:(id)sender
{
    UISwitch *toggleSwitch = (UISwitch*)sender;
    
    WiSeCloudSubscriptionAPIRequest * req = [WiSeCloudSubscriptionAPIRequest new];
    
    switch (toggleSwitch.tag)
    {
        case 1:
        {
            
            WiSeBridgeSet_RemoveAPIRequest * request      = [WiSeBridgeSet_RemoveAPIRequest new];
            request.token                                 = strToken;
            request.phoneCloudId                          = phoneCloudId;
            
            if (toggleSwitch.isOn)
            {
                request.bridgeAction                          = SetBridge;

            }
            else
            {
                request.bridgeAction                          = RemoveBridge;
            }
            
            
            [settings bridgeSet_RemoveApiWithRequest:request];
        }
            break;
        case 11:
        {
            if (toggleSwitch.isOn)
            {
                req.subscryptionId = currentSubscription + 1;
            }
            
            else
            {
                req.subscryptionId = currentSubscription - 1;
            }
        }
            break;
        case 12:
        {
            if (toggleSwitch.isOn)
            {
                req.subscryptionId = currentSubscription + 2;
            }
            
            else
            {
                req.subscryptionId = currentSubscription - 2;
            }
        }
            break;
        case 13:
        {
            if (toggleSwitch.isOn)
            {
                req.subscryptionId = currentSubscription + 4;
            }
            
            else
            {
                req.subscryptionId = currentSubscription - 4;
            }
        }
            break;
        default:
            break;
    }
    
    
    
    req.token = strToken;
    req.phoneCloudId = phoneCloudId;
    [settings createUpdateSubscriptionApiWithRequest:req];
    
    
    
}

#pragma mark - TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle = @"";
    if (section == 0)
        sectionTitle = @"Bridge Status";
    else
        sectionTitle = @"Subscriptions";
    
    return sectionTitle;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
    
        return 1;
    }
    else
    {
        return 4;

    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try
    {
        NSString *CellIdentifier = @"SettingsCell";
        
        SubscriptionSettingsCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
      
        cell.backgroundColor = [UIColor clearColor];
         [cell.ui_SettingSwitch setHidden:NO];
        
        [cell.ui_SettingLabel setBackgroundColor:[UIColor clearColor]];
        switch (indexPath.section)
        {
            case 0:
                switch (indexPath.row)
            {
                    case 0:
                    {
                        [cell.ui_SettingLabel setText:@"Is Bridge"];
                        [cell.ui_SettingSwitch setTag:1];
                        
                        if (isBridge)
                        {
                            [cell.ui_SettingSwitch setOn:YES];
                        }
                        
                        else
                        {
                            [cell.ui_SettingSwitch setOn:NO];
                        }
                        
                        
                    }
                        break;
                    default:
                        break;
            }
                break;
                
            case 1:
            {
                switch (indexPath.row)
                {
                    case 0:
                    {
                        [cell.ui_SettingLabel setText:@"Remote Operations"];
                        [cell.ui_SettingSwitch setTag:11];
                        
                        if (currentSubscription %2 == 1)
                        {
                            [cell.ui_SettingSwitch setOn:YES];
                        }
                        
                        else
                        {
                            [cell.ui_SettingSwitch setOn:NO];
                        }
                    }
                        break;
                    case 1:
                    {
                        [cell.ui_SettingLabel setText:@"Operation Status"];
                        [cell.ui_SettingSwitch setHidden:YES];
                    }
                        break;
                        
                    case 2:
                    {
                        [cell.ui_SettingLabel setTextAlignment:NSTextAlignmentRight];
                        [cell.ui_SettingLabel setText:@"Direct Operation Status"];
                        [cell.ui_SettingSwitch setTag:12];
                        
                        if (currentSubscription == 2 || currentSubscription == 3 ||currentSubscription == 6 || currentSubscription == 7 )
                        {
                            [cell.ui_SettingSwitch setOn:YES];
                        }
                        
                        else
                        {
                            [cell.ui_SettingSwitch setOn:NO];
                        }
                    }
                        break;
                    case 3:
                    {
                         [cell.ui_SettingLabel setTextAlignment:NSTextAlignmentRight];
                        [cell.ui_SettingLabel setText:@"Remote Operation Status"];
                        [cell.ui_SettingSwitch setTag:13];
                        
                        
                        if (currentSubscription == 4 || currentSubscription == 5 || currentSubscription == 6 || currentSubscription == 7 )
                        {
                            [cell.ui_SettingSwitch setOn:YES];
                        }
                        
                        else
                        {
                            [cell.ui_SettingSwitch setOn:NO];
                        }
                    }
                        break;
                    default:
                        break;
            }
                
            }
                break;
            default:
                break;
        }
        
    
        return cell;
        
    }
    @catch (NSException * e) {

    }
}
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        

        
       
        
    }
    @catch (NSException * e) {


    }
    
}
*/

@end
