//
//  WiSeMapSettingServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/05/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudMapAPIRequest;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeAPIHeader;

@interface WiSeMapSettingServices : NSObject

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) getMapSettingsApiWithRequest : (WiSeCloudMapAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
