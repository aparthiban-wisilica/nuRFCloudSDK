//
//  WiSeBeaconServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudBeaconAPIRequest;

@interface WiSeBeaconServicesRequestParser : NSObject

+ (NSArray *) createAddBeaconApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

+ (NSArray *) createEditBeaconApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

+ (NSArray *) createDeleteBeaconApiParameterWithRequest: (WiSeCloudBeaconAPIRequest *) request ;

+ (NSArray *) createAddEditConfiguredBeaconApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

+ (NSArray *) createEditConfiguredBeaconApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

+ (NSArray *) createDeleteConfiguredBeaconApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

+ (NSArray *) createCreateBeaconAssociationApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

+ (NSArray *) createDeleteBeaconAssociationApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

+ (NSArray *) updateBeaconBatteryStatusApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

+ (NSData *) updateBeaconDataLogApiParameterWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

@end
