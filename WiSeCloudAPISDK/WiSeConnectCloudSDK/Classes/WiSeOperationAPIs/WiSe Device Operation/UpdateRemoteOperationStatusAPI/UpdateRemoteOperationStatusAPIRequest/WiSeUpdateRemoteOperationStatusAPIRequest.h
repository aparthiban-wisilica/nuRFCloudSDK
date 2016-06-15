//
//  UpdateRemoteOperationStatusAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 07/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>


@interface WiSeUpdateRemoteOperationStatusAPIRequest : NSObject

@property (nonatomic,assign) WiSeCloudApiRequestPriority priority;
@property (nonatomic,assign) NSInteger                   wiseCloudId;
@property (nonatomic,strong) NSString                    * token;
@property (nonatomic,assign) WiSeItemType                itemType;
@property (nonatomic,assign) NSInteger                   status;
@property (nonatomic,assign) NSInteger                   messageId;
@property (nonatomic,assign) NSInteger                   sequenceNumber;
@property (nonatomic,assign) NSInteger                   phoneCloudId;
@property (nonatomic,copy  ) NSString                    * deviceType;
@property (nonatomic,copy  ) NSString                    * operationId;
@property (nonatomic,copy  ) NSString                    * networkType;
@property (nonatomic,copy  ) NSString                    * data;

@end
