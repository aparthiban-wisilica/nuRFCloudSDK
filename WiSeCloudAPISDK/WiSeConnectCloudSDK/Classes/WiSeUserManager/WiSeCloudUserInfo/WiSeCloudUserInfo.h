//
//  WiSeCloudUserInfo.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WiSeCloudOrganizationInfo;

@interface WiSeCloudUserInfo : NSObject

@property (nonatomic, copy  ) NSString                  *    emailId;
@property (nonatomic, copy  ) NSString                  *    userName;
@property (nonatomic, copy  ) NSString                  *    userDisplayName;
@property (nonatomic, copy  ) NSString                  *    userPassword;
@property (nonatomic, copy  ) NSString                  *    message;
@property (nonatomic, assign) int                       userCloudId;
@property (nonatomic, assign) int                       userType;
@property (nonatomic, assign) int                       tempId;
@property (nonatomic, assign) int                       status;
@property (nonatomic, assign) int                       userStatus;
@property (nonatomic,assign ) double                    timestamp;
@property (nonatomic, strong) NSArray <WiSeCloudOrganizationInfo *> * organizationsList;



@end
