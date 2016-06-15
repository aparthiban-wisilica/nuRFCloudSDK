//
//  WiSeTagManager.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 19/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeTagManagerDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeAPIHeader;
@class WiSeCloudTagRequest;

@interface WiSeTagManager : NSObject

@property (nonatomic,weak) id <WiSeTagManagerDelegate> delegate;

/*!
 * @brief CMS APIs.
 */

- (WiSeCloudAPIRequestRegisteredDetails *) addTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) editTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) getSecureTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) deleteSecureTagApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;

- (WiSeCloudAPIRequestRegisteredDetails *) tagCheckApiWithRequest : (WiSeCloudTagRequest *) request WithHeader : (WiSeAPIHeader *) header;


@end
