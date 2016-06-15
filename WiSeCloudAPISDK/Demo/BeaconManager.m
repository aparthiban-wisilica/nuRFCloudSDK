//
//  BeaconManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 15/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "BeaconManager.h"
#import "WiSeBeaconItem.h"
#import "AppDelegate.h"
#import <WiSeAppLog/WiSeLogManager.h>
#import "WiSeCloudBeaconAPIRequest.h"
#import "WiSeCloudBeaconDetails.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@implementation BeaconManager {
    WiSeBeaconManager * beaconManager;
    NSString *strToken;
    int phoneLongId;
    uint8_t prefix[4];
    NSData * prefixData;
    NSData * advertiseData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    beaconManager                        = [WiSeBeaconManager new];
    beaconManager.delegate               = self;

    AppDelegate * mainDelegate           = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;
    strToken                             = loginResponse.token;
    phoneLongId                          = loginResponse.phoneCloudId;

    prefix[0]                            = 0x01;
    prefix[1]                            = 0x02;
    prefix[2]                            = 0x03;
    prefix[3]                            = 0x04;
    prefixData                           = [[NSData alloc] initWithBytes:(void *) &prefix  length:sizeof(prefix)];

    prefix[0]                            = 0x05;
    prefix[1]                            = 0x06;
    prefix[2]                            = 0x07;
    prefix[3]                            = 0x08;
    advertiseData                        = [[NSData alloc] initWithBytes:(void *) &prefix  length:sizeof(prefix)];    
}



#pragma mark - Get Device Beacon Association

- (IBAction)btnGetDeviceBeaconAssociationTapped:(id)sender {
    
    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;
    request.start                                 = 1456394650;
    request.limit                                 = 100;

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager getDeviceBeaconAssociationApiWithRequest:request];
    WiSeLogInfo(@"Add Beacon Status : %u",status.requestRegisteredId);
    
}

#pragma mark - Get Archived Device Beacon Association

- (IBAction)btnGetArchivedDeviceBeaconAssociationTapped:(id)sender {
    
    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;
    request.start                                 = [NSDate timeIntervalSinceReferenceDate];
    request.limit                                 = 100;

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager getArchivedDeviceBeaconAssociationApiWithRequest:request];
    WiSeLogInfo(@"Add Beacon Status : %u",status.requestRegisteredId);
    
}

#pragma mark - Update Beacon Battery Leavel

- (IBAction)btnUpdateBeaconBatteryStatusTapped:(id)sender {
    
    WiSeCloudBeaconDetails * item                 = [WiSeCloudBeaconDetails new];
    item.beaconName                               = @"Beacon Testing";
    item.deviceCloudId                            = 9;
    item.batteryLevel                             = 25;

    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;

    request.beaconsList                           = [[NSArray alloc] initWithObjects:item, nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager updateBeaconBatteryStatusApiWithRequest:request];
    WiSeLogInfo(@"Edit Configured Beacon Status : %u",status.requestRegisteredId);

}

#pragma mark - Update Beacon Data Log

- (IBAction)btnUpdateBeaconDataLogTapped:(id)sender {
    
    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;
    request.beaconData                            = prefixData;

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager updateBeaconDataLogApiWithRequest:request];
    WiSeLogInfo(@"Edit Configured Beacon Status : %u",status.requestRegisteredId);
    
}

#pragma mark - Create Beacon Device Association

- (IBAction)btnCreateBeaconDeviceAssociationTapped:(id)sender {
    
    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;

    // FOR ALREADY ADDED BEACONS
    WiSeCloudBeaconDetails * associationDetails   = [WiSeCloudBeaconDetails new];
    associationDetails.beaconCloudId              = 7;
    associationDetails.deviceCloudId              = 461;
    associationDetails.deviceMeshId               = 39;
    associationDetails.beaconMeshId               = 17;
    associationDetails.deviceUUID                 = @"0001970001000000000041c96f1ec132";
    associationDetails.beaconStatus               = 2;

    // FOR NEW BEACONS
    WiSeCloudBeaconDetails * associationDetails1  = [WiSeCloudBeaconDetails new];
    associationDetails1.beaconName                = @"New Beacon";
    associationDetails1.beaconUUID                = @"00019700010c000000005c87dcc6b12z";
//    associationDetails1.beaconCloudId             = 12;
    associationDetails1.beaconMeshId              = 50;
    associationDetails1.major                     = 25;
    associationDetails1.minor                     = 12;
    associationDetails1.beaconPrefix              = prefixData;
    associationDetails1.deviceCloudId             = 623;
    associationDetails1.deviceMeshId              = 48;
    associationDetails1.deviceUUID                = @"000197000207000000008c22a802e5bc";
    associationDetails1.beaconStatus              = 1;

    request.beaconsList                           = [[NSArray alloc] initWithObjects:associationDetails,associationDetails1, nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager deviceBeaconAssociationApiWithRequest:request];
    WiSeLogInfo(@"Create Beacon Device Association : %u",status.requestRegisteredId);
    
}

