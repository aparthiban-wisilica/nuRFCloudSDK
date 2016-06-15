//
//  ViewController.m
//  Demo
//
//  Created by Ashok Parthiban D on 16/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "EditVC.h"
#import "KeychainUserPass.h"
#import "WiSeSignUpApiRequest.h"
#import "WiSeLoginApiRequest.h"
#import "WiSeChangePasswordApiRequest.h"
#import "WiSeForgotPasswordAPIRequest.h"
#import "WiSeNetworkUtil.h"
#import "WiSeUpdateUserProfileAPIRequest.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

#import "WiSeRegisterAppAPIRequest.h"
#import "WiSeRegisterAppInfoAPIResponse.h"
#import "WiSeCheckInterNet.h"
#import <WiSeAppLog/WiSeLogManager.h>
#import "WiSeUpdateDeviceTokenAPIRequest.h"

#import "WiSeAppManager.h"
#import "WiSeAPIHeader.h"
#import "WiSeCloudUserAPIRequest.h"
#import "WiSeListRolesAPIRequest.h"
#import "WiSeCloudListenerAPIRequest.h"
#import "WiSeCloudListenerInfo.h"
#import "UserDetails.h"


@interface ViewController () {
    
    
    WiSeLoginApiResponse * loginApiResponse;
        
    WiSeUserManager * userManager;
    WiSeUserManager * userManager1;
    
    WiSeAppManager * appManager;
    
    int returnSuccess;
    int returnFails;
    
    int app_Id;
    int org_id;
    
    NSData * networkId;
    NSData * netwrokKeyData;
    AppDelegate * mainDelegate;
}

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    mainDelegate             = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    app_Id                   = 2;
    org_id                   = 1;



    NSLog(@"\nFunction: %s\tLine: %d\n",__FILE__,__LINE__);
    //NSLog(@"%@",[WiSeNetworkUtil convertMillisencondsToDate:@"1443009093"]);

    returnSuccess            = 0;
    returnFails              = 0;

    WiSeLogInfo(@"Time Before Checking Internet : %@",[NSDate date]);
