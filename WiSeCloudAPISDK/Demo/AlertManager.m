 //
//  AlertManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "AlertManager.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import <WiSeAppLog/WiSeLogManager.h>
#import "AppDelegate.h"
#import "WiSeNetworkUtil.h"
#import "WiSeAPIHeader.h"
#import "WiSeCloudSnoozeSettingDetails.h"
#import "WiSeCloudSnoozeSettingRequest.h"
#import "WiSeCheckOutRequest.h"
#import "WiSeSelfAssignResetAPIRequest.h"
#import "WiSeCloudTagRequest.h"
#import "WiSeCloudZoneRules.h"
#import "WiSeCloudZoneAPIRequest.h"
#import "WiSeZoneListenerMapping.h"
#import "WiSeCloudTagInfo.h"

@implementation AlertManager {
    WiSeAlertManager * alertManager;
    WiSeTagManager * tagManager;
    WiSeZoneManager * zoneManager;
    NSString * strToken;
    int phoneId;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    alertManager                         = [WiSeAlertManager new];
    alertManager.delegate                = self;

    tagManager                           = [WiSeTagManager new];
    tagManager.delegate                  = self;

    zoneManager                          = [WiSeZoneManager new];
    zoneManager.delegate                 = self;

    AppDelegate * mainDelegate           = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;
    strToken                             = loginResponse.token;
    phoneId                              = loginResponse.phoneCloudId;
}

#pragma mark - Zone Manager Delegate

- (void)zoneManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case AddZone:
            WiSeLogInfo(@"Add Zone Failed : %@",error.localizedDescription);
            break;
        case EditZone:
            WiSeLogInfo(@"Edit Zone Failed : %@",error.localizedDescription);
            break;
        case GetZone:
            WiSeLogInfo(@"Get Zone Failed : %@",error.localizedDescription);
            break;
        case DeleteZone:
            WiSeLogInfo(@"Delete Zone Failed : %@",error.localizedDescription);
            break;
            
        default:
            break;
    }

}

- (void)zoneManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case AddZone:
            WiSeLogInfo(@"Add Zone Success : %@",response);
            break;
        case EditZone:
            WiSeLogInfo(@"Edit Zone Success : %@",response);
            break;
        case GetZone:
            WiSeLogInfo(@"Get Zone Success : %@",response);
            break;
        case DeleteZone:
            WiSeLogInfo(@"Delete Zone Success : %@",response);
            break;
            
        default:
            break;
    }
}


#pragma mark - Tag Manager Delegate

- (void)tagManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case AddTag:
            WiSeLogInfo(@"Add Tag Failed : %@",error.localizedDescription);
            break;
        case EditTag:
            WiSeLogInfo(@"Edit Tag Failed : %@",error.localizedDescription);
            break;
        case GetTag:
            WiSeLogInfo(@"Get Tag Failed : %@",error.localizedDescription);
            break;
        case DeleteTag:
            WiSeLogInfo(@"Delete Tag Failed : %@",error.localizedDescription);
            break;
        default:
            break;
    }
 
}

- (void)tagManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case AddTag:
            WiSeLogInfo(@"Add Tag Success : %@",response);
            break;
        case EditTag:
            WiSeLogInfo(@"Edit Tag Success : %@",response);
            break;
        case GetTag:
            WiSeLogInfo(@"Get Tag Success : %@",response);
            break;
        case DeleteTag:
            WiSeLogInfo(@"Delete Tag Success : %@",response);
            break;
            
        default:
            break;
    }

}

#pragma mark - Alert Manager Delegate

- (void)alertManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case SetUpdateSnoozeTiming:
            WiSeLogInfo(@"Set/Update Snooze Timing Failed : %@",error.localizedDescription);
            break;
        case CheckOut:
            WiSeLogInfo(@"Enable/Disable CheckOut API Failed : %@",error.localizedDescription);
            break;
        case SelfAssignReset:
            WiSeLogInfo(@"Self Assign-Assign Reset API Failed : %@",error.localizedDescription);
            break;
            
        default:
            break;
    }
}

- (void)alertManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case SetUpdateSnoozeTiming:
            WiSeLogInfo(@"Set/Update Snooze Timing Success : %@",response);
            break;
        case CheckOut:
            WiSeLogInfo(@"Enable/Disable CheckOut API Success : %@",response);
            break;
        case SelfAssignReset:
            WiSeLogInfo(@"Self Assign-Assign Reset API Success : %@",response);
            break;
            
        default:
            break;
    }
}

#pragma mark - Set/Update Snooze Timing

