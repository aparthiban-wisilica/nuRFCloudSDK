//
//  WiSeFriendRequestAccept_RejectAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"

@interface WiSeFriendRequestAccept_RejectAPIResponse : NSObject

@property (nonatomic,assign) BOOL                    status;
@property (nonatomic,copy  ) NSString                * message;
@property (nonatomic,assign) NSInteger               messageId;
@property (nonatomic,assign) WiSeFriendRequestAction friendRequestAction;
@property (nonatomic,copy  ) NSString                * friendRequestAccept_RejectMessage;
@property (nonatomic,assign) NSInteger               friendRequestAccept_RejectStatus;

@end
