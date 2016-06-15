//
//  WiSeOperationServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 04/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeUpdateDirectOperationStatusAPIRequest;
@class WiSeRequestForRemoteOperationAPIRequest;
@class WiSeUpdateRemoteOperationFeedbackAPIRequest;
@class WiSeDirectRemoteOperationDetails; 


@interface WiSeOperationServices : NSObject 

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) updateDirectOperationStautsApiWithRequest : (WiSeUpdateDirectOperationStatusAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) requestForRemoteOperationApiWithRequest : (WiSeRequestForRemoteOperationAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) updateRemoteOperationFeedbackApiWithRequest : (WiSeUpdateRemoteOperationFeedbackAPIRequest *) request ;





@end