//    WiSeLogInfo(@"Network Available : %d",[WiSeNetworkUtil isNetworkAvailable]);
    WiSeLogInfo(@"Time After Checking Internet : %@",[NSDate date]);


    uint8_t netid[2];
    netid[0]                 = 0x45;
    netid[1]                 = 0x47;

    // Network Key
    uint8_t networkKey[16];

    networkKey[0]            = 0x02;
    networkKey[1]            = 0x05;
    networkKey[2]            = 0x8b;
    networkKey[3]            = 0x58;
    networkKey[4]            = 0x38;
    networkKey[5]            = 0x1d;
    networkKey[6]            = 0xe8;
    networkKey[7]            = 0x83;
    networkKey[8]            = 0x9e;
    networkKey[9]            = 0x7a;
    networkKey[10]           = 0x33;
    networkKey[11]           = 0x2f;
    networkKey[12]           = 0x69;
    networkKey[13]           = 0xde;
    networkKey[14]           = 0x8a;
    networkKey[15]           = 0xbb;


    //networkId 7046
    networkId                = [[NSData alloc] initWithBytes:(void *) &netid  length:sizeof(netid)];
    netwrokKeyData           = [[NSData alloc] initWithBytes:(void *) &networkKey length:sizeof(networkKey)];

    mainDelegate.triggerData = netwrokKeyData;
    loginApiResponse = mainDelegate.loginInResponse;


    userManager              = [WiSeUserManager new];
    userManager.delegate     = self;

    userManager1             = [WiSeUserManager new];
    userManager1.delegate    = nil;

    NSString *decodeString   = @"12345678-9abc-def1-2345-6789abcde111";

    NSData *encodeData       = [decodeString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String   = [encodeData base64EncodedStringWithOptions:0];
    WiSeLogInfo(@"Encode String Value: %@", base64String);

    NSData *decodedData      = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
    NSString *decodedString  = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    WiSeLogInfo(@"Decode String Value: %@", decodedString);
    
//    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IMP

- (void) forgotPassword {
    WiSeForgotPasswordAPIRequest * forgotPasswordAPIRequest = [WiSeForgotPasswordAPIRequest new];
    forgotPasswordAPIRequest.userName                       = @"ios";
    forgotPasswordAPIRequest.organizationId                 = org_id;
    forgotPasswordAPIRequest.appId                          = app_Id;
    forgotPasswordAPIRequest.priority                       = 4;

    WiSeCloudAPIRequestRegisteredDetails * status           = [userManager forgotPasswordAPIwithRequest:forgotPasswordAPIRequest];
    WiSeLogInfo(@"Login Stauts : %d",status.requestRegisteredId);
    
}
//
- (void) changePassword {
    WiSeChangePasswordApiRequest * changePasswordApiRequest = [WiSeChangePasswordApiRequest new];
    changePasswordApiRequest.oldPassword                    = @"qwe@123";
    changePasswordApiRequest.changedPassword                = @"qwe@1234";
    changePasswordApiRequest.priority                       = 8;
    changePasswordApiRequest.token                          = loginApiResponse.token;
    changePasswordApiRequest.phoneCloudId                   = loginApiResponse.phoneCloudId;

    //    changePasswordManager = [ChangePasswordAPI new];
    //    changePasswordManager.delegate = self;

    //    WiSeCloudApiRequestStatus status = [changePasswordManager callChangePasswordApiWithRequest:changePasswordApiRequest];
    WiSeCloudAPIRequestRegisteredDetails * status           = [userManager changePasswordAPIwithRequest:changePasswordApiRequest];
    WiSeLogInfo(@"Login Stauts : %d",status.requestRegisteredId);
}
//
- (void)  login {

    WiSeLoginApiRequest *loginApiRequest          = [[WiSeLoginApiRequest alloc] init];

//    loginApiRequest.userName                      = @"ramKumarVarmaaa";
    loginApiRequest.userName                      = @"harry";
    loginApiRequest.password                      = @"qwe@123";
    loginApiRequest.userType = 2;
//    loginApiRequest.userName = @"inorbit";
//    loginApiRequest.password = @"inorbit";
    loginApiRequest.appId                         = 18;
    loginApiRequest.organizationId                = 1;

    loginApiRequest.priority                      = PrioritySix;
    
    WiSeAPIHeader * header = [WiSeAPIHeader new];
    header.organizationId = 1;
    

    WiSeCloudAPIRequestRegisteredDetails * status = [userManager loginApiWithRequest:loginApiRequest WithHeader:header];

    WiSeLogInfo(@"Login Stauts : %d",status.requestRegisteredId);
    
    //    loginApiRequest.userName = @"elbin9";
    //    loginApiRequest.password = @"qwe@123";
    //    loginApiRequest.userName = @"cloudTest";
    //    loginApiRequest.password = @"qwe@123";
    
    //    loginApiRequest.userName = @"selva";
    //    loginApiRequest.password = @"123&@qwe";
    //    loginApiRequest.userName = @"Godwin123";
    //    loginApiRequest.password = @"qwe@123";
    //    loginApiRequest.userName = @"indian";
    //    loginApiRequest.password = @"qwe@123";
    //    loginApiRequest.deviceId = strUDID;
    //    loginApiRequest.registerId = strDeviceToken;
    //    loginApiRequest.osInfo = strDeviceOsVersion;
    //    loginApiRequest.orgId = @"1";
}

#pragma mark - App Manager Delegate

- (void)appManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case SaveAppInfo:
            WiSeLogInfo(@"Save App Info Failed : %@",error);
            break;
        case UpdateSaveAppInfo:
            WiSeLogInfo(@"Update Save App Info Failed : %@",error);
            break;
            
        default:
            break;
    }
}

- (void)appManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case SaveAppInfo:
            WiSeLogInfo(@"Save App Info Success : %@",response);
            [self saveAppInfoFromResponse:response];
        case UpdateSaveAppInfo:
            WiSeLogInfo(@"Update Save App Info Success : %@",response);
            break;
            break;
                default:
            break;
    }
    
}


