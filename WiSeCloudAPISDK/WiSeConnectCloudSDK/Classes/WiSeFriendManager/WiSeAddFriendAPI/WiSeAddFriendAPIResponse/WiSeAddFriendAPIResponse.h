//
//  WiSeAddFriendAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeAddFriendAPIResponse : NSObject

@property (nonatomic,strong) NSString * message;
@property (nonatomic,assign) BOOL status;
@property (nonatomic,strong) NSArray * addedFriendsDetails;

@end
