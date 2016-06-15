//
//  WiSeSensorAssociationItems.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import "WiSeSensorLinkIdList.h"

@interface WiSeCloudSensorItems : NSObject

@property (nonatomic,assign) int                          device_GroupCloudId;
@property (nonatomic,assign) int                          sensorCloudId;
@property (nonatomic,assign) int                          sensorMeshId;
@property (nonatomic,strong) NSData                       * triggerData;
@property (nonatomic,assign) WiSeSensorAssociationActions associationAction;
@property (nonatomic,assign) WiSeItemType                 itemType;
@property (nonatomic,assign) int                          sequenceNumber;
@property (nonatomic,strong) NSArray                      * deviceIds;// Used In Group
@property (nonatomic,assign) int                          channel;

// Used in Response

@property (nonatomic,strong) NSString                     * message;
@property (nonatomic,assign) int                          status;
@property (nonatomic,assign) double                       timeStamp;
@property (nonatomic,strong) NSArray <WiSeSensorLinkIdList                         *> * sensorLinkIds;// User In Group and Objects of WiSeSensorLinkIdList;

@end
