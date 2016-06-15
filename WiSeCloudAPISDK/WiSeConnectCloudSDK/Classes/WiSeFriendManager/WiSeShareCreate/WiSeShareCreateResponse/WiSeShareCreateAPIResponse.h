//
//  WiSeShareCreateResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeShareCreateAPIResponse : NSObject

@property (nonatomic,copy  ) NSString * message;
@property (nonatomic,copy  ) NSString * notificationMessage;
@property (nonatomic,assign) BOOL     status;
@property (nonatomic,strong) NSArray  * createdSharesDetails;

@end
