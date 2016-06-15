//
//  WiSeShareAccept_RejectAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 31/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"

@interface WiSeShareAccept_RejectAPIResponse : NSObject

@property (nonatomic,copy  ) NSString        * message;
@property (nonatomic,copy  ) NSString        * notificationStatus;
@property (nonatomic,copy  ) NSString        * actionMessage;
@property (nonatomic,assign) NSInteger       count;
@property (nonatomic,assign) WiSeShareAction shareAction;


@end
