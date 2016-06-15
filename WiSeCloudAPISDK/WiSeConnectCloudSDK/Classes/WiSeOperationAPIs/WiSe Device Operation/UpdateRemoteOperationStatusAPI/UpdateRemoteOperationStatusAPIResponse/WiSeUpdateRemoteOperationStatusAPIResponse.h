//
//  UpdateRemoteOperationStatusAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 07/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeUpdateRemoteOperationStatusAPIResponse : NSObject

@property (nonatomic, assign) BOOL     status;
@property (nonatomic, copy  ) NSString *message;

@end
