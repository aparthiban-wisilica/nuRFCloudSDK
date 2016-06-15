//
//  WiSeGetSharedGroupsAPI.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>
#import <WiSeNetworkManager/WiSeAppError.h>

@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeGetSharedGroupsAPIRequest;
@class WiSeGetSharedGroupsAPIResponse;

@protocol WiSeGetSharedGroupsAPIDelegate <NSObject>

- (void) getSharedGroupsSuccessWithResponse : (WiSeGetSharedGroupsAPIResponse *) response withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;
- (void) getSharedGroupsFailedWithError : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *) requestDetails;

@end

@interface WiSeGetSharedGroupsAPI : NSObject <WiSeCloudApiRequestDelegate>

@property (nonatomic,weak) id <WiSeGetSharedGroupsAPIDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) callGetSharedGroupsApiWithRequest : (WiSeGetSharedGroupsAPIRequest *) request ;


@end