#pragma mark - User Manager Delegate

- (void)userManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case SaveAppInfo:
            WiSeLogInfo(@"Save App Info Failed : %@",error);
            break;
        case Login:
            WiSeLogInfo(@"Login Failed : %@",error);
            break;
        case SignUp:
            WiSeLogInfo(@"Sign up Failed :%@ \n",error);
            returnFails++;
            WiSeLogInfo(@"Return Fails: %d",returnFails);
            if (returnFails == 20 || returnFails == 39  || returnFails == 58 || returnFails == 77 || returnFails == 96 || returnFails == 115 || returnFails == 134 || returnFails == 153 || returnFails == 172 || returnFails == 190) {
                [self signUp];
                
            }
            
            if (returnFails == 208) {
                returnFails = 0;
                [self signUp];
            }
            
            break;
        case ChangePassword:
            WiSeLogInfo(@"Change Password Failed : %@",error);
            break;
        case ForgotPassword:
            WiSeLogInfo(@"Forgot Password Failed : %@",error);
            break;
        case UpdateUserProfile:
            WiSeLogInfo(@"Update User Profile Failed : %@",error);
            break;

        default:
            break;
    }
}

- (void)userManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    switch (requestDetails.apiId) {
        case SaveAppInfo:
            WiSeLogInfo(@"Save App Info Success : %@",response);
            [self saveAppInfoFromResponse:response];
            break;
        case Login:
            WiSeLogInfo(@"Login Success : %@",response);
            [self saveLoginDetailsWithLoginResponse:response];
            break;
        case SignUp:
            WiSeLogInfo(@"Sign up Success :%@ \n",response);
            returnSuccess++;
            WiSeLogInfo(@"Return Success: %d",returnSuccess);
            if (returnSuccess == 20 || returnSuccess == 39  || returnSuccess == 58 || returnSuccess == 77 || returnSuccess == 96 || returnSuccess == 115 || returnSuccess == 134 || returnSuccess == 153 || returnSuccess == 172 || returnSuccess == 190 ){
                [self signUp];
            }
            
            if (returnSuccess == 208) {
                returnSuccess = 0;
                [self signUp];
            }
            break;
        case ChangePassword:
            WiSeLogInfo(@"Change Password Success : %@",response);
            break;
        case ForgotPassword:
            WiSeLogInfo(@"Forgot password Success : %@",response);
            break;
        case UpdateUserProfile:
            WiSeLogInfo(@"Update User Profile Success : %@",response);
            break;
        default:
            break;
    }

}

- (void) saveLoginDetailsWithLoginResponse : (WiSeLoginApiResponse *) response {
    mainDelegate.loginInResponse = response;
    loginApiResponse = response;
    UserDetails * userDetails = [UserDetails new];
    userDetails.phoneCloudId = response.phoneCloudId;
    userDetails.userToken   = response.token;
    
    [[NSUserDefaults standardUserDefaults] setObject:response.token forKey:@"USER_TOKEN"];
    [[NSUserDefaults standardUserDefaults] setInteger:response.phoneCloudId forKey:@"PHONE_ID"];
}

- (void) saveAppInfoFromResponse : (WiSeRegisterAppInfoAPIResponse *) response{
    mainDelegate.appId = response.appId;
}

- (void) signUp  {
    WiSeCloudUserAPIRequest * signupRequest = [[WiSeCloudUserAPIRequest alloc] init];
    signupRequest.userName        = @"ramKumar1";
    signupRequest.userEmail       = @"ramKumar@123.com";
    signupRequest.userDisplayName = @"Ram Kumar";
    signupRequest.userPassword    = @"qwe@1234";
    signupRequest.userType        = 2;
    
    WiSeCloudOrganizationInfo * info = [WiSeCloudOrganizationInfo new];
    info.organizationId = 4;
    info.permissionId = 10;
    
    signupRequest.userOrganizationDetails = [NSArray arrayWithObject:info];
    
//    signupRequest.orgId           = 1;
//    signupRequest.appId           = app_Id;
    signupRequest.priority        = 7;
    
    WiSeAPIHeader * header = [WiSeAPIHeader new];
    header.organizationId = 1;
    header.phoneCloudId = loginApiResponse.phoneCloudId;
    header.userToken = loginApiResponse.token;
    
    WiSeCloudAPIRequestRegisteredDetails * stauts;
    for (int i = 0; i < 1; i++) {
        stauts = [userManager addUserApiWithRequest:signupRequest WithHeader:header];
        WiSeLogInfo(@"Request RegisteredId : %d \n Request Status : %d \n 888888888888888888888",stauts.requestRegisteredId,stauts.requestStatus);
    }
}

