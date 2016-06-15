//
//  WiSeRequestManager.m
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 16/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeCloudApiRequest.h"
#import "WiSeCoreNetworkConstants.h"
#import "WiSeCoreNetworkUtil.h"

@implementation WiSeCloudApiRequest


- (instancetype) initWiSeApiRequestWithURL : (NSString  *) strULR withHttpMethod : (NSString *) strHttpMethod withHeader : (NSDictionary *) dictRequestHeader withDictionaryRequestBody : (NSDictionary *) requestBody withURLKey : (NSString *) strURLKey withPriority : (WiSeCloudApiRequestPriority ) requestPriority withDelegate : (id<WiSeCloudApiRequestDelegate>) delegate withModelAPIRequest:(id) modelAPIRequest forAPICall : (int) apiName
{
    
    BOOL isRequestInValid = NO;
    NSMutableDictionary* details;
    WiSeAppError * error;
    
    if (strULR == nil) { // Check for empty URL string
       // isRequestInValid = YES;
        details = [NSMutableDictionary dictionary];
        [details setValue:@"URL is empty" forKey:NSLocalizedDescriptionKey];
        error = [[WiSeAppError alloc] initWithDomain:@"Init WiSeRequestManage" code:-1 userInfo:details];
        WiSeLogInfo(@"%@",error);
        return nil;
    }
    
    if (![WiSeCoreNetworkUtil validateRequestMethod:strHttpMethod]) { // Validate Request Method
       // isRequestInValid = YES;
        details = [NSMutableDictionary dictionary];
        [details setValue:[NSString stringWithFormat:@"Invalid request method : [%@]",strHttpMethod] forKey:NSLocalizedDescriptionKey];
        error = [[WiSeAppError alloc] initWithDomain:@"Init WiSeRequestManage" code:-1 userInfo:details];
        WiSeLogInfo(@"%@",error);
        return nil;
    }
    
    if (![WiSeCoreNetworkUtil validateRequestPriority:requestPriority]) {
        details = [NSMutableDictionary dictionary];
        [details setValue:[NSString stringWithFormat:@"Invalid request priority : [%@] Should be 1 to 10!",dictRequestHeader] forKey:NSLocalizedDescriptionKey];
        error = [[WiSeAppError alloc] initWithDomain:@"Init WiSeRequestManage" code:-1 userInfo:details];
        WiSeLogInfo(@"%@",error);
        return nil;
    }
    
    if (!isRequestInValid) { // Create new instanse 
        self.strULR = strULR;
        self.strHttpMethod = strHttpMethod;
        self.requestBody = requestBody;
        self.dictRequestHeader = dictRequestHeader;
        self.strURLKey = strURLKey;
        self.requestPriority = requestPriority;
        self.delegate = delegate;
        self.modelAPIRequest = modelAPIRequest;
        self.forAPICall = apiName;
        return self;
    }
    return self;
}


- (instancetype) initWiSeApiRequestWithURL : (NSString  *) strULR withHttpMethod : (NSString *) strHttpMethod withHeader : (NSDictionary *) dictRequestHeader withArrayRequestBody : (NSArray *) requestBody withURLKey : (NSString *) strURLKey withPriority : (WiSeCloudApiRequestPriority ) requestPriority withDelegate : (id<WiSeCloudApiRequestDelegate>) delegate withModelAPIRequest:(id) modelAPIRequest forAPICall : (int) apiName
{
    BOOL isRequestInValid = NO;
    NSMutableDictionary* details;
    WiSeAppError * error;
    
    if (strULR == nil) { // Check for empty URL string
        // isRequestInValid = YES;
        details = [NSMutableDictionary dictionary];
        [details setValue:@"URL is empty" forKey:NSLocalizedDescriptionKey];
        error = [[WiSeAppError alloc] initWithDomain:@"Init WiSeRequestManage" code:-1 userInfo:details];
        WiSeLogInfo(@"%@",error);
        return nil;
    }
    
    if (![WiSeCoreNetworkUtil validateRequestMethod:strHttpMethod]) { // Validate Request Method
        // isRequestInValid = YES;
        details = [NSMutableDictionary dictionary];
        [details setValue:[NSString stringWithFormat:@"Invalid request method : [%@]",strHttpMethod] forKey:NSLocalizedDescriptionKey];
        error = [[WiSeAppError alloc] initWithDomain:@"Init WiSeRequestManage" code:-1 userInfo:details];
        WiSeLogInfo(@"%@",error);
        return nil;
    }
    
    if (![WiSeCoreNetworkUtil validateRequestPriority:requestPriority]) {
        details = [NSMutableDictionary dictionary];
        [details setValue:[NSString stringWithFormat:@"Invalid request priority : [%@] Should be 1 to 10!",dictRequestHeader] forKey:NSLocalizedDescriptionKey];
        error = [[WiSeAppError alloc] initWithDomain:@"Init WiSeRequestManage" code:-1 userInfo:details];
        WiSeLogInfo(@"%@",error);
        return nil;
    }
    
    if (!isRequestInValid) { // Create new instanse
        self.strULR = strULR;
        self.strHttpMethod = strHttpMethod;
        self.requestBody = requestBody;
        self.dictRequestHeader = dictRequestHeader;
        self.strURLKey = strURLKey;
        self.requestPriority = requestPriority;
        self.delegate = delegate;
        self.modelAPIRequest = modelAPIRequest;
        self.forAPICall = apiName;
        return self;
    }
    return self;

}



@end
