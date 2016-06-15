//
//  WiSeAppServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAppServicesRequestParser.h"
#import "WiSeNetworkUtil.h"
#import "WiSeRegisterAppAPIRequest.h"


@implementation WiSeAppServicesRequestParser

#pragma mark --- Register App ---

+ (NSDictionary *) createSaveAPPAPIJson : (WiSeRegisterAppAPIRequest *) request{
    
    request.deviceId    = request.deviceId?request.deviceId:@"";
    request.osInfo      = request.osInfo?request.osInfo:@"";
    request.modelInfo   = request.modelInfo?request.modelInfo:@"";
    request.deviceToken = request.deviceToken?request.deviceToken:@"";
    request.appVersion  = request.appVersion?request.appVersion:@"";
    NSString * strOrgId = [NSString stringWithFormat:@"%d",request.organizationId];
    
    // create input json string
    NSArray *keys    = [NSArray arrayWithObjects:DEVICEID,
                        OSINFO,
                        MODELINFO,
                        ORGANIZATIONID,
                        DEVICETOKEN,
                        APPVERSION,nil];
    
    NSArray *objects = [NSArray arrayWithObjects:request.deviceId,
                        request.osInfo,
                        request.modelInfo,
                        strOrgId,
                        request.deviceToken,
                        request.appVersion, nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    return nil;
}

#pragma mark --- Update Register App ---

+(NSDictionary *) createUpdateSaveAPPAPIJson : (WiSeRegisterAppAPIRequest *) request{
    request.deviceToken = request.deviceToken?request.deviceToken:@"";
    NSString * strAppId = [NSString stringWithFormat:@"%d",request.appId];
    NSString * strOrgId = [NSString stringWithFormat:@"%d",request.organizationId];
    
    // create input json string
    NSArray *keys    = [NSArray arrayWithObjects:ORGANIZATIONID,
                        DEVICETOKEN,
                        APPId,nil];
    
    NSArray *objects = [NSArray arrayWithObjects:strOrgId,
                        request.deviceToken,
                        strAppId, nil];
    
    if (keys.count == objects.count) {
        NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        return jsonDictionary;
    }
    return nil;
}

@end
