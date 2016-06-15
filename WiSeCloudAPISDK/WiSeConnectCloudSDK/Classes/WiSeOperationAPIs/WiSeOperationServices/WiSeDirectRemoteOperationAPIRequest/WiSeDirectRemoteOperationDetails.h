//
//  WiSeDirectRemoteOperationAPIRequest.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#import <WiSeNetworkManager/WiSeCoreNetworkConstants.h>

@interface WiSeDirectRemoteOperationDetails : NSObject

@property (nonatomic,assign ) int          device_groupCloudId;
@property (nonatomic,assign ) int          device_groupMeshId;
@property (nonatomic,assign ) WiSeItemType itemType;
@property (nonatomic,assign ) int          operationId;
@property (nonatomic,assign ) int          phoneOperationId;
@property (nonatomic,assign ) int          sequenceNumber;

@property (nonatomic,assign ) int          coolValue;
@property (nonatomic,assign ) int          warmValue;
@property (nonatomic,assign ) int          intensity;

@property (nonatomic, assign) int          rgbRValue;
@property (nonatomic, assign) int          rgbGValue;
@property (nonatomic, assign) int          rgbBValue;
@property (nonatomic, assign) int          timerValue;

@property (nonatomic,assign ) double       timeStamp;

// Used In remote operation Status Update
@property (nonatomic,copy   ) NSString     * encData;

// Used in API response
@property (nonatomic,copy   ) NSString     * message;
@property (nonatomic,assign ) int          status;

@end
