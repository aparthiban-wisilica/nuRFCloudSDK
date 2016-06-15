//
//  WiSeSharedGroupDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeSharedGroupDetails : NSObject

@property (nonatomic,copy  ) NSString  * groupName;
@property (nonatomic,assign) NSInteger groupIconCloudId;
@property (nonatomic,assign) NSInteger groupCloudId;
@property (nonatomic,strong) NSDate    * lastUpdated;
@property (nonatomic,copy  ) NSString  * iconUrl;

@end
