//
//  WiSeAppServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 08/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeRegisterAppAPIRequest;
@class WiSeAPIHeader;

@interface WiSeAppServices : NSObject

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) registerAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request ;

- (WiSeCloudAPIRequestRegisteredDetails *) updateRegisterAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request ;

// CMS

- (WiSeCloudAPIRequestRegisteredDetails *) registerAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) updateRegisterAppAPIWithRequest : (WiSeRegisterAppAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
