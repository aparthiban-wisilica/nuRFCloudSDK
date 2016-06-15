//
//  WiSeFriendsDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 30/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeFriendsDetails : NSObject

@property (nonatomic,assign) NSInteger userId;
@property (nonatomic,copy  ) NSString  * userName;
@property (nonatomic,copy  ) NSString  * userDisplayName;

@end
