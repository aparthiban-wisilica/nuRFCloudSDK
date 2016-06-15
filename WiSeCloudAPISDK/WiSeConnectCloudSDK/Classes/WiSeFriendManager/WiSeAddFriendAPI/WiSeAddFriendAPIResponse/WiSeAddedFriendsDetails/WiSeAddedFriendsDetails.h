//
//  WiSeAddedFriendsDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeAddedFriendsDetails : NSObject

@property (nonatomic,assign) NSInteger friendId;
@property (nonatomic,assign) NSInteger status;
@property (nonatomic,copy  ) NSString  * message;
@property (nonatomic,copy  ) NSString  * notificationStatus;


@end
