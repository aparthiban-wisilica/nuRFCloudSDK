//
//  WiSeCloudInfantResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
@class WiSeCloudInfantDetails;
@class WiSeInfantInOrganization;
@class WiSeCloudInfantPositionInfo;

@interface WiSeCloudInfantResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int                      statusCode;
@property (nonatomic,strong) NSArray <WiSeCloudInfantDetails   *> * infantList;// Array of WiSeCloudInfantDetails objects
@property (nonatomic,assign) int                      remainingInfants;

// Only used in Get Infants from Organizations

@property (nonatomic,strong) NSArray <WiSeInfantInOrganization *> * infantsListFromOrganizations;


// Only used in Get Infant Position

@property (nonatomic,retain) WiSeCloudInfantPositionInfo * infantPositionInfo;

@end