- (IBAction)btnSnoozeTimingPressed:(id)sender {
    WiSeCloudSnoozeSettingRequest * request       = [WiSeCloudSnoozeSettingRequest new];

    WiSeCloudSnoozeSettingDetails * orgInfo       = [WiSeCloudSnoozeSettingDetails new];
    orgInfo.alertType                             = 10;
    orgInfo.snoozeCount                           = 20;
    orgInfo.snoozeTime                            = 30;

    request.snoozeSettingsList                    = [NSArray arrayWithObjects:orgInfo, nil];

    WiSeAPIHeader * header                        = [WiSeAPIHeader new];
    header.userToken                              = strToken;
    header.phoneCloudId                           = phoneId;
    header.organizationId                         = 1;

    WiSeCloudAPIRequestRegisteredDetails * status = [alertManager setUpdateSnoozeTimeApiWithRequest:request WithHeader:header];
    WiSeLogInfo(@"Set/Update Snooze Timing Status : %u",status.requestRegisteredId);
}

#pragma mark - Enable/Disable CheckOut API

- (IBAction)btnChekOutPressed:(id)sender {
    WiSeCheckOutRequest * request       = [WiSeCheckOutRequest new];
    
    request.checkOutInterval = 10;
    request.tagId = 20;
    request.checkoutAction = 1;
    
    WiSeAPIHeader * header                        = [WiSeAPIHeader new];
    header.userToken                              = strToken;
    header.phoneCloudId                           = phoneId;
    header.organizationId                         = 1;
    
    WiSeCloudAPIRequestRegisteredDetails * status = [alertManager enableDisableCheckOutApiWithRequest:request WithHeader:header];
    WiSeLogInfo(@"Enable/Disable CheckOut API Status : %u",status.requestRegisteredId);
}

#pragma mark - Self Assign-Assign Reset API

- (IBAction)btnselfAssignResetPressed:(id)sender {
    WiSeSelfAssignResetAPIRequest * request       = [WiSeSelfAssignResetAPIRequest new];
    request.tagCloudId                            = 2;
    request.messageId                              = 300;
    request.assignName                            = @"Test";

    WiSeAPIHeader * header                        = [WiSeAPIHeader new];
    header.userToken                              = strToken;
    header.phoneCloudId                           = phoneId;
    header.organizationId                         = 1;

    WiSeCloudAPIRequestRegisteredDetails * status = [alertManager selfAssignResetApiWithRequest:request WithHeader:header];
    WiSeLogInfo(@"Self Assign-Assign Reset API Status : %u",status.requestRegisteredId);
}

- (WiSeAPIHeader *) getHeader {
    WiSeAPIHeader * header                        = [WiSeAPIHeader new];
    header.userToken                              = strToken;
    header.phoneCloudId                           = phoneId;
    header.organizationId                         = 1;
    return header;
}

#pragma mark - Add Tag API

