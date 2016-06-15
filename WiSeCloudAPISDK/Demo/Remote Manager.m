    //
//  Remote Manager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "Remote Manager.h"
#import "AppDelegate.h"
#import "WiSeLogoutAPIRequest.h"
#import "WiSeMessageFetchAPIRequest.h"
#import "WiSeUpdateRemoteOperationStatusAPIRequest.h"
#import "WiSeNotificationStatusUpdateAPIRequest.h"
#import "WiSeMessageStatusUpdateAPIRequest.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import "WiSeRequestForRemoteOperationAPIRequest.h"
#import "WiSeResetMessageQueueAPIRequest.h"
#import "WiSeGetMessageHistoryAPIRequest.h"
#import "WiSeUpdateRemoteOperationFeedbackAPIRequest.h"
#import <WiSeAppLog/WiSeLogManager.h>
#import "WiSeOperationServices.h"
#import "WiSeDirectRemoteOperationDetails.h"
#import "WiSeUpdateDirectOperationStatusAPIRequest.h"
#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import "WiSeAPIHeader.h"
#import "WiSeCloudTrackingAlertAPIRequest.h"


@implementation Remote_Manager {
    
    WiSeUserManager * userManager;
    
    WiSeOperationManager * operationManager;
    
    WiSeMessageManager * messageManager;
    
    NSString * strToken;
    int phoneCloudId;
    
    uint8_t prefix[4];
    NSData * prefixData;
}

- (void)viewDidLoad  {
    [super viewDidLoad];

    userManager                          = [WiSeUserManager new];

    operationManager                     = [WiSeOperationManager new];

    messageManager                       = [WiSeMessageManager new];
    messageManager.delegate              = self;

    AppDelegate * mainDelegate           = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;
    strToken                             = loginResponse.token;
    phoneCloudId                         = loginResponse.phoneCloudId;
    
    
    prefix[0] = 0x01;
    prefix[1] = 0x02;
    prefix[2] = 0x03;
    prefix[3] = 0x04;
    prefixData = [[NSData alloc] initWithBytes:(void *) &prefix  length:sizeof(prefix)];

}

# pragma mark - Message Callbacks

- (void)messageManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeAPICall apiName = requestDetails.apiId;
    switch (apiName) {
        case OtherMessagesFetch:
            WiSeLogInfo(@"MessageFetch Failed : %@", error);
            break;
        
        default:
            break;
    }
}

- (void)messageManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeAPICall apiName = requestDetails.apiId;
    switch (apiName) {
        case OtherMessagesFetch:
            WiSeLogInfo(@"MessageFetch Success : %@", response);
            break;
        
        default:
            break;
    }
}

# pragma mark - Operation Callbacks

- (void)operationManagerServiceCallFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeAPICall apiName = requestDetails.apiId;
    switch (apiName) {
        case RequestForRemoteOperation:
            WiSeLogInfo(@"RequestForRemoteOperation Failed : %@", error);
            break;
        case UpdateDirectOperationStatus:
            WiSeLogInfo(@"UpdateDirectOperationStatus Failed : %@", error);
            break;
        default:
            break;
    }

}

- (void)operationManagerServiceCallSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeAPICall apiName = requestDetails.apiId;
    switch (apiName) {
        case RequestForRemoteOperation:
            WiSeLogInfo(@"RequestForRemoteOperation Success : %@", response);
            break;
        case UpdateDirectOperationStatus:
            WiSeLogInfo(@"UpdateDirectOperationStatus Success : %@", response);
            break;
        default:
            break;
    }

}


- (void)remoteOperationMangerAPICallFailedWithError:(WiSeAppError *)error withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeAPICall apiName = requestDetails.apiId;
    switch (apiName) {
        case UpdateRemoteOperationStatus:
            WiSeLogInfo(@"Update Remote Operation Status Failed : %@", error);
            break;
        case OtherMessagesFetch:
            WiSeLogInfo(@"Message Fetch Failed : %@", error);
            break;
        case NotificationStatusUpdate:
            WiSeLogInfo(@"Notification Status Update Failed : %@", error);
            break;
        case MessageStatusUpdate:
            WiSeLogInfo(@"Message Status Update Failed : %@", error);
            break;
        default:
            break;
    }
}

