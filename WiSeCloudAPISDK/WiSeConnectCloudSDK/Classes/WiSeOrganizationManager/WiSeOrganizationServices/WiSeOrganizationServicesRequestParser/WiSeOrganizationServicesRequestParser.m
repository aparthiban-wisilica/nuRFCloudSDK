//
//  WiSeOrganizationServicesRequestParser.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeOrganizationServicesRequestParser.h"
#import "WiSeNetworkUtil.h"
#import "WiSeCloudOrganizationRequest.h"
#import "WiSeCloudOrganizationInfo.h"

@implementation WiSeOrganizationServicesRequestParser

#pragma mark --- Add Sub Organization ---

+ (NSMutableArray *) createAddOrganizationApiParameters : (WiSeCloudOrganizationRequest *)    request {
    NSArray * arrOrganizationDetails = request.organizationList;
    arrOrganizationDetails = [WiSeNetworkUtil replaceNullValues:arrOrganizationDetails];
    NSMutableArray * arrJson = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrOrganizationDetails]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrOrganizationDetails.count; i++) {
            WiSeCloudOrganizationInfo * orgInfo = [arrOrganizationDetails objectAtIndex:i];
            if (orgInfo) {
                NSString * strOrgRootId  = [NSString stringWithFormat:@"%d",orgInfo.rootOrganizationId];
                NSString * strCustomerId = [NSString stringWithFormat:@"%d",orgInfo.customerId];
                orgInfo.organizationName = orgInfo.organizationName?orgInfo.organizationName:@"";
                NSString * strTempId   = [NSString stringWithFormat:@"%d",orgInfo.tempId];

                // On Edit
                NSString * strOrgId      = [NSString stringWithFormat:@"%d",orgInfo.organizationId];

                NSArray * keys           = [NSArray arrayWithObjects:ORG_NAME,
                                            CUSTOMER_ID,
                                            ROOT_ORG_ID,
                                            ORG_ID,
                                            TEMP_ID, nil];
                
                NSArray * objects        = [NSArray arrayWithObjects:orgInfo.organizationName,
                                            strCustomerId,
                                            strOrgRootId,
                                            strOrgId,
                                            strTempId, nil];
                
                if (keys.count == objects.count) {
                    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
                    [arrJson addObject:jsonDictionary];
                }
            }
        }
    }
    
    return arrJson;
}

#pragma mark --- Edit Sub Organization ---

+ (NSMutableArray *) createEditOrganizationApiParameters : (WiSeCloudOrganizationRequest *)   request{
    return [self createAddOrganizationApiParameters:request];
}


#pragma mark --- Delete Sub Organization ---

+ (NSMutableArray *) createDeleteOrganizationApiParameters : (WiSeCloudOrganizationRequest *) request{
    
    NSArray * arrOrganizationDetails = request.organizationList;
    arrOrganizationDetails           = [WiSeNetworkUtil replaceNullValues:arrOrganizationDetails];
    NSMutableArray * arrJson         = nil;
    
    if ([WiSeNetworkUtil isArrayValid:arrOrganizationDetails]) {
        arrJson = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrOrganizationDetails.count; i++) {
            WiSeCloudOrganizationInfo * orgInfo = [arrOrganizationDetails objectAtIndex:i];
            if (orgInfo) {
                
                NSString * strOrgId     = [NSString stringWithFormat:@"%d",orgInfo.organizationId];

                NSDictionary * jsonDict = [NSDictionary dictionaryWithObjectsAndKeys:strOrgId,ORG_ID, nil];
                
                [arrJson addObject:jsonDict];
            }
        }
    }
    
    return arrJson;
    
}


@end
