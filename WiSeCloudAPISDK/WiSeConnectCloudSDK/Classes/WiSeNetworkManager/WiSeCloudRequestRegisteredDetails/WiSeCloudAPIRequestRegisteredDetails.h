//
//  WiSeCloudRequestRegisteredDetails.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 16/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCoreNetworkConstants.h"

@interface WiSeCloudAPIRequestRegisteredDetails : NSObject

@property (nonatomic,assign) int requestRegisteredId;
@property (nonatomic,assign) WiSeCloudApiRequestStatus requestStatus;

- (instancetype) initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId : (int) requestRegisteredId WithRequestStatus : (WiSeCloudApiRequestStatus) requestStatus;

@end
