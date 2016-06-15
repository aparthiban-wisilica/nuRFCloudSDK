//
//  WiSeMiniDashBoardServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 06/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeMiniDashBoardServices.h"
#import "WiSeMiniDashBoardServicesRequestParser.h"
#import "WiSeMiniDashBoardServicesResponseParser.h"
#import "WiSeMiniDashBoardServicesResponseValidator.h"

#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import "WiSeAPIHeader.h"
#import "WiSeCloudAPIURLInfo.h"
#import "WiSeCloudMiniDashBoardRequest.h"


@interface WiSeMiniDashBoardServices () <WiSeCloudApiRequestDelegate>


@end

@implementation WiSeMiniDashBoardServices {
    WiSeNetworkManager * wiseNetworkManager;
}

# pragma mark --- Trigger Call back ---

- (void) triggerSuccessCallBack : (id) response withRequestDetails : (WiSeCloudAPIRequestDetails *)requestInfo{
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiCallIsSuccessfulWithResponse:WithRequestDetails:)]) {
        [self.delegate apiCallIsSuccessfulWithResponse:response WithRequestDetails:requestInfo];
    }
}

- (void) triggerFailCallBack : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *)requestInfo{
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiCallIsFailedWithError:WithRequestDetails:)]) {
        [self.delegate apiCallIsFailedWithError:error WithRequestDetails:requestInfo];
    }
}

- (WiSeCloudAPIRequestRegisteredDetails *) getUserDashboardApiWithRequest : (WiSeCloudMiniDashBoardRequest *) request WithHeader : (WiSeAPIHeader *) header {
    return nil;
}

- (WiSeCloudAPIRequestRegisteredDetails *) getHardwareDashboardApiWithRequest : (WiSeCloudMiniDashBoardRequest *) request WithHeader : (WiSeAPIHeader *) header {
    return nil;
}

- (WiSeCloudAPIRequestRegisteredDetails *) getAssetsDashboardApiWithRequest : (WiSeCloudMiniDashBoardRequest *) request WithHeader : (WiSeAPIHeader *) header {
    return nil;
}

#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        default:
            break;
    }
}

@end
