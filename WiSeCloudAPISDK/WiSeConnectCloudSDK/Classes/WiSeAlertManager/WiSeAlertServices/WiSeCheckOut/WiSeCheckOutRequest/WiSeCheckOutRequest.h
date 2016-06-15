//
//  WiSeCheckOutRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WiSeBaseRequest.h"

@interface WiSeCheckOutRequest : WiSeBaseRequest

@property (nonatomic,assign) int tagId;
@property (nonatomic,assign) int checkOutInterval;
@property (nonatomic,assign) int checkoutAction;

@end
