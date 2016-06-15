//
//  WiSeDeviceServicesResponseParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 29/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>

@class WiSeCloudDeviceAPIResponse;
@class WiSeGetADeviceAPIResponse;
@class WiSeCloudApiResponse;
@class WiSeCloudListenerAPIResponse;

@interface WiSeDeviceServicesResponseParser : NSObject

+ (WiSeCloudDeviceAPIResponse *) parseAddDeviceAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudDeviceAPIResponse *) parseEditDeviceAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudDeviceAPIResponse *) parseDeleteDeviceAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeGetADeviceAPIResponse *) parseGetADeviceAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudDeviceAPIResponse *) parseGetAllDeviceAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudDeviceAPIResponse *) parseDeviceGroupAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudDeviceAPIResponse *) parseGetDeviceGroupAssociationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudListenerAPIResponse *) parseGetListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudListenerAPIResponse *) parseGetListenerZoneMappingAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudListenerAPIResponse *) parseGetListenersFromOrganizationAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudListenerAPIResponse *) parseAddListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudListenerAPIResponse *) parseAddSecureListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudListenerAPIResponse *) parseEditListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudListenerAPIResponse *) parseDeleteListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (WiSeCloudDeviceAPIResponse *) appendBasicDetails : (WiSeCloudDeviceAPIResponse *) currentResponse andBasicResponse : (WiSeCloudApiResponse *) basicResponse;

+ (WiSeCloudListenerAPIResponse *) parseGetArchivedListenerAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

+ (NSMutableArray *) getDeviceDetailsListFromResponseData : (NSDictionary *) dictResponse;

+ (NSMutableArray *) getDeviceDetails : (NSDictionary *) dataDict;

+ (NSArray *) getDeviceGroupAssocicationList : (NSArray *) list;

+ (NSMutableArray *) getListenerDetails : (NSArray *) dataArray;

+ (NSMutableArray *) getListenersFromOrganizationFromResponseData : (NSArray *) arrOfListeners;

@end
