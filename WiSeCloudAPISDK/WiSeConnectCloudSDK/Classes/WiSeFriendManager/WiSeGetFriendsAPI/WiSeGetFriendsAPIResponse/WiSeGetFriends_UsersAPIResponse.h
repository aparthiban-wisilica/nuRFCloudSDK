//
//  WiSeGetFriendsAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"

@interface WiSeGetFriends_UsersAPIResponse : NSObject

@property (nonatomic,assign) BOOL        status;
@property (nonatomic,copy  ) NSString    * message;
@property (nonatomic,strong) NSArray     * friendsDetailsList;
@property (nonatomic,assign) WiSeGetList listType;

@end
