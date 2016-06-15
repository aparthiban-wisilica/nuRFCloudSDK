//
//  WiSeMiniDashBoardServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 06/06/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudMiniDashBoardRequest;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeAPIHeader;

@interface WiSeMiniDashBoardServices : NSObject

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) getUserDashboardApiWithRequest : (WiSeCloudMiniDashBoardRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getHardwareDashboardApiWithRequest : (WiSeCloudMiniDashBoardRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getAssetsDashboardApiWithRequest : (WiSeCloudMiniDashBoardRequest *) request WithHeader : (WiSeAPIHeader *) header;

@end