- (void)remoteOperationMangerAPICallSuccessWithResponse:(id)response withRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    WiSeAPICall apiName = requestDetails.apiId;
    switch (apiName) {
        case UpdateRemoteOperationStatus:
            WiSeLogInfo(@"Update Remote Operation Status Success : %@",response);
            break;
        case OtherMessagesFetch:
            WiSeLogInfo(@"Message Fetch Success : %@", response);
            break;
        case NotificationStatusUpdate:
            WiSeLogInfo(@"Notification Status Update Success : %@", response);
            break;
        case MessageStatusUpdate:
            WiSeLogInfo(@"Message Status Update Success : %@", response);
            break;
        default:
            break;
    }
}


#pragma mark - Request For Remote Operation Status 

- (IBAction)btnRequestForRemoteOperationTapped:(id)sender {
    WiSeRequestForRemoteOperationAPIRequest * request = [WiSeRequestForRemoteOperationAPIRequest new];
    request.requestInfo                               = [WiSeDirectRemoteOperationDetails new];
    request.requestInfo.device_groupCloudId           = 9;
    request.token                                     = strToken;
    request.requestInfo.itemType                      = WiseSubItem;
    request.phoneCloudId                              = phoneCloudId;
    request.requestInfo.operationId                   = 1;
    request.requestInfo.coolValue                     = 10;
    request.requestInfo.intensity                     = 15;

    operationManager.delegate                         = self;
    WiSeCloudAPIRequestRegisteredDetails * status     = [operationManager requestForRemoteOperationApiWithRequest:request];
    WiSeLogInfo(@"Request For Remote Operation Status : %d",status.requestRegisteredId);
}

#pragma mark - Update Direct Operation Status

- (IBAction)btnUpdateStatusTapped:(id)sender {
        
    AppDelegate * mainDelegate                                                            = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse                                                  = mainDelegate.loginInResponse;
    
    WiSeUpdateDirectOperationStatusAPIRequest * wiSeUpdateDirectOperationStatusAPIRequest = [WiSeUpdateDirectOperationStatusAPIRequest new];
    
    WiSeDirectRemoteOperationDetails * details         = [WiSeDirectRemoteOperationDetails new];
    details.device_groupCloudId                        = 83;
    details.operationId                                = 1;
    details.sequenceNumber                             = 11;
    details.intensity                                  = 20;
    details.phoneOperationId                           = 45;
    details.itemType                                   = WiseSubItem;
    details.timeStamp                                  = 1234422225.0000;
    
    WiSeDirectRemoteOperationDetails * details1         = [WiSeDirectRemoteOperationDetails new];
    details1.device_groupCloudId                        = 13;
    details1.operationId                                = 1;
    details1.sequenceNumber                             = 16;
    details1.intensity                                  = 20;
    details1.phoneOperationId                           = 45;
    details1.itemType                                   = WiseItem;
    details1.timeStamp                                  = [NSDate timeIntervalSinceReferenceDate];

    wiSeUpdateDirectOperationStatusAPIRequest.token    = loginResponse.token;
    wiSeUpdateDirectOperationStatusAPIRequest.phoneCloudId                               = loginResponse.phoneCloudId;
    wiSeUpdateDirectOperationStatusAPIRequest.wiseUpdateDirectOperationStatusDetailsList = [NSArray arrayWithObjects:details1,nil];
    
    operationManager.delegate                         = self;
    
    WiSeCloudAPIRequestRegisteredDetails * status = [operationManager updateDirectOperationStautsApiWithRequest:wiSeUpdateDirectOperationStatusAPIRequest];
    
    WiSeLogInfo(@"WiSeUpdateDirectOperationStatusAPIRequest Status : %d",status.requestRegisteredId);
    WiSeLogInfo(@"****************************************************************************************************** Background Thread");
}


# pragma mark - Update Remote Operation Status

- (IBAction)updateRemoteOperationTapped:(id)sender {
    
    WiSeUpdateRemoteOperationFeedbackAPIRequest * request = [WiSeUpdateRemoteOperationFeedbackAPIRequest new];
    request.token                                         = strToken;
    request.phoneCloudId                                  = phoneCloudId;

    WiSeDirectRemoteOperationDetails * details            = [WiSeDirectRemoteOperationDetails new];
    details.device_groupMeshId                            = 9;
    details.encData                                       = [WiSeNetworkUtil convertDataToBase64StringWithData:prefixData];

    request.wiseUpdateRemoteOperationFeedbackRequestDetailsList = [NSArray arrayWithObjects:details, nil];
    operationManager.delegate                       = self;
    WiSeCloudAPIRequestRegisteredDetails * status         = [operationManager updateRemoteOperationFeedbackApiWithRequest:request];
    WiSeLogInfo(@"Update Remote Operation Status : %d",status.requestRegisteredId);
    
}

