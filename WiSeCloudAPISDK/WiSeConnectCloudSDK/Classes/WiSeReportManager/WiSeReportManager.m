//
//  WiSeReportManager.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 06/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeReportManager.h"
#import "WiSeAPIDefaultDelegate.h"
#import "WiSeStatusServices.h"
#import "WiSeMiniDashBoardServices.h"

#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

@interface WiSeReportManager ()  <WiSeAPIDefaultDelegate>

@property (nonatomic,strong) WiSeStatusServices * statusServices;
@property (nonatomic,strong) WiSeMiniDashBoardServices * miniDashboardServices;

@end

@implementation WiSeReportManager

#pragma mark - Fire Callbacks

// Fire When Call back fails
- (void) fireCallBackFailWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(reportManagerServiceCallFailedWithError:WithRequestDetails:)]) {
            [self.delegate reportManagerServiceCallFailedWithError:error WithRequestDetails:requestDetails];
        }
    });
}

// Fire When Call back is successful
- (void) fireCallBackSuccessWithResponse:(id)response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(reportManagerServiceCallSuccessfulWithResponse:WithRequestDetails:)]) {
            [self.delegate reportManagerServiceCallSuccessfulWithResponse:response WithRequestDetails:requestDetails];
        }
    });
}

# pragma mark - Default Callbacks

- (void)apiCallIsFailedWithError:(WiSeAppError *)error WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackFailWithError:error withRequestDetails:requestDetails];
}

- (void)apiCallIsSuccessfulWithResponse:(id)response WithRequestDetails:(WiSeCloudAPIRequestDetails *)requestDetails {
    [self fireCallBackSuccessWithResponse:response withRequestDetails:requestDetails];
}


@end
