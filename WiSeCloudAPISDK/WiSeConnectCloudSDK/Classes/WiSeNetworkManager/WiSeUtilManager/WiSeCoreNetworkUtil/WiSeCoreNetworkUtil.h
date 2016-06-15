//
//  WiSeCoreNetworkUtil.h
//  WiSeCoreNetworkManager
//
//  Created by Ashok Parthiban D on 20/01/16.
//  Copyright © 2016 WiSilica. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeOperation;

@interface WiSeCoreNetworkUtil : NSObject

+(BOOL)isNetworkAvailable;
+(NSString *)getJsonString:(id)rawData;
+ (id) replaceNullValues : (id) object;
+ (BOOL) validateRequestMethod : (NSString *) strMethod ;
+ (BOOL) validateRequestPriority : (int) requestPriority;
+ (void)printRequestInfo:(WiSeOperation *)wiseCloudApiRequest;

@end
