//
//  WiSeNetworkConnection.m
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 16/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeNetworkConnection.h"
#import "WiSeAppError.h"

const NSInteger timeoutInterval = 30;

@implementation WiSeNetworkConnection

- (void)sendRequestForUrl :(NSURL*)url headerParams :(NSDictionary*)headerParams
              jsonRequest :(NSString*)jsonRequest :(NetworkOperationStatus)operationStatusBlock
               HTTPMethod :(NSString*)httpMethod
{

    NSURLSession * session = [NSURLSession sharedSession];
    NSMutableURLRequest * urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    urlRequest.timeoutInterval = timeoutInterval;
    urlRequest.HTTPMethod = httpMethod;
    
    if(headerParams)
    {
        for (NSString * key in [headerParams allKeys])
        {
            [urlRequest setValue:[headerParams objectForKey:key] forHTTPHeaderField:key];
        }
    }
    
    if (jsonRequest && jsonRequest.length)
    {
        NSData * jsonData = [jsonRequest dataUsingEncoding:NSUTF8StringEncoding];
        urlRequest.HTTPBody = jsonData;
    }
    
    NSURLSessionDataTask *dataTask =[session dataTaskWithRequest:urlRequest
                                               completionHandler:
                                     ^(NSData *  data, NSURLResponse * response, NSError *  error)
                                     {
                                         if(operationStatusBlock)
                                         {
                                             operationStatusBlock(data,error,response);
                                             
                                         }
                                     }];
    
    [dataTask resume];
    
}

@end
