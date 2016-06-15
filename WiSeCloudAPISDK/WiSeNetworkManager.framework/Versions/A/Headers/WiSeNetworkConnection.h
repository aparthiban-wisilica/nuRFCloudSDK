//
//  WiSeNetworkConnection.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 16/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAppError.h"




/*!
 * @brief NetworkOperationStatus it is block that will be triggered when an api calls ends.
 */

typedef void (^NetworkOperationStatus)(NSData * respnsedata,NSError * error,NSURLResponse * response);

/*!
 @class WiSeNetworkConnection
 
 @brief Perform request operation
 
 @discussion    This class was designed and implemented to perform request operation.
 
 @superclass SuperClass: NSObject
 
 @classdesign Has block that will work as callback for request operation.
 
 @coclass    WiSeNetworkManager
 */

@interface WiSeNetworkConnection : NSObject

/*!
 * @discussion executes a request.
 * @param url Request url.
 * @param headerParams Header Parameters.
 * @param jsonRequest Json Request.
 * @param operationStatusBlock NetworkOperationStatus Block.
 * @param httpMethod Http Method for request.
 * @return void.
 */

- (void)sendRequestForUrl :(NSURL*)url headerParams :(NSDictionary*)headerParams
              jsonRequest :(NSString*)jsonRequest :(NetworkOperationStatus)operationStatusBlock
               HTTPMethod :(NSString*)httpMethod ;

@end
