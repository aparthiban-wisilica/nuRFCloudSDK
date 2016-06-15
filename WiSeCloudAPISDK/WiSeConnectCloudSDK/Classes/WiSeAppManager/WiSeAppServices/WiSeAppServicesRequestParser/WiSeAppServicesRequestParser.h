//
//  WiSeAppServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeRegisterAppAPIRequest;

@interface WiSeAppServicesRequestParser : NSObject

+(NSDictionary *) createSaveAPPAPIJson : (WiSeRegisterAppAPIRequest *) request;

+(NSDictionary *) createUpdateSaveAPPAPIJson : (WiSeRegisterAppAPIRequest *) request;

@end
