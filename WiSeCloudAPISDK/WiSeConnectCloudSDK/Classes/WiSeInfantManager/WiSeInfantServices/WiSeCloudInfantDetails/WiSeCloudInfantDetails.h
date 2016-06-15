//
//  WiSeCloudInfantDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 15/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudZoneRules;

@interface WiSeCloudInfantDetails : NSObject

@property (nonatomic,assign) int                infantCloudId;
@property (nonatomic,copy  ) NSString           * infantHosId;
@property (nonatomic,assign) int                tagCloudId;
@property (nonatomic,assign) int                tagMeshId;
@property (nonatomic,assign) int                checkOutStatus;
@property (nonatomic,copy  ) NSString           * infantFirstName;
@property (nonatomic,copy  ) NSString           * infantLastName;
@property (nonatomic,copy  ) NSString           * tagName;
@property (nonatomic,strong) NSArray <WiSeCloudZoneRules *> * zoneList;// Array of WiSeCloudZoneRules
@property (nonatomic,assign) int                organizationId;

@property (nonatomic,assign) int                status;
@property (nonatomic,copy  ) NSString           * message;
@property (nonatomic,assign) double             timestamp;

@property (nonatomic,copy  ) NSString           * layerId;

@property (nonatomic,assign) int                tempId;

@end
