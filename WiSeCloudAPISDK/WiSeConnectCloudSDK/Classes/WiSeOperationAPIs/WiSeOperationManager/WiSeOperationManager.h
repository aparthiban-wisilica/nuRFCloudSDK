//
//  WiSeOperationManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 05/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeOperationManagerDelegate.h"

@class WiSeUpdateDirectOperationStatusAPIRequest;
@class WiSeRequestForRemoteOperationAPIRequest;
@class WiSeUpdateRemoteOperationFeedbackAPIRequest;

@class WiSeCloudAPIRequestRegisteredDetails;


@interface WiSeOperationManager : NSObject

@property (nonatomic,weak) id <WiSeOperationManagerDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) updateDirectOperationStautsApiWithRequest : (WiSeUpdateDirectOperationStatusAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) requestForRemoteOperationApiWithRequest : (WiSeRequestForRemoteOperationAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) updateRemoteOperationFeedbackApiWithRequest : (WiSeUpdateRemoteOperationFeedbackAPIRequest *) request ;



@end
