//
//  WiSeAppServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

@class WiSeRegisterAppInfoAPIResponse;

@interface WiSeAppServicesResponseParser : NSObject

+ (WiSeRegisterAppInfoAPIResponse *) parseSaveAppInfoAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

@end
