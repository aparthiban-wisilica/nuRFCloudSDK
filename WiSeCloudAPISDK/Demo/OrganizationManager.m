//
//  OrganizationManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 11/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "OrganizationManager.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeAppError.h>
#import <WiSeAppLog/WiSeLogManager.h>
#import "AppDelegate.h"
#import "WiSeCloudOrganizationRequest.h"
#import "WiSeCloudOrganizationInfo.h"
#import "WiSeNetworkUtil.h"
#import "WiSeAPIHeader.h"
#import "WiSeCloudZoneRules.h"
#import "WiSeCloudInfantDetails.h"
#import "WiSeCloudInfantRequest.h"
#import "WiSeCloudMapAPIRequest.h"

@implementation OrganizationManager {
    WiSeOrganizationManager * orgManager;
    WiSeInfantManager * infantManage;
    WiSeMapManager * mapManager;
    NSString * strToken;
    int phoneId;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    orgManager            = [WiSeOrganizationManager new];
    orgManager.delegate   = self;

    infantManage          = [WiSeInfantManager new];
    infantManage.delegate = self;

    mapManager            = [WiSeMapManager new];
    mapManager.delegate   = self;

    AppDelegate * mainDelegate           = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;
    strToken                             = loginResponse.token;
    phoneId                              = loginResponse.phoneCloudId;
}

- (WiSeAPIHeader *) getHeader {
    WiSeAPIHeader * header                        = [WiSeAPIHeader new];
    header.userToken                              = strToken;
    header.phoneCloudId                           = phoneId;
    header.organizationId                         = 1;
    header.subOrganizationId = 0;//35;
    return header;
}

- (void)mapManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeLogInfo(@"Failed : %@",error.localizedDescription);
}

- (void)mapManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeLogInfo(@"Success : %@",response);
}


#pragma mark - Infant Callbacks

- (void)infantManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case AddInfant:
            WiSeLogInfo(@"Add Infant Failed : %@",error.localizedDescription);
            break;
            
        default:
            break;
    }
 
}

- (void)infantManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case AddInfant:
            WiSeLogInfo(@"Add Infant Success : %@",response);
            break;
            
        default:
            break;
    }

}

#pragma mark - Organization Callbacks

- (void)organizationManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case AddOrganization:
            WiSeLogInfo(@"Add Organization Failed : %@",error.localizedDescription);
            break;
            
        default:
            break;
    }
}

- (void)organizationManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case AddOrganization:
            WiSeLogInfo(@"Add Organization Success : %@",response);
            break;
        case DeleteOrganizationInBulk:
            WiSeLogInfo(@"Add Organization Success : %@",response);
        default:
            break;
    }
}


#pragma mark - Add Organization 

