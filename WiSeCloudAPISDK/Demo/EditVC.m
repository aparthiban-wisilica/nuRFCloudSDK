//
//  EditVC.m
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 24/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "EditVC.h"
#import "WiSeLoginApiResponse.h"
#import "AppDelegate.h"
#import "WiSeDashBoardSubItems.h"
#import "WiSeCloudSensorItems.h"
#import "WiSeUpdateDirectOperationStatusAPIRequest.h"
#import "WiSeCloudSensorAPIRequest.h"
#import "WiSeCloudDeviceAPIRequest.h"
#import "WiSeCloudGroupAPIRequest.h"

#import "WiSeMakeMultiSensorAPIRequest.h"
#import "WiSeSensorTriggerLogAPIRequest.h"
#import "WiSeSensorTriggerIntervalSetAPIRequest.h"
#import "WiSeShutterUpdateAPIRequest.h"
#import "WiSeShutterFetchAPIRequest.h"
#import "WiSeDashBoardItems.h"
#import "WiSeDirectRemoteOperationDetails.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeAppLog/WiSeLogManager.h>

#import "WiSeCloudDeviceDetails.h"
#import "WiSeCloudSensorAPIRequest.h"
#import "WiSeDeviceGroupAssociationDetails.h"
#import "WiSeCloudListenerAPIRequest.h"
#import "WiSeAPIHeader.h"
#import "UserDetails.h"

@implementation EditVC {
    
    WiSeDashboardManager * dashboardManager;
    WiSeDashboardManager * dashboardManager1;
    
    BOOL isClicked;
    int pageNationValue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dashboardManager           = [[WiSeDashboardManager alloc] init];
    dashboardManager.delegate  = self;

    dashboardManager1          = [[WiSeDashboardManager alloc] init];
    dashboardManager1.delegate = self;

    pageNationValue            = 0;
}

-(IBAction)segTapped:(UISegmentedControl *)sender
{
    switch (seg.selectedSegmentIndex)
    {
        case 0:
            [self btnGetADevice:nil];
            break;
        case 1:
            [self btnGetAllDevice:nil];
            break;
        default: 
            break; 
    } 
}

- (WiSeAPIHeader *) getHeader {
    AppDelegate * mainDelegate           = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;
    WiSeAPIHeader * header               = [WiSeAPIHeader new];
    header.userToken                     = loginResponse.token;
    header.phoneCloudId                  = loginResponse.phoneCloudId;
    header.organizationId                = 1;
    return header;
}

#pragma mark - Dashboard Callbacks

- (void)dashboardManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeAPICall apiName = requestDetails.apiId;
    switch (apiName) {
        case AddGroup:
            WiSeLogInfo(@"Add Group Failed : %@",error);
            break;
        case EditGroup:
            WiSeLogInfo(@"Edit Group Failed : %@",error);
            break;
        case DeleteGroup:
            WiSeLogInfo(@"Delete Group Failed : %@",error);
            break;
        case GetGroup:
            WiSeLogInfo(@"Get Group Failed : %@",error);
            break;
        case AddDevice:
            WiSeLogInfo(@"Add Device Failed : %@",error);
            break;
        case EditDevice:
            WiSeLogInfo(@"Edit Device Failed : %@",error);
            break;
        case DeleteDevice:
            WiSeLogInfo(@"Delete Device Failed : %@",error);
            break;
        case SensorAssociation:
            WiSeLogInfo(@"Sensor Association Failed : %@",error);
            break;

            default:
            break;
    }
}

- (void)dashboardManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeAPICall apiName = requestDetails.apiId;
    switch (apiName) {
        case AddGroup:
            WiSeLogInfo(@"Add Group Success : %@",response);
            break;
        case EditGroup:
            WiSeLogInfo(@"Edit Group Success : %@",response);
            break;
        case DeleteGroup:
            WiSeLogInfo(@"Delete Group Success : %@",response);
            break;
        case AddDevice:
            WiSeLogInfo(@"Add Device Success : %@",response);
            break;
        case EditDevice:
            WiSeLogInfo(@"Edit Device Success : %@",response);
            break;
        case DeleteDevice:
            WiSeLogInfo(@"Delete Device Success : %@",response);
            break;
        case SensorAssociation:
            WiSeLogInfo(@"Sensor Association Success : %@",response);
            break;
        case GetGroup:
            WiSeLogInfo(@"Get Group Success : %@",response);
            break;
        case DeleteListenerInBulk:
            WiSeLogInfo(@"Get Group Success : %@",response);
            break;


        default:
            break;
    }

}


