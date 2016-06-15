//
//  WiSeTagManagerServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeAPIHeader;
@class WiSeCloudTagRequest;

@interface WiSeTagManagerServices : NSObject

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) addTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) addSecureTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteSecureTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) tagCheckApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;


@end
