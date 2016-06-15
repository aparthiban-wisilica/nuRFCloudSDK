//
//  WiSeCloudInfantRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"
#import "WiSeCloudInfantDetails.h"

@interface WiSeCloudInfantRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray <WiSeCloudInfantDetails *> * infantList; // Array of WiSeCloudInfantDetails

// Used In Get
@property (nonatomic,assign) double   start;
@property (nonatomic,assign) int      limit;
@property (nonatomic,assign) int      checkoutStatus;
@property (nonatomic,assign) int      tagAssignStatus;
@property (nonatomic,assign) int      dischargeStatus;


// Used In Single Infant Delete
@property (nonatomic,assign) int      infantCloudId;

// Used In Get Infants from Organization
@property (nonatomic,retain) NSArray <NSNumber *> * organizationList;

@end