#pragma mark - Shutter Fetch

- (IBAction)btnShutterFetch:(id)sender {
    
    AppDelegate * mainDelegate                     = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse           = mainDelegate.loginInResponse;

    WiSeShutterFetchAPIRequest * request           = [WiSeShutterFetchAPIRequest new];
    request.token                                  = loginResponse.token;

    WiSeCloudAPIRequestRegisteredDetails * details = [WiSeCloudAPIRequestRegisteredDetails new];
//    details                                        = [dashboardManager callShutterFetchApiWithRequest:request];
    WiSeLogInfo(@"Shutter Fetch Status : %u",details.requestStatus);
    
}

#pragma mark - Shutter Update 

- (IBAction) btnShutterUpdateTapped:(id)sender {
    
    AppDelegate * mainDelegate                     = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse           = mainDelegate.loginInResponse;

    WiSeShutterUpdateAPIRequest * request          = [WiSeShutterUpdateAPIRequest new];
    request.token                                  = loginResponse.token;
    request.deviceCloudId                          = 13681;
    request.values                                 = @"1,5,4";
    request.remoteId                               = 13576;

    WiSeCloudAPIRequestRegisteredDetails * details = [WiSeCloudAPIRequestRegisteredDetails new];
//    details                                        = [dashboardManager callShutterUpdateApiWithRequest:request];
    WiSeLogInfo(@"Shutter Update Status : %u",details.requestStatus);
    
}

#pragma mark - Sensor Trigger Interval Set

- (IBAction)btnSensorTriggerIntervalSetTapped:(id)sender {
    
    AppDelegate * mainDelegate                       = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse             = mainDelegate.loginInResponse;

    WiSeSensorTriggerIntervalSetAPIRequest * request = [WiSeSensorTriggerIntervalSetAPIRequest new];
    request.token                                    = loginResponse.token;
    request.phoneCloudId                             = loginResponse.phoneCloudId;
    request.trigger                                  = mainDelegate.triggerData;

    WiSeCloudAPIRequestRegisteredDetails * details   = [WiSeCloudAPIRequestRegisteredDetails new];
//    details                                          = [dashboardManager callSensorTriggerIntervalSetApiWithRequest:request];
    WiSeLogInfo(@"Sensor Trigger Interval Set Status : %u",details.requestStatus);
    
}

#pragma mark - Sensor Trigger Log 

- (IBAction)btnSensorTriggerLog:(id)sender {
    
    AppDelegate * mainDelegate                     = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse           = mainDelegate.loginInResponse;

    WiSeCloudSensorAPIRequest * request            = [WiSeCloudSensorAPIRequest new];
    request.token                                  = loginResponse.token;
    request.phoneCloudId                           = loginResponse.phoneCloudId;

    WiSeCloudSensorItems * sensorItem              = [WiSeCloudSensorItems new];
//    sensorItem.triggerData = mainDelegate.triggerData;
    sensorItem.sequenceNumber                      = 10;
    sensorItem.sensorMeshId                        = 40;

    request.wiseSensorItemsList                    = [[NSArray alloc] initWithObjects:sensorItem, nil];

    WiSeCloudAPIRequestRegisteredDetails * details = [WiSeCloudAPIRequestRegisteredDetails new];
    details                                        = [dashboardManager sensorTriggerLogApiWithRequest:request];
    WiSeLogInfo(@"Sensor Trigger Log Status : %u",details.requestStatus);
    
}

#pragma mark - Make Multi Sensor

- (IBAction)btnMakeMultiSensorTapped:(id)sender {
    
    AppDelegate * mainDelegate                     = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse           = mainDelegate.loginInResponse;

    WiSeMakeMultiSensorAPIRequest * request        = [WiSeMakeMultiSensorAPIRequest new];
    request.token                                  = loginResponse.token;
    request.callFor                                = 2;// Default
    request.operationId                            = None;
    request.sequenceNumber                         = 10;
    request.phoneCloudId                           = loginResponse.phoneCloudId;
    request.wiseItemType                           = WiseSubItem;
    request.deviceType                             = 2009;
    request.status                                 = 1;
    request.deviceCloudId                          = 13179;
    
    WiSeCloudAPIRequestRegisteredDetails * details = [WiSeCloudAPIRequestRegisteredDetails new];
//    details                                        = [dashboardManager callMakeMultiSensorApiWithRequest:request];
    WiSeLogInfo(@"Make Multi Sensor Status : %u",details.requestStatus);

}

