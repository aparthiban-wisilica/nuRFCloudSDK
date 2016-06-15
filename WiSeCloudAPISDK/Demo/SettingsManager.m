//
//  SettingsManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "SettingsManager.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeBridgeSet_RemoveAPIRequest.h"
#import "AppDelegate.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import <WiSeAppLog/WiSeLogManager.h>

@implementation SettingsManager {
    WiSeSettingsManager * settingsManager;
    NSString * strToken;
    int phoneId;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    settingsManager                      = [WiSeSettingsManager new];
    settingsManager.delegate             = self;

    AppDelegate * mainDelegate           = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;
    strToken                             = loginResponse.token;
    phoneId                              = loginResponse.phoneCloudId;
}

#pragma mark - Settings Callbacks

- (void)settingsManagerAPICallFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case BridgeSet_Remove:
            WiSeLogInfo(@"Bridge Set_Remove Failed : %@",error.localizedDescription);
            break;
            
        default:
            break;
    }
}

- (void) settingsManagerAPICallSuccessWithResponse:(id)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case BridgeSet_Remove:
            WiSeLogInfo(@"Bridge Set_Remove Success : %@",response);
            break;
        default:
            break;
    }
}

#pragma mark - Bridge Set_Remove 

- (IBAction)btnBridgeSet_RemoveTapped:(id)sender {
    
    WiSeBridgeSet_RemoveAPIRequest * request      = [WiSeBridgeSet_RemoveAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneId;
    if (btnBridge.selected) {
        request.bridgeAction                          = SetBridge;
        btnBridge.selected                            = NO;
    }else {
        request.bridgeAction                          = RemoveBridge;
        btnBridge.selected                            = YES;
    }

    WiSeCloudAPIRequestRegisteredDetails * status = [settingsManager bridgeSet_RemoveApiWithRequest:request];
    WiSeLogInfo(@"Add Friends Status : %u",status.requestRegisteredId);
}

@end
