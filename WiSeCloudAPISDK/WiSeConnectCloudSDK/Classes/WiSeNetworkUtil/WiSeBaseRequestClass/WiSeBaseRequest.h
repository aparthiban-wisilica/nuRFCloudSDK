//
//  WiSeBaseRequestClass.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 28/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>

@interface WiSeBaseRequest : NSObject

@property (nonatomic,assign ) int                         appId;
@property (nonatomic,assign ) WiSeCloudApiRequestPriority priority;
@property (nonatomic,copy   ) NSString                    * token;
@property (nonatomic, assign) int                         phoneCloudId;

@end
