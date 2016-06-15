//
//  WiSeZoneListenerMapping.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeZoneListenerMapping : NSObject

@property (nonatomic,assign) int      zoneCloudId;
@property (nonatomic,assign) int      mappingAction;
@property (nonatomic,assign) int      listenerCloudId;
@property (nonatomic,assign) int      status;
@property (nonatomic,copy  ) NSString * message;

@property (nonatomic,assign) int      tempId;

@end
