//
//  WiSeDeviceGroupAssociationDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 23/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeDeviceGroupAssociationDetails : NSObject

@property (nonatomic,assign) int deviceCloudId;
@property (nonatomic,assign) int oldGroupCloudId;
@property (nonatomic,assign) int freshGroupCloudId;

@end
