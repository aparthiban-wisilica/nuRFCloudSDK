//
//  WiSeCoreNetworkUtil.m
//  WiSeCoreNetworkManager
//
//  Created by Ashok Parthiban D on 20/01/16.
//  Copyright © 2016 WiSilica. All rights reserved.
//

#import "WiSeCoreNetworkUtil.h"
#import "Reachability.h"
#import "WiSeAppError.h"
#import "WiSeOperation.h"
#import "WiSeCloudApiRequest.h"
@implementation WiSeCoreNetworkUtil

// Check Internet connection
+(BOOL)isNetworkAvailable
{
    
    Reachability * reach = [Reachability reachabilityForInternetConnection];
    if ([reach currentReachabilityStatus] != NotReachable) {
        return  YES;
    }else {
        return NO;
    }
    return  YES;
}

// Convert Dictionary or Array to Json String
+(NSString *)getJsonString:(id)rawData
{
    if (rawData) {
        WiSeAppError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:rawData
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        NSString *strSignInJson;
        if (!jsonData)
        {
            //Deal with error
            
        } else
        {
            strSignInJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        return strSignInJson;
        
    }else {
        return @"";
    }
}


// Check for Null Values

+ (id) replaceNullValues : (id) object {
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary * dict = (NSDictionary *) object;
        NSMutableDictionary * mutDict = [[NSMutableDictionary alloc] init];
        
        for (NSString * key in [dict allKeys]) {
            id value = [dict objectForKey:key];
            if (value == [NSNull null]) {
                [mutDict setObject:@"" forKey:key];
            }else {
                [mutDict setObject:value forKey:key];
            }
        }
        return mutDict;
    }else if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray * mutArray = [[NSMutableArray alloc] init];
        for (id value in object) {
            if (value == [NSNull null]) {
                //                [mutArray addObject:@""];
            }else {
                [mutArray addObject:value];
            }
        }
        return mutArray;
    }else {
        
        if (object == [NSNull null]) {
            return nil;
        }
        
    }
    
    return object;
}

// Validate Request Method
+ (BOOL) validateRequestMethod : (NSString *) strMethod {
    
    NSArray * arrRequestMethods = [[NSArray alloc] initWithObjects:@"GET",@"POST",@"PUT",@"PATCH",@"DELETE",@"COPY",@"HEAD",@"OPTIONS",@"LINK",@"UNLINK",@"PURGE",@"LOCK",@"UNLOCK",@"PROPFIND",@"VIEW", nil];
    return [arrRequestMethods containsObject:strMethod];
}

// Validate Request Priority
+ (BOOL) validateRequestPriority : (int) requestPriority {
    
    if (!requestPriority) {
        requestPriority = 1;
    }
    
    if (requestPriority > 0 && requestPriority < 11) {
        return YES;
    }
    return NO;
}

// Print the Details of Core API Request
+ (void)printRequestInfo:(WiSeOperation *)operation {
    
    WiSeCloudApiRequest * wiseCloudApiRequest = operation.apiRequest;
    WiSeLogInfo(@"\n Request : %@ Started At : %@ \n %@ URL : %@ \n %@ Header : %@ \n %@ Body : %@ \n %@ Method : %@ \n -----RequestId %d-----\n",wiseCloudApiRequest.strURLKey,[NSDate date],wiseCloudApiRequest.strURLKey,wiseCloudApiRequest.strULR,wiseCloudApiRequest.strURLKey,wiseCloudApiRequest.dictRequestHeader,wiseCloudApiRequest.strURLKey,wiseCloudApiRequest.requestBody,wiseCloudApiRequest.strURLKey,wiseCloudApiRequest.strHttpMethod,operation.requestRegisteredId);
    
}


@end
