//
//  WiSeCloudApiResponse.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeCloudApiResponse : NSObject

@property (nonatomic,strong) NSDate         * startTime;
@property (nonatomic,strong) NSDate         * endTime;
@property (nonatomic,assign) int            apiId;
@property (nonatomic,copy  ) NSString       * statusMessage;
@property (nonatomic,assign) NSInteger      urlResponseStatusCode;
@property (nonatomic,assign) NSTimeInterval executionTime;

@end