#pragma mark - Beacon Manager Call backs 

- (void)beaconMangerAPICallFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeAPICall apiName = requestDetails.apiId;
    switch (apiName) {
        case AddBeacon:
            WiSeLogInfo(@"Add Beacon Failed : %@",error);
            break;
        case GetBeacon:
            WiSeLogInfo(@"Get Beacon Failed : %@",error);
            break;
        case DeleteBeacon:
            WiSeLogInfo(@"Delete Beacon Failed : %@",error);
            break;
        case AddConfiguredBeacon:
            WiSeLogInfo(@"Add Configured Beacon Failed : %@",error);
            break;
        case GetConfiguredBeacon:
            WiSeLogInfo(@"Get Configured Beacon Failed : %@",error);
            break;
        case DeleteConfiguredBeacon:
            WiSeLogInfo(@"Delete Configured Beacon Failed : %@",error);
            break;
        case DeviceBeaconAssociation:
            WiSeLogInfo(@"Create Device Beacon Association Failed : %@",error);
            break;
        case GetDeviceBeaconAssociation:
            WiSeLogInfo(@"Get Device Beacon Association Failed : %@",error);
            break;
        case DeleteDeviceBeaconAssociation:
            WiSeLogInfo(@"Delete Device Beacon Association Failed : %@",error);
            break;
        default:
            break;
    }
}

- (void)beaconMangerAPICallSuccessWithResponse:(id)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeAPICall apiName = requestDetails.apiId;
    switch (apiName) {
        case AddBeacon:
            WiSeLogInfo(@"Add Beacon Success : %@",response);
            break;
        case GetBeacon:
            WiSeLogInfo(@"Get Beacon Success : %@",response);
            break;
        case DeleteBeacon:
            WiSeLogInfo(@"Delete Beacon Success : %@",response);
            break;
        case AddConfiguredBeacon:
            WiSeLogInfo(@"Add Configured Beacon Success : %@",response);
            break;
        case GetConfiguredBeacon:
            WiSeLogInfo(@"Get Configured Beacon Success : %@",response);
            break;
        case DeleteConfiguredBeacon:
            WiSeLogInfo(@"Delete Configured Beacon Success : %@",response);
            break;
        case DeviceBeaconAssociation:
            WiSeLogInfo(@"Create Device Beacon Association Success : %@",response);
            break;
        case GetDeviceBeaconAssociation:
            WiSeLogInfo(@"Get Device Beacon Association Success : %@",response);
            break;
        case DeleteDeviceBeaconAssociation:
            WiSeLogInfo(@"Delete Device Beacon Association Success : %@",response);
            break;
        default:
            break;
    }

}

#pragma mark - Add Beacon

- (IBAction)btnAddBeaconTapped:(id)sender {

    WiSeCloudBeaconDetails * item                 = [WiSeCloudBeaconDetails new];
    item.beaconName                               = @"Beacon Testing";
    item.beaconMeshId                             = 16;
    item.major                                    = 24;
    item.minor                                    = 14;
    item.beaconUUID                               = @"00019700010c000000005c87dcc6b848";
    item.beaconPrefix                             = prefixData;
    item.beaconData                               = prefixData;

    WiSeCloudBeaconDetails * item1                = [WiSeCloudBeaconDetails new];
    item1.beaconName                              = @"Beacon Testing";
    item1.beaconMeshId                            = 17;
    item1.major                                   = 25;
    item1.minor                                   = 15;
    item1.beaconUUID                              = @"00019700010c000000005c87dcc6b849";
    item1.beaconPrefix                            = prefixData;
    item1.beaconData                              = prefixData;

    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;

    request.beaconsList                           = [[NSArray alloc] initWithObjects:item,item1, nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager addBeaconApiWithRequest:request];
    WiSeLogInfo(@"Add Beacon Status : %u",status.requestRegisteredId);
    
}

#pragma mark - Edit Beacons

- (IBAction)btnEditBeaconsTapped:(id)sender {
    
    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;

    WiSeCloudBeaconDetails * item                 = [WiSeCloudBeaconDetails new];
    item.beaconName                               = @"Smart Beacon";
    item.beaconCloudId                            = 3;

    request.beaconsList                           = [[NSArray alloc] initWithObjects:item, nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager editBeaconApiWithRequest:request];
    WiSeLogInfo(@"Edit Beacon Status : %u",status.requestRegisteredId);
    
}


#pragma mark - Get Beacons

