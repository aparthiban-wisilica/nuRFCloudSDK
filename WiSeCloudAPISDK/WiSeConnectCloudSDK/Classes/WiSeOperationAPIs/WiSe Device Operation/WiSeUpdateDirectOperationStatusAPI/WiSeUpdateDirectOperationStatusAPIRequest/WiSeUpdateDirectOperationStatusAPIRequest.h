//
//  WiSeUpdateDirectOperationStatusAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 04/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBaseRequest.h"

@interface WiSeUpdateDirectOperationStatusAPIRequest : WiSeBaseRequest

@property (nonatomic,strong) NSArray * wiseUpdateDirectOperationStatusDetailsList; //Array of WiSeDirectRemoteOperationDetails

@end
