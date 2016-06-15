//
//  WiSeOperationQueue.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 19/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WiSeOperationQueue : NSObject

@property (nonatomic,strong) NSMutableArray * queue;
@property (nonatomic,assign) int maxConcurrentOperations;
@property (nonatomic,assign) int maxQueueSize;

@end