#pragma mark - Add Device

- (IBAction)btnAddDeviceTapped:(id)sender {
    AppDelegate * mainDelegate           = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;

    WiSeCloudDeviceDetails * subItem   = [WiSeCloudDeviceDetails new];
    subItem.deviceName                   = @"New Light";
    subItem.deviceUUID                   = @"0121970001000000000041c96f1ec132";
//    subItem.deviceUUID = @"00019700010900000000a0ec64a70556";
    subItem.deviceSequenceNumber         = 10;
    subItem.deviceType                   = 1002;
    subItem.deviceMeshId                 = 50;
    subItem.softwareVersion              = @"3.0.0";
    subItem.hardwareVersion              = @"0.4.0";
    subItem.firmwareVersion              = @"0.0.5";
    subItem.isConnectable                = 1;
    subItem.devicePairString             = @"A OF A TO Z";
    subItem.deviceStatus                 = 0;
    subItem.isFeedbackEnabled            = NO;
    subItem.groupCloudId                 = 0;
    subItem.rgbBValue                    = 10;
    subItem.rgbGValue                    = 11;
    subItem.rgbRValue                    = 12;
    subItem.intensityValue               = 14;
    subItem.warmCoolValue                = 15;

    WiSeCloudListenerInfo * subItem1 = [WiSeCloudListenerInfo new];
    subItem1.networkType             = @"1";
    subItem1.deviceMac               = @"00:03:5B:01:16:86";
    subItem1.deviceName              = @"Device 3";
    subItem1.deviceUUID              = @"00001700010900000000a0ec64a70556";
    subItem1.deviceIconId            = 1;
    subItem1.deviceType              = 2009;
    subItem1.deviceMeshId            = 55;
    subItem1.softwareVersion         = @"1.0.0";
    subItem1.hardwareVersion         = @"0.2.0";
    subItem1.firmwareVersion         = @"0.0.3";
    subItem1.isConnectable           = 0;
    subItem1.devicePairString        = @"B OF A TO Z";
    subItem1.deviceCloudId           = 0;
    subItem1.deviceStatus            = 1;
    subItem1.groupCloudId            = 74;
    subItem1.latitude                = 79.97999;
    subItem1.longtitude              = 78.90909;
    subItem1.miniRSSI                = 12;
    subItem1.organizationId          = 1;
    subItem1.deviceCloudId           = 7;
    
    WiSeCloudZoneRules * zone                     = [WiSeCloudZoneRules new];
    zone.zoneCloudId                              = 7;
    zone.zoneAction = 1;
    
    WiSeCloudZoneRules * zone1                    = [WiSeCloudZoneRules new];
    zone1.zoneCloudId                             = 8;
    zone1.zoneAction = 1;
    
    subItem1.zoneList  = [NSArray arrayWithObjects:zone,zone1, nil];

//    
//    WiSeCloudDeviceAPIRequest * apiRequest = [WiSeCloudDeviceAPIRequest new];
    WiSeCloudListenerAPIRequest * apiRequest = [WiSeCloudListenerAPIRequest new];
    apiRequest.token                         = loginResponse.token;
    apiRequest.phoneCloudId                  = loginResponse.phoneCloudId;

    apiRequest.listenerList  = [[NSArray alloc] initWithObjects:subItem1, nil];
    [dashboardManager addDeviceApiWithRequest:apiRequest WithHeader:[self getHeader]];
    
}


#pragma mark - Get Archived Devices

- (IBAction)btnGetArchivedDevices:(id)sender {
    AppDelegate * mainDelegate               = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse     = mainDelegate.loginInResponse;

    WiSeCloudDeviceAPIRequest * request      = [WiSeCloudDeviceAPIRequest new];
    request.token                            = loginResponse.token;
    request.phoneCloudId                     = loginResponse.phoneCloudId;
    request.start                            = 00000.00000;
    request.limit                            = 10;

    WiSeCloudAPIRequestRegisteredDetails * d = [dashboardManager getArchivedDeviceApiWithRequest:request];
    WiSeLogInfo(@"Getting Alll Device In A Group : %d",d.requestStatus);
    
}

