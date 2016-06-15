//
//  WiSeParsedAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 20/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//



#import <Foundation/Foundation.h>

@class WiSeAppError;

@interface WiSeParsedAPIResponse : NSObject

@property (nonatomic,retain) id responseData;
@property (nonatomic,retain) WiSeAppError * error;

@end
