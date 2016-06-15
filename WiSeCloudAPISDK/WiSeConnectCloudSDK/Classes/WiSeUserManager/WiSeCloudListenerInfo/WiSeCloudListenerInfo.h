//
//  WiSeCloudListenerInfo.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 20/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeDashBoardSubItems.h"
#import "WiSeCloudZoneRules.h"

@interface WiSeCloudListenerInfo : WiSeDashBoardSubItems

@property (nonatomic,assign    ) double             latitude;
@property (nonatomic,assign    ) double             longtitude;
@property (nonatomic,assign    ) double             timestamp;
@property (nonatomic,assign    ) int                miniRSSI;
@property (nonatomic,copy      ) NSString           * listenerName;
@property (nonatomic,assign    ) int                organizationId;
@property (nonatomic,assign    ) int                groupCloudId;
@property (nonatomic,assign    ) int                status;
@property (nonatomic,copy      ) NSString           * message;
@property (nonatomic,assign    ) int                mapStatus;
@property (nonatomic,copy      ) NSString           * mapMessage;
@property (nonatomic,copy      ) NSString           * deviceSecurityKey;
@property (nonatomic,copy      ) NSString           * devicePairingKey;
@property (nonatomic,assign    ) int                ownerShipChangeStatus;
@property (nonatomic,strong    ) NSArray <WiSeCloudZoneRules *> * zoneList;// Array of WiSeCloudZoneRules
@property (nonatomic,assign    ) int                remainingZones;
@property (nonatomic,copy      ) NSString           * layerId;

@property (nonatomic,assign    ) int                tempId;

@end
