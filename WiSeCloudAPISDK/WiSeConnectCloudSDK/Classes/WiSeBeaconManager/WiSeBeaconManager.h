//
//  WiSeBeaconManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 15/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeBeaconManagerDelegate.h"


@class WiSeCloudAPIRequestDetails;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeCloudBeaconAPIRequest;
@class WiSeAppError;

@interface WiSeBeaconManager : NSObject

@property (nonatomic,weak) id <WiSeBeaconManagerDelegate> delegate;


- (WiSeCloudAPIRequestRegisteredDetails *) addBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) editBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) getBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) deleteBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request;

- (WiSeCloudAPIRequestRegisteredDetails *) addConfiguredBeaconApiWithRequest:(WiSeCloudBeaconAPIRequest *)request;
- (WiSeCloudAPIRequestRegisteredDetails *) editConfiguredBeaconApiWithRequest:(WiSeCloudBeaconAPIRequest *)request;
- (WiSeCloudAPIRequestRegisteredDetails *) getConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) deleteConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) deviceBeaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request;
- (WiSeCloudAPIRequestRegisteredDetails *) getDeviceBeaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedDeviceBeaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) updateBeaconBatteryStatusApiWithRequest : (WiSeCloudBeaconAPIRequest *) request;
- (WiSeCloudAPIRequestRegisteredDetails *) updateBeaconDataLogApiWithRequest : (WiSeCloudBeaconAPIRequest *) request;


@end
