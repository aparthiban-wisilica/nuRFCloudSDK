//
//  WiSeNetworkConnection.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 16/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAppError.h"

typedef void (^NetworkOperationStatus)(NSData * respnsedata,NSError * error,NSURLResponse * response);

@interface WiSeNetworkConnection : NSObject

- (void)sendRequestForUrl :(NSURL*)url headerParams :(NSDictionary*)headerParams
              jsonRequest :(NSString*)jsonRequest :(NetworkOperationStatus)operationStatusBlock
               HTTPMethod :(NSString*)httpMethod ;

@end
