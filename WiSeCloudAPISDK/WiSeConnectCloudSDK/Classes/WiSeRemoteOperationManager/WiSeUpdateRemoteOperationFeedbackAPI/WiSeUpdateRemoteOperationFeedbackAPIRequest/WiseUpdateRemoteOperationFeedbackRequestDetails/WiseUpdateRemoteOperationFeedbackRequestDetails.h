//
//  WiseUpdateRemoteOperationFeedbackRequestDetails.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiseUpdateRemoteOperationFeedbackRequestDetails : NSObject

@property (nonatomic,assign) int      operationLogId;
@property (nonatomic,copy  ) NSString * encData;

@end
