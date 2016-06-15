//
//  WiSeFriendRequestAccept_RejectAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>

@interface WiSeFriendRequestAccept_RejectAPIRequest : NSObject

@property (nonatomic,assign) WiSeCloudApiRequestPriority priority;
@property (nonatomic,copy  ) NSString                    * token;
@property (nonatomic,assign) WiSeFriendRequestAction     friendRequestAction;
@property (nonatomic,assign) NSInteger                   messageId;
@property (nonatomic,assign) NSInteger                   friendId;

@end
