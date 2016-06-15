//
//  WiSeCloudUserAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 15/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeCloudUserInfo.h"
@class WiSeCloudOrganizationInfo;
@interface WiSeCloudUserAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign ) int               statusCode;
@property (nonatomic,assign ) int               userCloudId;
@property (nonatomic,assign ) int               status;
@property (nonatomic, copy  ) NSString          * userName;
@property (nonatomic, copy  ) NSString          * userDisplayName;
@property (nonatomic, copy  ) NSString          * message;
@property (nonatomic,strong ) WiSeCloudUserInfo * userInfo;
@property (nonatomic,assign ) int               tempId;

@property (nonatomic,assign ) int               remainingUsers;

// Get Users
@property (nonatomic,strong ) NSArray <WiSeCloudUserInfo *> * usersList;

//@property (nonatomic,strong) NSArray <WiSeCloudOrganizationInfo *> * userOrganizationDetails;

@end
