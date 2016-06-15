//
//  WiSeUpdatedMessageDetails.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 15/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeUpdatedMessageDetails : NSObject

@property (nonatomic,assign) int  messageId;
@property (nonatomic,assign) BOOL status;
@property (nonatomic,assign) int  notificationId;

@end