- (void) editUser  {
    WiSeCloudUserAPIRequest * signupRequest = [[WiSeCloudUserAPIRequest alloc] init];
    signupRequest.userName        = @"ramKumar1";
    signupRequest.userEmail       = @"ramKumar1@123.com";
    signupRequest.userDisplayName = @"Ram Kumar1";
    signupRequest.userPassword    = @"qwe@12345";
    signupRequest.userType        = 2;
    signupRequest.userCloudId          = 36; 
    
    WiSeCloudOrganizationInfo * info = [WiSeCloudOrganizationInfo new];
    info.organizationId = 4;
    info.permissionId = 10;
    
    signupRequest.userOrganizationDetails = [NSArray arrayWithObject:info];
    
    //    signupRequest.orgId           = 1;
    //    signupRequest.appId           = app_Id;
    signupRequest.priority        = 7;
    
    WiSeAPIHeader * header = [WiSeAPIHeader new];
    header.organizationId = 1;
    header.phoneCloudId = loginApiResponse.phoneCloudId;
    header.userToken = loginApiResponse.token;
    
    WiSeCloudAPIRequestRegisteredDetails * stauts;
    for (int i = 0; i < 1; i++) {
        stauts = [userManager editUserApiWithRequest:signupRequest WithHeader:header];
        WiSeLogInfo(@"Request RegisteredId : %d \n Request Status : %d \n 888888888888888888888",stauts.requestRegisteredId,stauts.requestStatus);
    }
}

- (void) listRoles {
    WiSeListRolesAPIRequest * req = [WiSeListRolesAPIRequest new];
    
    WiSeAPIHeader * header = [WiSeAPIHeader new];
    header.organizationId = 1;
    header.phoneCloudId = loginApiResponse.phoneCloudId;
    header.userToken = loginApiResponse.token;
    
    [userManager listRolesApiWithRequest:req WithHeader:header];
}


- (void) listUsers {
    WiSeCloudUserAPIRequest * req = [WiSeCloudUserAPIRequest new];
    req.start = 1;
    req.limit = 200;
    req.userCloudId = 1;
    req.userStatus = 0;
    
    WiSeAPIHeader * header = [WiSeAPIHeader new];
    header.organizationId = 1;
    header.phoneCloudId = loginApiResponse.phoneCloudId;
    header.userToken = loginApiResponse.token;
    
    
    
    [userManager getUserApiWithRequest:req WithHeader:header];
}



#pragma mark - IBAction Method
- (IBAction)getListenersPressed:(id)sender {
    WiSeCloudListenerAPIRequest * req = [WiSeCloudListenerAPIRequest new];
    req.start = 1;
    req.limit = 300;
    WiSeAPIHeader * header = [WiSeAPIHeader new];
    header.organizationId = 1;
    header.phoneCloudId = loginApiResponse.phoneCloudId;
    header.userToken = loginApiResponse.token;
}

- (IBAction)editListenersPressed:(id)sender {
    
}

