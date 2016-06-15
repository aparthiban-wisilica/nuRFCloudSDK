//
//  WiSeShutterDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 21/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeShutterDetails : NSObject

@property (nonatomic,assign) NSInteger deviceCloudId;
@property (nonatomic,assign) NSInteger remoteId;
@property (nonatomic,assign) int       slot;

@end