- (IBAction)addTagPressed:(id)sender {
    WiSeCloudTagRequest * req                      = [WiSeCloudTagRequest new];
    WiSeCloudTagInfo * tInfo                       = [WiSeCloudTagInfo new];
    tInfo.tagMeshId                                = 10;
    tInfo.tagMajor                                 = 11;
    tInfo.tagMinor                                 = 12;
    tInfo.tagName                                  = @"Tag A";
    tInfo.deviceUUID                               = @"00029700010900000000a0ec64a70556";

    WiSeCloudTagInfo * tInfo1                      = [WiSeCloudTagInfo new];
    tInfo1.tagMeshId                               = 11;
    tInfo1.tagMajor                                = 11;
    tInfo1.tagMinor                                = 12;
    tInfo1.tagName                                 = @"Tag B";
    tInfo1.deviceUUID                              = @"00029700010900000000a0ec64a70556";

    req.tagsList                                   = [NSArray arrayWithObjects:tInfo,tInfo1,nil];

    WiSeCloudAPIRequestRegisteredDetails * status  = [tagManager addTagApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Add Tag API Status : %u",status.requestRegisteredId);

    WiSeCloudAPIRequestRegisteredDetails * status1 = [tagManager deleteSecureTagApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Add Secure Tag API Status : %u",status1.requestRegisteredId);
}

#pragma mark - Edit Tag API

- (IBAction)editTagPressed:(id)sender {
    WiSeCloudTagRequest * req                     = [WiSeCloudTagRequest new];
    WiSeCloudTagInfo * tInfo                      = [WiSeCloudTagInfo new];
    tInfo.tagMeshId                               = 10;
    tInfo.tagMajor                                = 11;
    tInfo.tagMinor                                = 12;
    tInfo.tagName                                 = @"Tag A";

    WiSeCloudTagInfo * tInfo1                     = [WiSeCloudTagInfo new];
    tInfo1.tagMeshId                              = 11;
    tInfo1.tagMajor                               = 11;
    tInfo1.tagMinor                               = 12;
    tInfo1.tagName                                = @"Tag B";

    req.tagsList                                  = [NSArray arrayWithObjects:tInfo,tInfo1,nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [tagManager editTagApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Edit Tag API Status : %u",status.requestRegisteredId);
}

#pragma mark - Get Tag API

- (IBAction)getTagPressed:(id)sender {
    WiSeCloudTagRequest * req                     = [WiSeCloudTagRequest new];
    req.start                                     = 1;
    req.limit                                     = 300;

//    WiSeCloudAPIRequestRegisteredDetails * status = [tagManager getTagApiWithRequest:req WithHeader:[self getHeader]];
//    WiSeLogInfo(@"Get Tag API Status : %u",status.requestRegisteredId);
    
    [tagManager getArchivedTagApiWithRequest:req WithHeader:[self getHeader]];
}

#pragma mark - Delete Tag API

- (IBAction)deleteTagPressed:(id)sender {
    WiSeCloudTagRequest * req                     = [WiSeCloudTagRequest new];
    req.start                                     = 1;
    req.limit                                     = 300;

    WiSeCloudAPIRequestRegisteredDetails * status = [tagManager deleteTagApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Delete Tag API Status : %u",status.requestRegisteredId);
}

#pragma mark - Add Zone API

- (IBAction)addZoneTapped:(id)sender {
    WiSeCloudZoneAPIRequest * req                 = [WiSeCloudZoneAPIRequest new];

    WiSeCloudZoneRules * rule                     = [WiSeCloudZoneRules new];
    rule.zoneType                                 = 2;
    rule.zoneName                                 = @"Zone A2";
    rule.organizationId                           = 3;
    rule.zoneCloudId = 7;
    
    WiSeZoneListenerMapping * mapping = [WiSeZoneListenerMapping new];
    mapping.listenerCloudId = 1;
    mapping.mappingAction = 1;
    
//    rule.zoneListenerMappingList = [NSArray arrayWithObjects:mapping, nil];

    req.zoneList                                  = [NSArray arrayWithObjects:rule, nil];
//    WiSeCloudAPIRequestRegisteredDetails * status = [zoneManager addZoneApiWithRequest:req WithHeader:[self getHeader]];
//    WiSeLogInfo(@"Add Zone API Status : %u",status.requestRegisteredId);
    
    WiSeCloudAPIRequestRegisteredDetails * status = [zoneManager mapZoneAndListenerApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Map Zone and Listener API Status : %u",status.requestRegisteredId);
}

#pragma mark - Edit Zone API

- (IBAction)editZoneTapped:(id)sender {
    WiSeCloudZoneAPIRequest * req                 = [WiSeCloudZoneAPIRequest new];

    WiSeCloudZoneRules * rule                     = [WiSeCloudZoneRules new];
    rule.zoneType                                 = 2;
    rule.zoneName                                 = @"Zone A23";
    rule.organizationId                           = 3;
    rule.zoneCloudId                              = 7;

    req.zoneList                                  = [NSArray arrayWithObjects:rule, nil];
    WiSeCloudAPIRequestRegisteredDetails * status = [zoneManager editZoneApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Edit Zone API Status : %u",status.requestRegisteredId);
}

#pragma mark - Get Zone API

- (IBAction)getZoneTapped:(id)sender {
    WiSeCloudZoneAPIRequest * req                 = [WiSeCloudZoneAPIRequest new];
    req.start                                     = 1;
    req.limit                                     = 300;
    req.zoneCloudId = 9;
    
    req.organizationList = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:4], nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [zoneManager getZoneApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Get Zone API Status : %u",status.requestRegisteredId);

    status                                        = [zoneManager getZonesFromOrganizationsApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Get Zone Mapping API Status : %u",status.requestRegisteredId);
}

#pragma mark - Delete Zone API

- (IBAction)deleteZoneTapped:(id)sender {
    WiSeCloudZoneAPIRequest * req                 = [WiSeCloudZoneAPIRequest new];
    req.zoneCloudId = 6;

    WiSeCloudZoneRules * rule                     = [WiSeCloudZoneRules new];
    rule.zoneCloudId                              = 5;

    WiSeCloudZoneRules * rule1                    = [WiSeCloudZoneRules new];
    rule1.zoneCloudId                             = 9;

//    req.zoneList                                  = [NSArray arrayWithObjects:rule,rule1, nil];
    WiSeCloudAPIRequestRegisteredDetails * status = [zoneManager deleteZoneApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Delete Zone API Status : %u",status.requestRegisteredId);
}

@end