#pragma mark - Get all Device

- (IBAction)btnGetAllDevice:(id)sender {
    AppDelegate * mainDelegate               = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse     = mainDelegate.loginInResponse;

    WiSeCloudDeviceAPIRequest * request      = [WiSeCloudDeviceAPIRequest new];
    request.token                            = loginResponse.token;
    request.phoneCloudId                     = loginResponse.phoneCloudId;
    request.groupCloudId                     = 97;
    request.start                            = 00000.00000;
    request.limit                            = 10;

    WiSeCloudAPIRequestRegisteredDetails * d = [dashboardManager getAllDeviceAgainstUserApiWithRequest:request WithHeader:[self getHeader]];
    WiSeLogInfo(@"Getting Alll Device In A Group : %d",d.requestStatus);
    
}

#pragma mark - Get a Device

- (IBAction)btnGetADevice:(id)sender {
    AppDelegate * mainDelegate               = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse     = mainDelegate.loginInResponse;

    WiSeCloudDeviceAPIRequest * request      = [WiSeCloudDeviceAPIRequest new];
    request.token                            = loginResponse.token;
    request.phoneCloudId                     = loginResponse.phoneCloudId;
    request.deviceCloudId                    = 3;

//    WiSeCloudAPIRequestRegisteredDetails * d = [dashboardManager callGetADeviceApiWithRequest:request];
//    WiSeLogInfo(@"Getting Alll Device In A Group : %d",d.requestStatus);
    
}


#pragma mark - Edit Device

- (IBAction)btnEditTapped:(id)sender {
    AppDelegate * mainDelegate                   = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse         = mainDelegate.loginInResponse;

    WiSeCloudDeviceDetails * subItem             = [WiSeCloudDeviceDetails new];
    subItem.deviceName                           = @"New Light";
    subItem.deviceUUID                           = @"0121970001000000000041c96f1ec132";
    subItem.deviceSequenceNumber                 = 10;
    subItem.deviceType                           = 1002;
    subItem.deviceMeshId                         = 50;
    subItem.softwareVersion                      = @"3.0.0";
    subItem.hardwareVersion                      = @"0.4.0";
    subItem.firmwareVersion                      = @"0.0.5";
    subItem.isConnectable                        = 1;
    subItem.devicePairString                     = @"A OF A TO Z";
    subItem.deviceStatus                         = 0;
    subItem.isFeedbackEnabled                    = NO;
    subItem.groupCloudId                         = 157;
    subItem.rgbBValue                            = 10;
    subItem.rgbGValue                            = 11;
    subItem.rgbRValue                            = 12;
    subItem.intensityValue                       = 14;
    subItem.warmCoolValue                        = 15;
    subItem.deviceCloudId                        = 1528;

    WiSeDeviceGroupAssociationDetails * details  = [WiSeDeviceGroupAssociationDetails new];
    details.oldGroupCloudId                      = 157;
    details.freshGroupCloudId                    = 961;

    WiSeDeviceGroupAssociationDetails * details1 = [WiSeDeviceGroupAssociationDetails new];
    details1.oldGroupCloudId                     = 157;
    details1.freshGroupCloudId                   = 962;

    subItem.deviceGroupAssociationList           = [NSArray arrayWithObjects:details,details1, nil];


    WiSeCloudDeviceAPIRequest * apiRequest       = [WiSeCloudDeviceAPIRequest new];
    apiRequest.token                             = loginResponse.token;
    apiRequest.phoneCloudId                      = loginResponse.phoneCloudId;

    apiRequest.deviceList                        = [[NSArray alloc] initWithObjects:subItem, nil];
    [dashboardManager editDeviceApiWithRequest:apiRequest];

}

#pragma mark - Delete Device

