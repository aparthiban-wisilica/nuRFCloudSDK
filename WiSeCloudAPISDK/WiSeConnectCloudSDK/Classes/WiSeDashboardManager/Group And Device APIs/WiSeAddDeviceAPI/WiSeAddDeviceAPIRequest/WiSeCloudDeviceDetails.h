//
//  WiSeAddEditDeviceRequestDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 02/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeDashBoardSubItems.h"
#import "WiSeDeviceGroupAssociationDetails.h"

@interface WiSeCloudDeviceDetails : WiSeDashBoardSubItems

@property (nonatomic,assign) int                               groupCloudId;
@property (nonatomic,assign) double                            timeStamp;
@property (nonatomic,copy  ) NSString                          * message;
@property (nonatomic,assign) int                               dataStatus;
@property (nonatomic,assign) int                               organizationId;// CMS
@property (nonatomic,strong) NSArray <WiSeDeviceGroupAssociationDetails *> * deviceGroupAssociationList;// List of WiSeDeviceGroupAssociationDetails
@property (nonatomic,copy  ) NSString                          * associationMessage;

// Used In Get Device Group Association
@property (nonatomic,assign) int                               userId;
@property (nonatomic,copy  ) NSString                          * groupPath;

@property (nonatomic,copy  ) NSString  * deviceSecurityKey;
@property (nonatomic,copy  ) NSString  * devicePairingKey;

@property (nonatomic,assign) int      tempId;


@end
