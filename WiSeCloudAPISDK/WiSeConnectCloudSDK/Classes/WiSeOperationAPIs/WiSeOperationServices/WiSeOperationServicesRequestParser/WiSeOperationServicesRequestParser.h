//
//  WiSeOperationServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 04/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>


@class WiSeUpdateDirectOperationStatusAPIRequest;
@class WiSeRequestForRemoteOperationAPIRequest;
@class WiSeUpdateRemoteOperationFeedbackAPIRequest;


@interface WiSeOperationServicesRequestParser : NSObject

+ (NSDictionary *) createUpdateDirectOperationStatusApiParameters : (WiSeUpdateDirectOperationStatusAPIRequest *) request;

+ (NSDictionary *) createRequestForRemoteOperationApiParameters : (WiSeRequestForRemoteOperationAPIRequest *) request;

+ (NSMutableArray *) createUpdateRemoteOperationFeedbackApiParameters : (WiSeUpdateRemoteOperationFeedbackAPIRequest *) request;



@end
