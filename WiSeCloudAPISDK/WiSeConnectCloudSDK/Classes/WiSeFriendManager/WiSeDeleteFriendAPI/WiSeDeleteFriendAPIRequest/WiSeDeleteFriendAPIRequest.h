//
//  WiSeDeleteFriendAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>

@interface WiSeDeleteFriendAPIRequest : NSObject

@property (nonatomic,assign) WiSeCloudApiRequestPriority priority;
@property (nonatomic,copy  ) NSString                    * token;
@property (nonatomic,assign) NSInteger                   friendId;

@end
