//
//  WiSeTagManagerServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WiSeCloudTagRequest;

@interface WiSeTagManagerServicesRequestParser : NSObject

+ (NSMutableArray *) createAddTagApiParameters : (WiSeCloudTagRequest *)    request;

+ (NSDictionary *) createAddTagApiParameters1 : (WiSeCloudTagRequest *)    request;

+ (NSMutableArray *) createEditTagApiParameters : (WiSeCloudTagRequest *)    request;

+ (NSMutableArray *) createDeleteTagApiParameters : (WiSeCloudTagRequest *)    request;

+ (NSMutableArray *) createSecureTagApiParameters : (WiSeCloudTagRequest *)    request;

+ (NSDictionary *) createSecureTagApiParameters1 : (WiSeCloudTagRequest *)    request;

+ (NSMutableArray *) createDeleteSecureTagApiParameters : (WiSeCloudTagRequest *)    request;
@end