- (IBAction)btnDeleteTapped:(id)sender {
    AppDelegate * mainDelegate             = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse   = mainDelegate.loginInResponse;

    WiSeCloudDeviceDetails * subItem       = [WiSeCloudDeviceDetails new];
    subItem.deviceCloudId                    = 1;
    WiSeCloudDeviceDetails * subItem1       = [WiSeCloudDeviceDetails new];
    subItem1.deviceCloudId                    = 28;
    subItem1.deviceUUID = @"asdflsdkfjhldks";
    subItem1.deviceType = 1010;
    


    WiSeCloudDeviceAPIRequest * apiRequest = [WiSeCloudDeviceAPIRequest new];
    apiRequest.token                         = loginResponse.token;
    apiRequest.phoneCloudId                  = loginResponse.phoneCloudId;
//    apiRequest.deviceCloudId                 = 29;

    apiRequest.deviceList  = [[NSArray alloc] initWithObjects:subItem1, nil];
    [dashboardManager deleteDeviceApiWithRequest:apiRequest];
    
    [dashboardManager clearSecureDeviceApiWithRequest:apiRequest];

    
}

#pragma mark - Get Dashboard

- (IBAction)btnGetDashboard:(id)sender {
    
    uint8_t netid[2];
    netid[0]                                      = 0x45;
    netid[1]                                      = 0x47;

    NSData * networkId                            = [[NSData alloc] initWithBytes:(void *) &netid  length:sizeof(netid)];

    AppDelegate * mainDelegate                    = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse          = mainDelegate.loginInResponse;


    WiSeCloudAPIRequestRegisteredDetails * status;// = [dashboardManager callDashBoardApiWithRequest:dashboardRequest];
    WiSeLogInfo(@"Dashboard Status : %d",status.requestRegisteredId);
    
}

#pragma mark - Update Direct Operation Status

- (IBAction)btnUpdateStatusTapped:(id)sender {
    
    if ([NSThread isMainThread]) {
        [self performSelectorInBackground:@selector(btnUpdateStatusTapped:) withObject:self];
         WiSeLogInfo(@"****************************************************************************************************** Main Thread");
        return;
    }

    WiSeUpdateDirectOperationStatusAPIRequest * wiSeUpdateDirectOperationStatusAPIRequest = [WiSeUpdateDirectOperationStatusAPIRequest new];

    WiSeDirectRemoteOperationDetails * details                                            = [WiSeDirectRemoteOperationDetails new];

    wiSeUpdateDirectOperationStatusAPIRequest.wiseUpdateDirectOperationStatusDetailsList  = [[NSArray alloc] initWithObjects:details,nil];


    WiSeCloudAPIRequestRegisteredDetails * status;// = [dashboardManager callUpdateDirectOperationStatusApiWithRequest:wiSeUpdateDirectOperationStatusAPIRequest];

    WiSeLogInfo(@"WiSeUpdateDirectOperationStatusAPIRequest Status : %d",status.requestRegisteredId);
    WiSeLogInfo(@"****************************************************************************************************** Background Thread");
}

#pragma mark - Add Group

- (IBAction)btnAddGroupTapped:(id)sender {
//    AppDelegate * mainDelegate                    = (AppDelegate *) [[UIApplication sharedApplication] delegate];
//    WiSeLoginApiResponse * loginResponse          = mainDelegate.loginInResponse;
//
//    WiSeCloudGroupAPIRequest * addGroupRequest    = [WiSeCloudGroupAPIRequest new];
//    addGroupRequest.token                         = loginResponse.token;
//    addGroupRequest.phoneCloudId                  = loginResponse.phoneCloudId;
//
//    NSMutableArray * arr                          = [[NSMutableArray alloc] init];
//
//    ///for (int i = 0; i < 5; i++) {
//    WiSeDashBoardItems * group                    = [WiSeDashBoardItems new];
//       // if (i%2 == 0) {
//    group.groupIconId                             = 2;
////}else {
////            group.groupIconId                                  = 2;
////        }
//
//    group.groupMeshId                             = 31;
//    group.groupName                               = [NSString stringWithFormat:@"Floor 3 TV Room"];
//    group.parentGroupCloudId                      = 962;
//    group.parentGroupMeshId                       = 30;
//    group.groupPath                               = @"0";
//
//
//        [arr addObject:group];
//    //}
//
//    addGroupRequest.groupList                     = [NSArray arrayWithArray:arr];
//
//    WiSeCloudAPIRequestRegisteredDetails * status = [dashboardManager addGroupApiWithRequest:addGroupRequest];
//    WiSeLogInfo(@"Add Group Status : %d",status.requestRegisteredId);
    
    WiSeCloudListenerAPIRequest * req = [WiSeCloudListenerAPIRequest new];
    req.start                         = 1;
    req.limit                         = 300;
    req.listenerCloudId               = 1500;

    WiSeCloudListenerInfo * info      = [WiSeCloudListenerInfo new];
    info.deviceUUID                   = @"0121970001000000000041c96f1ec132";
    info.deviceType                   = 20001;
    info.organizationId               = 3;
    
    req.listenerList = [NSArray arrayWithObjects:info, nil];
    
    req.organizationList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:52], nil];
    