- (IBAction)addUserPressed:(id)sender {
    
    for (int i = 0; i < 30; i++) {
        WiSeCloudUserAPIRequest * signupRequest = [[WiSeCloudUserAPIRequest alloc] init];
        signupRequest.userName        = [NSString stringWithFormat:@"testUser%d",i+1];
        signupRequest.userEmail       = @"userTest@123.com";
        signupRequest.userDisplayName = @"User Test";
        signupRequest.userPassword    = @"qwe@123";
        signupRequest.userType        = 2;
        
        WiSeCloudOrganizationInfo * info = [WiSeCloudOrganizationInfo new];
        info.organizationId = 43;
        info.permissionId = 1;
        
        signupRequest.userOrganizationDetails = [NSArray arrayWithObject:info];
        
        //    signupRequest.orgId           = 1;
        //    signupRequest.appId           = app_Id;
        signupRequest.priority        = 7;
        
        WiSeAPIHeader * header = [WiSeAPIHeader new];
        header.organizationId = 1;
        header.phoneCloudId = loginApiResponse.phoneCloudId;
        header.userToken = loginApiResponse.token;
        
        WiSeCloudAPIRequestRegisteredDetails * stauts;
        stauts = [userManager addUserApiWithRequest:signupRequest WithHeader:header];
        WiSeLogInfo(@"Request RegisteredId : %d \n Request Status : %d \n 888888888888888888888",stauts.requestRegisteredId,stauts.requestStatus);

    }
    
//    WiSeCloudUserAPIRequest * signupRequest = [[WiSeCloudUserAPIRequest alloc] init];
//    signupRequest.userName        = @"arvind";
//    signupRequest.userEmail       = @"arvind@123.com";
//    signupRequest.userDisplayName = @"Arvind";
//    signupRequest.userPassword    = @"qwe@1234";
//    signupRequest.userType        = 2;
//    
//    WiSeCloudOrganizationInfo * info = [WiSeCloudOrganizationInfo new];
//    info.organizationId = 43;
//    info.permissionId = 1;
//    
//    signupRequest.userOrganizationDetails = [NSArray arrayWithObject:info];
//    
//    //    signupRequest.orgId           = 1;
//    //    signupRequest.appId           = app_Id;
//    signupRequest.priority        = 7;
//    
//    WiSeAPIHeader * header = [WiSeAPIHeader new];
//    header.organizationId = 1;
//    header.phoneCloudId = loginApiResponse.phoneCloudId;
//    header.userToken = loginApiResponse.token;
//    
//    WiSeCloudAPIRequestRegisteredDetails * stauts;
//    for (int i = 0; i < 1; i++) {
//        stauts = [userManager addUserApiWithRequest:signupRequest WithHeader:header];
//        WiSeLogInfo(@"Request RegisteredId : %d \n Request Status : %d \n 888888888888888888888",stauts.requestRegisteredId,stauts.requestStatus);
//    }

}

- (IBAction)editUserPressed:(id)sender {
    
    WiSeCloudUserAPIRequest * signupRequest = [[WiSeCloudUserAPIRequest alloc] init];
    signupRequest.userName        = @"ramKumar1";
    signupRequest.userEmail       = @"ramKumar1@123.com";
    signupRequest.userDisplayName = @"Ram Kumar1";
    signupRequest.userPassword    = @"qwe@12345";
    signupRequest.userType        = 2;
    signupRequest.userCloudId          = 36;
    
    WiSeCloudOrganizationInfo * info = [WiSeCloudOrganizationInfo new];
    info.organizationId = 4;
    info.permissionId = 10;
    
    signupRequest.userOrganizationDetails = [NSArray arrayWithObject:info];
    
    //    signupRequest.orgId           = 1;
    //    signupRequest.appId           = app_Id;
    signupRequest.priority        = 7;
    
    WiSeAPIHeader * header = [WiSeAPIHeader new];
    header.organizationId = 1;
    header.phoneCloudId = loginApiResponse.phoneCloudId;
    header.userToken = loginApiResponse.token;
    
    WiSeCloudAPIRequestRegisteredDetails * stauts;
    for (int i = 0; i < 1; i++) {
        stauts = [userManager editUserApiWithRequest:signupRequest WithHeader:header];
        WiSeLogInfo(@"Request RegisteredId : %d \n Request Status : %d \n 888888888888888888888",stauts.requestRegisteredId,stauts.requestStatus);
    }

}

- (IBAction)getUserPressed:(id)sender {
    [self listUsers];
}

