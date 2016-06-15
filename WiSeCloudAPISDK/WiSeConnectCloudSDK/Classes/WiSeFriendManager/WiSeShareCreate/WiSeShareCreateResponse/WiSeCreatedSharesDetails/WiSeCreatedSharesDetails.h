//
//  WiSeCreatedSharesDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 04/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"

@interface WiSeCreatedSharesDetails : NSObject

@property (nonatomic,assign) WiSeItemType wiseItemType;
@property (nonatomic,assign) NSInteger    sharedId;
@property (nonatomic,assign) NSInteger    friendId;
@property (nonatomic,copy  ) NSString     * message;

@end
