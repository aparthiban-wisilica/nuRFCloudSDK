//
//  WiSeDeviceServicesRequestParser.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 29/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudDeviceAPIRequest;
@class WiSeCloudListenerAPIRequest;


@interface WiSeDeviceServicesRequestParser : NSObject

+ (NSMutableArray *) createAddDeviceApiParameters : (WiSeCloudDeviceAPIRequest *)    request;

+ (NSMutableArray *) createEditDeviceApiParameters : (WiSeCloudDeviceAPIRequest *)   request;

+ (NSMutableArray *) createDeleteDeviceApiParameters : (WiSeCloudDeviceAPIRequest *) request;

+ (NSMutableArray *) createGetSecureDeviceApiParameters : (WiSeCloudDeviceAPIRequest *) request;

+ (NSMutableArray *) createDeviceGroupAssociationApiParameters : (WiSeCloudDeviceAPIRequest *) request;

+ (NSMutableArray *) createAddListenerApiParameters : (WiSeCloudListenerAPIRequest *) request;

+ (NSDictionary *) createAddListenerApiParameters1 : (WiSeCloudListenerAPIRequest *) request;

+ (NSMutableArray *) createAddSecureListenerApiParameters : (WiSeCloudListenerAPIRequest *) request;

+ (NSDictionary *) createAddSecureListenerApiParameters1 : (WiSeCloudListenerAPIRequest *) request;

+ (NSMutableArray *) createGetListenersFromOrganizationApiParameters : (WiSeCloudListenerAPIRequest *) request;

+ (NSMutableArray *) createDeleteSecureListenerApiParameters : (WiSeCloudListenerAPIRequest *) request;

+ (NSMutableArray *) createEditListenerApiParameters : (WiSeCloudListenerAPIRequest *) request;

+ (NSMutableArray *) createDeleteListenerApiParameters : (WiSeCloudListenerAPIRequest *) request;

+ (NSDictionary *) createDeleteListenerApiParameters1 : (WiSeCloudListenerAPIRequest *) request;


@end
