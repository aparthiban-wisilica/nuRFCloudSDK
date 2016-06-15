//
//  WiSeBeaconServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>


@class WiSeCloudBeaconAPIResponse;

@interface WiSeBeaconServicesResponseParser : NSObject

+ (WiSeCloudBeaconAPIResponse *) parseAddBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseEditBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseGetBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseDeleteBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseAddConfiguredBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseEditConfiguredBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseGetConfiguredBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseDeleteConfiguredBeaconAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseCreateBeaconAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseGetBeaconAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseDeleteBeaconAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseUpdateBeaconBatteryStatusAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudBeaconAPIResponse *) parseUpdateBeaconDataLogAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (NSArray *) getBeaconListFromDataArray : (NSArray *) dataArray;

+ (NSArray *) getBeaconListForGetFromDataArray : (NSArray *) dataArray;

@end
