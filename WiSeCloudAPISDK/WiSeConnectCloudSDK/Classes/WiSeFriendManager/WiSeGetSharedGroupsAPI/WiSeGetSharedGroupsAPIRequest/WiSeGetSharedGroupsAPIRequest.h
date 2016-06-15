//
//  WiSeGetSharedGroupsAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>

@interface WiSeGetSharedGroupsAPIRequest : NSObject

@property (nonatomic,assign) WiSeCloudApiRequestPriority priority;
@property (nonatomic,copy  ) NSString                    * token;

@end
