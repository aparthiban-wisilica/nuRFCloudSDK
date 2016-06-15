//
//  WiSeSensorAssociationDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 10/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"

@interface WiSeSensorAssociationDetails : NSObject

@property (nonatomic,assign) WiSeItemType                 wiseItemType;
@property (nonatomic,assign) NSInteger                    itemCloudId;
@property (nonatomic,assign) NSInteger                    subItemCloudId;
@property (nonatomic,assign) NSInteger                    sensorId;
@property (nonatomic,assign) WiSeSensorAssociationActions action;
@property (nonatomic,strong) NSString                     * message;
@property (nonatomic,assign) BOOL                         status;


@end
