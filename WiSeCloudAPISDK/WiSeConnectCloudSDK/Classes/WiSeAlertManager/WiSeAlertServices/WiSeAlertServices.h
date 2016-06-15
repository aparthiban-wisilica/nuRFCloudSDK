//
//  WiSeAlertServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 18/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeAPIHeader;
@class WiSeCloudSnoozeSettingRequest;
@class WiSeCheckOutRequest;
@class WiSeSelfAssignResetAPIRequest;

@interface WiSeAlertServices : NSObject

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

// CMS

- (WiSeCloudAPIRequestRegisteredDetails *) setUpdateSnoozeTimeApiWithRequest : (WiSeCloudSnoozeSettingRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) enableDisableCheckOutApiWithRequest : (WiSeCheckOutRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) selfAssignResetApiWithRequest : (WiSeSelfAssignResetAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
