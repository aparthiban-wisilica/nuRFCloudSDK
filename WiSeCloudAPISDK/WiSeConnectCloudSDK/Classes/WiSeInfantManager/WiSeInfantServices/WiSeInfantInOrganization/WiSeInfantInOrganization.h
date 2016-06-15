//
//  WiSeInfantInOrganization.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WiSeCloudInfantDetails;

@interface WiSeInfantInOrganization : NSObject

@property (nonatomic,assign) int                remainingListeners;
@property (nonatomic,assign) int                organizationId;
@property (nonatomic,strong) NSArray <WiSeCloudInfantDetails *> * infantsList;// Array of WiSeCloudInfantDetails objects

@end
