//
//  WiSeMessageFetchAPIResponse.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 10/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

@interface WiSeMessageFetchAPIResponse : WiSeCloudApiResponse

@property (nonatomic,assign) GetMessageSuccesAndError statusCode;
@property (nonatomic,strong) NSArray                  * messageList;
@property (nonatomic,assign) int                      remainingMessage;

@end
