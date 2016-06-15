//
//  WiSeCloudZoneRules.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 15/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WiSeZoneListenerMapping;

@interface WiSeCloudZoneRules : NSObject

@property (nonatomic,assign) int      zoneCloudId;
@property (nonatomic,assign) int      zoneType;
@property (nonatomic,assign) int      zoneSafeTime;
@property (nonatomic,assign) int      status;
@property (nonatomic,assign) int      organizationId;
@property (nonatomic,assign) int      timestamp;
@property (nonatomic,assign) int      listenerCloudId;
@property (nonatomic,assign) int      zoneAction;
@property (nonatomic,assign) int      mapStatus;
@property (nonatomic,copy  ) NSString * mapMessage;
@property (nonatomic,copy  ) NSString * zoneName;
@property (nonatomic,copy  ) NSString * message;
@property (nonatomic,retain) NSArray <WiSeZoneListenerMapping *> * zoneListenerMappingList;
@property (nonatomic,strong  ) NSArray <NSString *> * listOfLayerIds;

@property (nonatomic,assign) int      tempId;


@end
