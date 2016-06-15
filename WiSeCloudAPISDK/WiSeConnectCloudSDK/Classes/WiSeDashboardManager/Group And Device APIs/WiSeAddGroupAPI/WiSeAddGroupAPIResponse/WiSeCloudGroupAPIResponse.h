//
//  WiSeAddGroupAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeGroupDetails.h"

@interface WiSeCloudGroupAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) int              statusCode;
@property (nonatomic,assign) int              remainingGroups;
@property (nonatomic,strong) NSArray <WiSeGroupDetails *> * groupList;// Array of WiSeGroupDetails


@end
