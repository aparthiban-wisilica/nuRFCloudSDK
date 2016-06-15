//
//  WiSeDeleteFriendAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeDeleteFriendAPIResponse : NSObject

@property (nonatomic,copy  ) NSString  * message;
@property (nonatomic,assign) BOOL      status;
@property (nonatomic,assign) NSInteger friendId;
@property (nonatomic,assign) NSInteger friendDetailStatus;
@property (nonatomic,copy  ) NSString  * friendDeatilsMessage;

@end
