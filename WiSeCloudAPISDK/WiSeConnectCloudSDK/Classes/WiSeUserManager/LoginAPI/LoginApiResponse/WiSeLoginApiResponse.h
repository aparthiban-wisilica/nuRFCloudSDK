//
//  LoginApiResponse.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 23/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"
#import "WiSeCloudOrganizationInfo.h"

@interface WiSeLoginApiResponse : WiSeCloudApiResponse

@property (nonatomic, assign) BOOL                isBridge;
@property (nonatomic, assign) int                 messageId;
@property (nonatomic, assign) int                 phoneCloudId;
@property (nonatomic, assign) int                 phoneMeshId;
@property (nonatomic, copy  ) NSString            *    token;
@property (nonatomic, copy  ) NSString            *    emailId;
@property (nonatomic, copy  ) NSString            *    userName;
@property (nonatomic, copy  ) NSString            *    userDisplayName;
@property (nonatomic, assign) int                 userCloudId;
@property (nonatomic, retain) NSData              *    userNetworkID;
@property (nonatomic, retain) NSData              *    userNetworkKey;
@property (nonatomic, assign) int                 userDefaultGroupCloudId;
@property (nonatomic,assign ) LoginSuccesAndError statusCode;
@property (nonatomic, assign) double              operationMessageTimestamp;
@property (nonatomic, assign) double              otherMessageTimestamp;
@property (nonatomic, assign) int                 userType;
@property (nonatomic, copy  ) NSString            * customerKey;
@property (nonatomic, strong) NSArray <WiSeCloudOrganizationInfo *> * organizationsList;

@end
