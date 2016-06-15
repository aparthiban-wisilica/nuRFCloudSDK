//
//  WiSeShutterUpdateAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 21/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>

@interface WiSeShutterUpdateAPIRequest : NSObject

@property (nonatomic,assign) WiSeCloudApiRequestPriority priority;
@property (nonatomic,copy  ) NSString                    * token;
@property (nonatomic,assign) NSInteger                   deviceCloudId;
@property (nonatomic,assign) NSInteger                   remoteId;
@property (nonatomic,copy  ) NSString                    * values;

@end
