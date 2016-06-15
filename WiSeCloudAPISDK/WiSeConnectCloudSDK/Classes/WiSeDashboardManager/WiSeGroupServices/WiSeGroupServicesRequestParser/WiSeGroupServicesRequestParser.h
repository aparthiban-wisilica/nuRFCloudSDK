//
//  WiSeGroupServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 28/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudGroupAPIRequest;

@interface WiSeGroupServicesRequestParser : NSObject

+ (NSMutableArray *) createAddGroupApiParameters : (WiSeCloudGroupAPIRequest *) request;

+ (NSMutableArray *) createEditGroupApiParameters : (WiSeCloudGroupAPIRequest *) request;

+ (NSMutableArray *) createDeleteGroupApiParameters : (WiSeCloudGroupAPIRequest *) request;

@end