#pragma mark - Logout

- (IBAction)btnLogoutTapped:(id)sender {
    
    WiSeLogoutAPIRequest * request                = [WiSeLogoutAPIRequest new];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneCloudId;

    userManager.delegate                          = self;
    WiSeCloudAPIRequestRegisteredDetails * status = [userManager logoutApiWithRequest:request];
    WiSeLogInfo(@"Logout : %d",status.requestRegisteredId);

}

#pragma mark - Message Fetch

- (IBAction)fetchMessageTapped:(id)sender {
    
    WiSeMessageFetchAPIRequest * request = [WiSeMessageFetchAPIRequest new];
    request.token = strToken;
    request.messageId = 1;
    request.start = [NSDate timeIntervalSinceReferenceDate];
    request.limit = 10;
    request.phoneCloudId = phoneCloudId;
    request.messageType = OtherMessages;
    
//    WiSeCloudAPIRequestRegisteredDetails * status = [messageManager messageFetchApiWithRequest:request];
//    WiSeLogInfo(@"Message Fetch API Status: %d",status.requestRegisteredId);
    
    WiSeCloudTrackingAlertAPIRequest * req = [WiSeCloudTrackingAlertAPIRequest new];
    req.start = 1;
    req.limit = 200;
    req.infantCloudId = 1;
    req.alertType = 0;
    
    
    [messageManager getTrackingAlertsApiWithRequest:req WithHeader:[self getHeader]];
}

- (WiSeAPIHeader *) getHeader {
    AppDelegate * mainDelegate           = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WiSeLoginApiResponse * loginResponse = mainDelegate.loginInResponse;
    WiSeAPIHeader * header               = [WiSeAPIHeader new];
    header.userToken                     = loginResponse.token;
    header.phoneCloudId                  = loginResponse.phoneCloudId;
    header.organizationId                = 1;
    header.subOrganizationId             = 2;
    return header;
}

- (IBAction)fetchMessageTapped1:(id)sender {
    
    WiSeMessageFetchAPIRequest * request          = [WiSeMessageFetchAPIRequest new];
    request.token                                 = strToken;
    request.messageId                             = 1;
    request.start                                 = [NSDate timeIntervalSinceReferenceDate];;
    request.limit                                 = 10;
    request.phoneCloudId                          = phoneCloudId;
    request.messageType                           = OperationMessages;

    WiSeCloudAPIRequestRegisteredDetails * status = [messageManager messageFetchApiWithRequest:request];
    WiSeLogInfo(@"Message Fetch API Status: %d",status.requestRegisteredId);
}

#pragma mark - Notification Status Update 

- (IBAction)btnNotificationStatusUpdate:(id)sender {
    
    WiSeNotificationStatusUpdateAPIRequest * request = [WiSeNotificationStatusUpdateAPIRequest new];
    request.notificationIds = @[@10,@20,@30];
    
    [messageManager notificationUpdateApiWithRequest:request WithHeader:nil];
}

#pragma mark - Message Status Update 

- (IBAction)btnMessageStatusUpdate:(id)sender {
    
    WiSeMessageStatusUpdateAPIRequest * request   = [WiSeMessageStatusUpdateAPIRequest new];
    request.messageIds                            = [NSArray arrayWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:20],[NSNumber numberWithInt:30], nil];
    request.token                                 = strToken;
    request.phoneCloudId                          = phoneCloudId;
    request.messageType                           = OperationMessages;

    messageManager.delegate                       = self;
    WiSeCloudAPIRequestRegisteredDetails * status = [messageManager messageStatusUpdateApiWithRequest:request];
    WiSeLogInfo(@"Message Status Update API Status: %d",status.requestRegisteredId);
    
}

#pragma mark - Reset Message Queue

- (IBAction)btnResetMessageQueue:(id)sender {
    WiSeResetMessageQueueAPIRequest * request = [WiSeResetMessageQueueAPIRequest new];
    request.token                             = strToken;
    request.phoneCloudId                      = phoneCloudId;
}

#pragma mark - Get Message History 

- (IBAction)btnGetMessageHistory:(id)sender {
    WiSeGetMessageHistoryAPIRequest * request = [WiSeGetMessageHistoryAPIRequest new];
    request.token                             = strToken;
    request.phoneCloudId                      = phoneCloudId;
    request.start                             = 1;
    request.limit                             = 10;
    request.messageType                       = OperationMessages;
}

@end
