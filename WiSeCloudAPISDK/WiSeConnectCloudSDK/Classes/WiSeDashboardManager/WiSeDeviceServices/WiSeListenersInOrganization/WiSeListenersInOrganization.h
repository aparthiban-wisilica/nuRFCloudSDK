//
//  WiSeListenersInOrganization.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WiSeCloudListenerInfo;

@interface WiSeListenersInOrganization : NSObject

@property (nonatomic,assign) int                remainingListeners;
@property (nonatomic,assign) int                organizationId;
@property (nonatomic,strong) NSArray <WiSeCloudListenerInfo *> * listenersList;// Array of WiSeCloudListenerInfo objects

@end
