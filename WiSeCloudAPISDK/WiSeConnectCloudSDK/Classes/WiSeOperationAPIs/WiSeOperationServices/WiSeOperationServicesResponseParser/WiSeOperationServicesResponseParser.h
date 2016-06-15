//
//  WiSeOperationServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 04/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

@class WiSeUpdateDirectOperationStatusAPIResponse;
@class WiSeRequestForRemoteOperationAPIResponse;
@class WiSeUpdateRemoteOperationFeedbackAPIResponse;



@interface WiSeOperationServicesResponseParser : NSObject

+ (WiSeUpdateDirectOperationStatusAPIResponse *) parseUpdateDirectOperationStatusAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeRequestForRemoteOperationAPIResponse *) parseRequestForRemoteOperationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeUpdateRemoteOperationFeedbackAPIResponse *) parseUpdateRemoteOperationFeedbackAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (NSArray *) getOperationDetailsFromDataArray : (NSArray *) dataArray;

+ (NSArray *) getOperationDetailsFromDataArray1 : (NSArray *) dataArray;

@end
