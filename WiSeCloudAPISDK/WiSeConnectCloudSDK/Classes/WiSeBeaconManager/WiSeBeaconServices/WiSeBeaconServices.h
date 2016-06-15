//
//  WiSeBeaconServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeCloudBeaconAPIRequest;


@interface WiSeBeaconServices : NSObject

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) addBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) editBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) addConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) editConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteConfiguredBeaconApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) beaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getBeaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedBeaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request;

//- (WiSeCloudAPIRequestRegisteredDetails *) geleteBeaconAssociationApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) updateBeaconBatteryStatusApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) updateBeaconDataLogApiWithRequest : (WiSeCloudBeaconAPIRequest *) request ;


@end