//    WiSeCloudAPIRequestRegisteredDetails * status = [dashboardManager getListenersFromOrganizationsApiWithRequest:req WithHeader:[self getHeader]];
//        WiSeLogInfo(@"Get Listener Status : %d",status.requestRegisteredId);
    
//    WiSeCloudAPIRequestRegisteredDetails *status = [dashboardManager getListenerZoneMappingApiWithRequest:req WithHeader:[self getHeader]];
//    WiSeLogInfo(@"Get Listener Zone Mapping Status : %d",status.requestRegisteredId);
    
    WiSeCloudAPIRequestRegisteredDetails *status = [dashboardManager deleteListenerApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Get Listener Zone Mapping Status : %d",status.requestRegisteredId);
    
}


#pragma mark - Edit Group

- (IBAction)btnEditGroup:(id)sender {
    
    WiSeCloudListenerAPIRequest * req = [WiSeCloudListenerAPIRequest new];
    
    WiSeCloudListenerInfo * info = [WiSeCloudListenerInfo new];
//    info.listenerCloudId = 1;
    info.latitude = 67.00934;
    info.longtitude = 56.99098;
    info.listenerName = @"L 1";
    req.listenerList = [NSArray arrayWithObject:info];
    
    WiSeCloudAPIRequestRegisteredDetails * status = [dashboardManager editListenerApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Edit Listener Status : %d",status.requestRegisteredId);
    
//    AppDelegate * mainDelegate                    = (AppDelegate *) [[UIApplication sharedApplication] delegate];
//    WiSeLoginApiResponse * loginResponse          = mainDelegate.loginInResponse;
//
//    WiSeCloudGroupAPIRequest * editGroupRequest   = [WiSeCloudGroupAPIRequest new];
//    editGroupRequest.token                        = loginResponse.token;
//    editGroupRequest.phoneCloudId                 = loginResponse.phoneCloudId;
//
//    WiSeDashBoardItems * group                    = [WiSeDashBoardItems new];
//    group.groupIconId                             = 2;
//    group.groupCloudId                            = 971;
//    group.groupName                               = @"Floor 2 TV Room";
//    group.parentGroupCloudId                      = 961;
//    group.parentGroupMeshId                       = 28;
//
//    editGroupRequest.groupList                    = [[NSArray alloc] initWithObjects:group, nil];
//
//
//    WiSeCloudAPIRequestRegisteredDetails * status = [dashboardManager editGroupApiWithRequest:editGroupRequest];
//    WiSeLogInfo(@"Edit Group Status : %d",status.requestRegisteredId);
    
}

#pragma mark - Get Group 

- (IBAction)btnGetGroup:(id)sender {
    AppDelegate * mainDelegate           = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;

    WiSeCloudGroupAPIRequest * request   = [WiSeCloudGroupAPIRequest new];
    request.token                        = loginResponse.token;
    request.phoneCloudId                 = loginResponse.phoneCloudId;
    request.start                        = 0.000000;
    request.limit                        = 100;

    pageNationValue                      += 10;

    WiSeCloudAPIRequestRegisteredDetails * status = [dashboardManager getGroupApiWithRequest:request];
    WiSeLogInfo(@"Get Group Status : %d",status.requestRegisteredId);
}

#pragma mark - Get Groups

- (IBAction)btnGetArchivedGroup:(id)sender {
    AppDelegate * mainDelegate           = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;

    WiSeCloudGroupAPIRequest * request   = [WiSeCloudGroupAPIRequest new];
    request.token                        = loginResponse.token;
    request.phoneCloudId                 = loginResponse.phoneCloudId;
    request.start                        = 1456217287.229804;
    request.limit                        = 100
    ;

    pageNationValue                      += 10;
    
    WiSeCloudAPIRequestRegisteredDetails * status = [dashboardManager getArchivedGroupsApiWithRequest:request];
    WiSeLogInfo(@"Get Group Status : %d",status.requestRegisteredId);
}

#pragma mark - Delete Group

- (IBAction)btnDeleteGroupTapped:(id)sender {
    AppDelegate * mainDelegate                    = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse          = mainDelegate.loginInResponse;

    WiSeCloudGroupAPIRequest * editGroupRequest   = [WiSeCloudGroupAPIRequest new];
    editGroupRequest.token                        = loginResponse.token;
    editGroupRequest.phoneCloudId                 = loginResponse.phoneCloudId;
    editGroupRequest.groupCloudId                 = 66;

    WiSeDashBoardItems * group                    = [WiSeDashBoardItems new];
    group.groupCloudId                            = 19;

    WiSeDashBoardItems * group1                   = [WiSeDashBoardItems new];
    group1.groupCloudId                           = 20;

    WiSeDashBoardItems * group11                  = [WiSeDashBoardItems new];
    group11.groupCloudId                          = 21;

    editGroupRequest.groupList                    = [[NSArray alloc] initWithObjects:group,group1,group11, nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [dashboardManager deleteGroupApiWithRequest:editGroupRequest];
    WiSeLogInfo(@"Delete Group Status : %d",status.requestRegisteredId);
}

#pragma mark - Sensor Linking 

- (IBAction)btnLinkToSensor:(id)sender {

    isClicked                                     = !isClicked;

    AppDelegate * mainDelegate                    = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse          = mainDelegate.loginInResponse;

    // 13246
    WiSeCloudSensorItems * item                   = [WiSeCloudSensorItems new];
    item.device_GroupCloudId                      = 25;
    item.sensorCloudId                            = 26;
    if (isClicked) {
    item.associationAction                        = RemoveSensor;
    }else {
    item.associationAction                        = AddSensor;
    }

    item.itemType                                 = WiseSubItem;
    item.sequenceNumber                           = 15;

    WiSeCloudSensorAPIRequest * apiRequest        = [WiSeCloudSensorAPIRequest new];
    apiRequest.token                              = loginResponse.token;
    apiRequest.phoneCloudId                       = loginResponse.phoneCloudId;

    apiRequest.wiseSensorItemsList                = [[NSMutableArray alloc] initWithObjects:item, nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [dashboardManager sensorAssociationApiWithRequest:apiRequest];
    WiSeLogInfo(@"Sensor Association Status : %d",status.requestRegisteredId);
}

#pragma mark - Get Sensor Linking

- (IBAction)btnGetSensorLinking:(id)sender {
    AppDelegate * mainDelegate                    = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse          = mainDelegate.loginInResponse;

    WiSeCloudSensorAPIRequest * apiRequest  = [WiSeCloudSensorAPIRequest new];
    apiRequest.token                              = loginResponse.token;
    apiRequest.phoneCloudId                       = loginResponse.phoneCloudId;
    apiRequest.start                              = 0;
    apiRequest.limit                              = 100;

    WiSeCloudAPIRequestRegisteredDetails * status = [dashboardManager getSensorAssociationApiWithRequest:apiRequest];
    WiSeLogInfo(@"Sensor Association Status : %d",status.requestRegisteredId);
}

#pragma mark - Get Sensor Linking

- (IBAction)btnGetArchivedSensorLinking:(id)sender {
    AppDelegate * mainDelegate                    = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse          = mainDelegate.loginInResponse;

    WiSeCloudSensorAPIRequest * apiRequest        = [WiSeCloudSensorAPIRequest new];
    apiRequest.token                              = loginResponse.token;
    apiRequest.phoneCloudId                       = loginResponse.phoneCloudId;
    apiRequest.start                              = 0;
    apiRequest.limit                              = 100;

    WiSeCloudAPIRequestRegisteredDetails * status = [dashboardManager getArchivedSensorAssociationApiWithRequest:apiRequest];
    WiSeLogInfo(@"Archived Sensor Association Status : %d",status.requestRegisteredId);
}


@end