- (IBAction)addOrgTouched:(id)sender {
    WiSeCloudOrganizationRequest * request        = [WiSeCloudOrganizationRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneId;

    WiSeCloudOrganizationInfo * orgInfo           = [WiSeCloudOrganizationInfo new];
    orgInfo.organizationName                      = @"Sub 1";
    orgInfo.customerId                            = 1;
    orgInfo.rootOrganizationId                    = 1;
    
    NSMutableArray * arrOrgList = [[NSMutableArray alloc] init];
    for (int i = 0; i< 30; i++) {
        WiSeCloudOrganizationInfo * orgInfo           = [WiSeCloudOrganizationInfo new];
        orgInfo.organizationName                      = [NSString stringWithFormat:@"Sub Org %d",i+1];
        orgInfo.customerId                            = 1;
        orgInfo.rootOrganizationId                    = 1;
        [arrOrgList addObject:orgInfo];
    }
    
    request.organizationList                      = arrOrgList;

    WiSeAPIHeader * header                        = [WiSeAPIHeader new];
    header.userToken                              = strToken;
    header.phoneCloudId                           = phoneId;
    header.organizationId                         = 1;


    WiSeCloudAPIRequestRegisteredDetails * status = [orgManager addOrganizationApiWithRequest:request WithHeader:header];
    WiSeLogInfo(@"Add Org Status : %u",status.requestRegisteredId);
}

#pragma mark - Edit Organization

- (IBAction)editOrgTouched:(id)sender {
    WiSeCloudOrganizationRequest * request        = [WiSeCloudOrganizationRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneId;

    WiSeCloudOrganizationInfo * orgInfo           = [WiSeCloudOrganizationInfo new];
    orgInfo.organizationName                      = @"Sub Org 030";
    orgInfo.organizationId                        = 88;
    
    request.organizationList                      = [NSArray arrayWithObjects:orgInfo, nil];

    WiSeAPIHeader * header = [WiSeAPIHeader new];
    header.userToken       = strToken;
    header.phoneCloudId    = phoneId;
    header.organizationId  = 1;
    
    WiSeCloudAPIRequestRegisteredDetails * status = [orgManager editOrganizationApiWithRequest:request WithHeader:header];
    WiSeLogInfo(@"Edit Org Status : %u",status.requestRegisteredId);
}

#pragma mark - Delete Organization

- (IBAction)deleteOrgTouched:(id)sender {
    WiSeCloudOrganizationRequest * request        = [WiSeCloudOrganizationRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneId;

    WiSeCloudOrganizationInfo * orgInfo           = [WiSeCloudOrganizationInfo new];
    orgInfo.organizationId                        = 75;

    WiSeCloudOrganizationInfo * orgInfo1          = [WiSeCloudOrganizationInfo new];
    orgInfo1.organizationId                       = 76;

//    request.organizationList                      = [NSArray arrayWithObjects:orgInfo,orgInfo1, nil];

    WiSeAPIHeader * header                        = [WiSeAPIHeader new];
    header.userToken                              = strToken;
    header.phoneCloudId                           = phoneId;
    header.organizationId                         = 77;

    WiSeCloudAPIRequestRegisteredDetails * status = [orgManager deleteOrganizationApiWithRequest:request WithHeader:header];
    WiSeLogInfo(@"Delete Org Status : %u",status.requestRegisteredId);
}

#pragma mark - Get Organization

- (IBAction)getOrgTouched:(id)sender {
    WiSeCloudOrganizationRequest * request        = [WiSeCloudOrganizationRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneId;
    request.start                                 = 1;
    request.limit                                 = 200;

    WiSeAPIHeader * header = [WiSeAPIHeader new];
    header.userToken = strToken;
    header.phoneCloudId = phoneId;
    header.organizationId = 1;
    
    WiSeCloudAPIRequestRegisteredDetails * status = [orgManager getOrganizationApiWithRequest:request WithHeader:header];
    WiSeLogInfo(@"Get Org Status : %u",status.requestRegisteredId);
}

#pragma mark - Add Infant

- (IBAction)addInfantTapped:(id)sender {
    WiSeCloudInfantRequest * req                  = [WiSeCloudInfantRequest new];

    WiSeCloudInfantDetails * details              = [WiSeCloudInfantDetails new];
    details.infantFirstName                       = @"Alfred";
    details.infantLastName                        = @"Zaak";
    details.infantHosId                           = @"H20";
    details.organizationId = 4;
//    details.tagCloudId                            = 3;

    WiSeCloudZoneRules * zone                     = [WiSeCloudZoneRules new];
    zone.zoneCloudId                              = 3;
    zone.zoneType                                 = 1;
    zone.zoneSafeTime                             = 11;
    zone.organizationId = 4;
    details.zoneList                              = [NSArray arrayWithObject:zone];
    req.infantList                                = [NSArray arrayWithObject:details];

    WiSeCloudAPIRequestRegisteredDetails * status = [infantManage addInfantApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Add Infant Status : %u",status.requestRegisteredId);
}

#pragma mark - Get Infant

- (IBAction)getInfantTapped:(id)sender {
    WiSeCloudInfantRequest * req                  = [WiSeCloudInfantRequest new];
    req.infantCloudId = 3;
    req.start                                     = 1;
    req.limit                                     = 300;
    
    req.organizationList = [NSArray arrayWithObjects:[NSNumber numberWithInt:3
                                                      ],[NSNumber numberWithInt:4], nil];

    WiSeCloudAPIRequestRegisteredDetails * status = [infantManage getInfantApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Get Infant Status : %u",status.requestRegisteredId);
    
//    [infantManage getArchivedInfantApiWithRequest:req WithHeader:[self getHeader]];
    [infantManage getInfantPositionApiWithRequest:req  WithHeader:[self getHeader]];
    
//    status = [infantManage getInfantsFromOrganizationsApiWithRequest:req WithHeader:[self getHeader]];
//    WiSeLogInfo(@"Delete Infant Status : %u",status.requestRegisteredId);
}

#pragma mark - Edit Infant

- (IBAction)editInfantTapped:(id)sender {
    WiSeCloudInfantRequest * req                  = [WiSeCloudInfantRequest new];

    WiSeCloudInfantDetails * details              = [WiSeCloudInfantDetails new];
    details.infantFirstName                       = @"Alen";
    details.infantLastName                        = @"Av";
    details.infantHosId                           = @"H20";
    details.tagCloudId                            = 2;
    details.infantCloudId                         = 1;

    WiSeCloudZoneRules * zone                     = [WiSeCloudZoneRules new];
    zone.zoneCloudId                              = 2;
    zone.zoneType                                 = 1;
    zone.zoneSafeTime                             = 10;

    WiSeCloudZoneRules * zone1                    = [WiSeCloudZoneRules new];
    zone1.zoneCloudId                             = 1;
    zone1.zoneType                                = 1;
    zone1.zoneSafeTime                            = 10;

    WiSeCloudZoneRules * zone2                    = [WiSeCloudZoneRules new];
    zone2.zoneCloudId                             = 256;
    zone2.zoneType                                = 1;
    zone2.zoneSafeTime                            = 10;


    details.zoneList                              = [NSArray arrayWithObjects:zone,zone1,zone2, nil];
    req.infantList                                = [NSArray arrayWithObject:details];

    WiSeCloudAPIRequestRegisteredDetails * status = [infantManage editInfantApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Edit Infant Status : %u",status.requestRegisteredId);
}

#pragma mark - Delete Infant

- (IBAction)deleteInfantTapped:(id)sender {
    
    WiSeCloudInfantRequest * req                  = [WiSeCloudInfantRequest new];
    req.infantCloudId                             = 2;
    WiSeCloudAPIRequestRegisteredDetails * status = [infantManage deleteInfantApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Delete Infant Status : %u",status.requestRegisteredId);
}

#pragma mark - Infant Tag Association 

- (IBAction)infantTagAssTapped:(id)sender {
    WiSeCloudInfantRequest * req                  = [WiSeCloudInfantRequest new];

    WiSeCloudInfantDetails * details              = [WiSeCloudInfantDetails new];
    details.tagCloudId                            = 1;
    details.infantCloudId                         = 1;

    WiSeCloudInfantDetails * details1             = [WiSeCloudInfantDetails new];
//    details1.tagCloudId = 3;
//    details1.infantCloudId = 1;

    req.infantList                                = [NSArray arrayWithObjects:details,details1, nil];

    WiSeCloudAPIRequestRegisteredDetails * status;// = [infantManage infantTagAssociationApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Infant Tag Association Status : %u",status.requestRegisteredId);
    
    WiSeCloudMapAPIRequest * req1 = [WiSeCloudMapAPIRequest new];
    [mapManager getMapSettingsApiWithRequest:req1 WithHeader:[self getHeader]];
    
}

#pragma mark - Add Rule

- (IBAction)addRuleTapped:(id)sender {
    WiSeCloudInfantRequest * req                  = [WiSeCloudInfantRequest new];

    WiSeCloudInfantDetails * details              = [WiSeCloudInfantDetails new];
    details.tagCloudId                            = 2;
    details.infantCloudId                         = 1;

    WiSeCloudZoneRules * zone                     = [WiSeCloudZoneRules new];
    zone.zoneCloudId                              = 2;
    zone.zoneType                                 = 1;
    zone.zoneSafeTime                             = 10;

    WiSeCloudZoneRules * zone1                    = [WiSeCloudZoneRules new];
    zone1.zoneCloudId                             = 1;
    zone1.zoneType                                = 1;
    zone1.zoneSafeTime                            = 10;

    details.zoneList                              = [NSArray arrayWithObjects:zone,zone1, nil];
    req.infantList                                = [NSArray arrayWithObject:details];

    WiSeCloudAPIRequestRegisteredDetails * status = [infantManage addRuleApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Add Rule Status : %u",status.requestRegisteredId);
}

#pragma mark - Edit Rule

- (IBAction)EditRuleTapped:(id)sender {
    WiSeCloudInfantRequest * req                  = [WiSeCloudInfantRequest new];

    WiSeCloudInfantDetails * details              = [WiSeCloudInfantDetails new];
    details.tagCloudId                            = 2;
    details.infantCloudId                         = 1;

    WiSeCloudZoneRules * zone                     = [WiSeCloudZoneRules new];
    zone.zoneCloudId                              = 2;
    zone.zoneType                                 = 1;
    zone.zoneSafeTime                             = 10;

    WiSeCloudZoneRules * zone1                    = [WiSeCloudZoneRules new];
    zone1.zoneCloudId                             = 1;
    zone1.zoneType                                = 1;
    zone1.zoneSafeTime                            = 10;

    details.zoneList                              = [NSArray arrayWithObjects:zone,zone1, nil];
    req.infantList                                = [NSArray arrayWithObject:details];

    WiSeCloudAPIRequestRegisteredDetails * status = [infantManage editRuleApiWithRequest:req WithHeader:[self getHeader]];
    WiSeLogInfo(@"Edit Rule Status : %u",status.requestRegisteredId);
}

@end
