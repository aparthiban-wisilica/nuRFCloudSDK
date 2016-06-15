//
//  WiSeGroupServices.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 28/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//p

#import <Foundation/Foundation.h>
#import "WiSeAPIDefaultDelegate.h"

@class WiSeCloudAPIRequestRegisteredDetails;

@class WiSeCloudGroupAPIRequest;
@class WiSeAPIHeader;

@interface WiSeGroupServices : NSObject 

@property (nonatomic,weak) id <WiSeAPIDefaultDelegate> delegate;

- (WiSeCloudAPIRequestRegisteredDetails *) addGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) editGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) deleteGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) getGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request ;
- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request;

// In future

- (WiSeCloudAPIRequestRegisteredDetails *) addGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;
- (WiSeCloudAPIRequestRegisteredDetails *) editGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;
- (WiSeCloudAPIRequestRegisteredDetails *) deleteGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;
- (WiSeCloudAPIRequestRegisteredDetails *) getGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;
- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request WithHeader : (WiSeAPIHeader *) header;



@end
