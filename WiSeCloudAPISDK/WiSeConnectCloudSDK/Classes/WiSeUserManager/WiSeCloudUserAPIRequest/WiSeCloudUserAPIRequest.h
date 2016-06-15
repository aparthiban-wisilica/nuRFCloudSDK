//
//  WiSeCloudUserAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 15/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
#import "WiSeCloudOrganizationInfo.h"
#import "WiSeCloudUserInfo.h"

@interface WiSeCloudUserAPIRequest : WiSeBaseRequest

@property (nonatomic,copy   ) NSString                  * userName;
@property (nonatomic,copy   ) NSString                  * userEmail;
@property (nonatomic,copy   ) NSString                  * userDisplayName;
@property (nonatomic,copy   ) NSString                  * userPassword;
@property (nonatomic,assign ) int                       userType;
@property (nonatomic,assign ) int                       orgId;
@property (nonatomic,assign ) int                       userCloudId;
@property (nonatomic, assign) int                       userStatus;
@property (nonatomic,strong ) NSArray <WiSeCloudOrganizationInfo *> * userOrganizationDetails;

@property (nonatomic,strong ) NSArray <WiSeCloudUserInfo *> * usersList;

@property (nonatomic,assign ) int                       tempId;

// Used In Get
@property (nonatomic,assign ) double                    start;
@property (nonatomic,assign ) int                       limit;

@end