- (IBAction)deleteUserPressed:(id)sender {
    WiSeCloudUserAPIRequest * req = [WiSeCloudUserAPIRequest new];
    req.userCloudId = 10;
    
    WiSeAPIHeader * header = [WiSeAPIHeader new];
    header.organizationId = 1;
    header.phoneCloudId = loginApiResponse.phoneCloudId;
    header.userToken = loginApiResponse.token;
    
    [userManager deleteOrDisableUserApiWithRequest:req WithHeader:header];
}

- (IBAction)btnSaveAppInfo:(id)sender {
    AppDelegate * mainDelegate1     = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSString *strUDID               = [KeychainUserPass load:@"phoneUDID"];
    NSString * strDeviceToken       = mainDelegate1.m_appDeviceToken;
    NSString * strDeviceOsVersion   = [NSString stringWithFormat:@"ios %@",[[UIDevice currentDevice] systemVersion]];

    strDeviceToken                  = strDeviceToken ==nil? @"unsupported on this platform":strDeviceToken;
    strUDID                         = strUDID==nil?@"":strUDID;

    WiSeRegisterAppAPIRequest * request = [WiSeRegisterAppAPIRequest new];
    request.deviceId                = strUDID;
    request.deviceToken             = strDeviceToken;
    request.osInfo                  = strDeviceOsVersion;
    request.appVersion              = @"1.0";
    request.modelInfo               = @"IPhone 6";
    request.organizationId          = 1;
    
    WiSeAPIHeader * header = [WiSeAPIHeader new];
    header.organizationId = 1;

    appManager = [WiSeAppManager new];
    appManager.delegate = self;
    
    WiSeCloudAPIRequestRegisteredDetails * status =
    [appManager registerAppAPIWithRequest:request WithHeader:header];
    WiSeLogInfo(@"Register App Status : %d",status.requestRegisteredId);
}

- (IBAction)btnUpdateSaveAppInfo:(id)sender {
    AppDelegate * mainDelegate1     = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    NSString * strDeviceToken       = mainDelegate1.m_appDeviceToken;
    WiSeRegisterAppAPIRequest * request = [WiSeRegisterAppAPIRequest new];
    request.organizationId          = 5;
    request.appId                   = app_Id;
    request.deviceToken             = strDeviceToken;
    
    appManager = [WiSeAppManager new];
    appManager.delegate = self;
    
    WiSeCloudAPIRequestRegisteredDetails * status =
    [appManager updateRegisterAppAPIWithRequest:request];
    WiSeLogInfo(@"Update Register App Status : %d",status.requestRegisteredId);

}

- (IBAction)btnLoginTapped:(id)sender {
    [self login];
}
//
- (IBAction)btnFogotPasswordTapped:(id)sender {
    //[self forgotPassword];
    
}
//
- (IBAction)btnSignUpTapped:(id)sender {
    [self signUp];
}
//
- (IBAction)btnChangePasswordTapped:(id)sender {
//    [self changePassword];
    [self listUsers];
}

- (IBAction)btnEditPressed:(id)sender {
    
//    AppDelegate * mainDelegate1               = (AppDelegate *) [[UIApplication sharedApplication] delegate];
//    WiSeLoginApiResponse * loginResponse      = mainDelegate1.loginInResponse;
//
//    WiSeUpdateDeviceTokenAPIRequest * request = [WiSeUpdateDeviceTokenAPIRequest new];
//    request.token                             = loginResponse.token;
//    request.phoneCloudId                      = loginResponse.phoneCloudId;
//    request.organizationId                    = 1;
//    request.deviceToken                       = @"aldsfj;dklfdsldfjas;dkljfadlsfjk";
//    request.appId = mainDelegate1.appId;
//
//    userManager.delegate                      = self;
//    WiSeCloudAPIRequestRegisteredDetails * status =
//    [userManager updateDeviceTokenApiWithRequest:request];
//    WiSeLogInfo(@"Update Device Token Status : %d",status.requestRegisteredId);
    
    [self listRoles];
}



@end