- (IBAction)btnGetBeaconsTapped:(id)sender {
    
    WiSeCloudBeaconAPIRequest * request = [WiSeCloudBeaconAPIRequest new];
    request.token                       = strToken;
    request.phoneCloudId                = phoneLongId;
    request.start                       = 0;
    request.limit                       = 100;
    
    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager getBeaconApiWithRequest:request];
    WiSeLogInfo(@"Get Beacon Status : %u",status.requestRegisteredId);

}

#pragma mark - Get Archived Beacons

- (IBAction)btnGetArchivedBeaconsTapped:(id)sender {
    
    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;
    request.start                                 = 0;
    request.limit                                 = 100;

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager getArchivedBeaconApiWithRequest:request];
    WiSeLogInfo(@"Get Archived Beacon Status : %u",status.requestRegisteredId);
    
}

#pragma mark - Delete Beacons

- (IBAction)btnDeleteBeaconTapped:(id)sender {
    
    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;
    request.beaconCloudId                         = 6;

    WiSeCloudBeaconDetails * item                 = [WiSeCloudBeaconDetails new];
    item.beaconCloudId                            = 4;

    WiSeCloudBeaconDetails * item1                = [WiSeCloudBeaconDetails new];
    item1.beaconCloudId                           = 5;

//    request.beaconsList = [[NSArray alloc] initWithObjects:item,item1, nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager deleteBeaconApiWithRequest:request];
    WiSeLogInfo(@"Delete Configured Beacon Status : %u",status.requestRegisteredId);

}

#pragma mark - Add Configured Beacon

- (IBAction)btnAddConfiguredBeaconTapped:(id)sender {
    
    WiSeCloudBeaconDetails * item = [WiSeCloudBeaconDetails new];
    item.beaconName                               = @"Configured Beacon";
    item.beaconRangeName                          = @"Configured Beacon 1";
    item.beaconMeshId                             = 128;
    item.major                                    = 0x5;
    item.minor                                    = 0x8;
    item.beaconUUID                               = @"000197000207000000008c22a802e5pl";
    item.beaconPrefix                             = prefixData;
    item.capability                               = 10;
    item.beaconType                               = 23;
    item.txPower                                  = 45;
    item.advertisingInterval                      = 10;
    item.beaconSlot                               = 7;
    item.rangerSSI                                = 2;
    item.deviceCloudId                            = 9;
    item.beaconStatus                             = 1;

    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;

    request.beaconsList                           = [[NSArray alloc] initWithObjects:item, nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager addConfiguredBeaconApiWithRequest:request];
    WiSeLogInfo(@"Add Configured Beacon Status : %u",status.requestRegisteredId);
    
}

#pragma mark - Edit Configured Beacon

- (IBAction)btnEditConfiguredBeaconTapped:(id)sender {
    
    WiSeCloudBeaconDetails * item = [WiSeCloudBeaconDetails new];
    item.beaconName                               = @"Configured Beacon Edited";
    item.beaconRangeName                          = @"Configured Beacon 1 Edited";
    item.beaconMeshId                             = 128;
    item.major                                    = 0x5;
    item.minor                                    = 0x8;
    item.beaconUUID                               = @"000197000207000000008c22a802e5pl";
    item.beaconPrefix                             = prefixData;
    item.capability                               = 10;
    item.beaconType                               = 23;
    item.txPower                                  = 45;
    item.advertisingInterval                      = 10;
    item.beaconSlot                               = 7;
    item.rangerSSI                                = 2;
    item.deviceCloudId                            = 9;
    item.beaconStatus                             = 1;
    
    
    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;

    request.beaconsList                           = [[NSArray alloc] initWithObjects:item, nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager editConfiguredBeaconApiWithRequest:request];
    WiSeLogInfo(@"Edit Configured Beacon Status : %u",status.requestRegisteredId);
    
}


#pragma mark - Get Configured Beacon

- (IBAction)btnGetConfiguredTapped:(id)sender {
    
    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;
    request.start                                 = 0;
    request.limit                                 = 100;

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager getConfiguredBeaconApiWithRequest:request];
    WiSeLogInfo(@"Get Configured Beacon Status : %u",status.requestRegisteredId);

}

#pragma mark - Delete Beacons

- (IBAction)btnDeleteConfiguredBeaconTapped:(id)sender {
    
    WiSeCloudBeaconAPIRequest * request           = [WiSeCloudBeaconAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneLongId;
    request.beaconCloudId                         = 6;

    WiSeCloudBeaconDetails * item                 = [WiSeCloudBeaconDetails new];
    item.beaconCloudId                            = 17;

    WiSeCloudBeaconDetails * item1                = [WiSeCloudBeaconDetails new];
    item1.beaconCloudId                           = 18;

    WiSeCloudAPIRequestRegisteredDetails * status = [beaconManager deleteConfiguredBeaconApiWithRequest:request];
    WiSeLogInfo(@"Delete Configured Beacon Status : %u",status.requestRegisteredId);
    
}



@end
