//
//  WiSeRequestManager.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 16/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeCloudApiRequestDelegate.h"
#import "WiSeCoreNetworkConstants.h"

@interface WiSeCloudApiRequest : NSObject

@property (nonatomic,retain) NSString * strULR;
@property (nonatomic,retain) NSString * strHttpMethod;
@property (nonatomic,retain) id requestBody;
@property (nonatomic,retain) NSDictionary * dictRequestHeader;
@property (nonatomic,retain) NSString * strURLKey;
@property (nonatomic,assign) WiSeCloudApiRequestPriority  requestPriority;
@property (nonatomic,assign) NSInteger  requestTimeout;
@property (nonatomic,weak) id <WiSeCloudApiRequestDelegate> delegate;
@property (nonatomic,strong) id modelAPIRequest;
@property (nonatomic,assign) int forAPICall;


// Init with Dictionary  Json
- (instancetype) initWiSeApiRequestWithURL : (NSString  *) strULR withHttpMethod : (NSString *) strHttpMethod withHeader : (NSDictionary *) dictRequestHeader withDictionaryRequestBody : (NSDictionary *) requestBody withURLKey : (NSString *) strURLKey withPriority : (WiSeCloudApiRequestPriority ) requestPriority withDelegate : (id<WiSeCloudApiRequestDelegate>) delegate withModelAPIRequest:(id) modelAPIRequest forAPICall : (int) apiName;

// Init with Array  Json
- (instancetype) initWiSeApiRequestWithURL : (NSString  *) strULR withHttpMethod : (NSString *) strHttpMethod withHeader : (NSDictionary *) dictRequestHeader withArrayRequestBody : (NSArray *) requestBody withURLKey : (NSString *) strURLKey withPriority : (WiSeCloudApiRequestPriority ) requestPriority withDelegate : (id<WiSeCloudApiRequestDelegate>) delegate withModelAPIRequest:(id) modelAPIRequest forAPICall : (int) apiName;


@end
