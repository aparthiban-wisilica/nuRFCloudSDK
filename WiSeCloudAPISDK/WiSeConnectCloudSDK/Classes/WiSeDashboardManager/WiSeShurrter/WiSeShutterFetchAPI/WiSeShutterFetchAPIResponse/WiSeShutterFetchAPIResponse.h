//
//  WiSeShutterFetchAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 21/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeShutterFetchAPIResponse : NSObject

@property (nonatomic,assign) BOOL    status;
@property (nonatomic,strong) NSArray * shutterDetailsList;

@end
