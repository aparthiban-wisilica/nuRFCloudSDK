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

/*!
 @class WiSeCloudApiRequest
 
 @brief The core api request
 
 @discussion    This class was designed and implemented to contain api request details.
 
 @superclass SuperClass: NSObject
 
 @classdesign No special design is applied here.
 
 @coclass    WiSeNetworkManager
 */

@interface WiSeCloudApiRequest : NSObject

/*!
 * @brief Request Url e.g http://192.168.1.11/wiseconnect/public/operate.
 */
@property (nonatomic,retain) NSString * strULR;

/*!
 * @brief Request Method e.g POST.
 */
@property (nonatomic,retain) NSString * strHttpMethod;

/*!
 * @brief Request Body Json Object.
 */
@property (nonatomic,retain) id requestBody;

/*!
 * @brief Request Headers.
 */
@property (nonatomic,retain) NSDictionary * dictRequestHeader;

/*!
 * @brief Request Name e.g Login.
 */
@property (nonatomic,retain) NSString * strURLKey;

/*!
 * @brief Request Priority 1 to 10.
 */
@property (nonatomic,assign) WiSeCloudApiRequestPriority  requestPriority;

/*!
 * @brief Request timeout value.
 */
@property (nonatomic,assign) NSInteger  requestTimeout;

/*!
 * @brief WiSeCloudApiRequestDelegate object.
 */
@property (nonatomic,weak) id <WiSeCloudApiRequestDelegate> delegate;

/*!
 * @brief Model request class e.g WiSeLoginAPIRequest.
 */
@property (nonatomic,strong) id modelAPIRequest;

/*!
 * @brief Unique number for each api.
 */
@property (nonatomic,assign) int forAPICall;

/*!
 * @brief Init with Dictionary  Json
 */
- (instancetype) initWiSeApiRequestWithURL : (NSString  *) strULR withHttpMethod : (NSString *) strHttpMethod withHeader : (NSDictionary *) dictRequestHeader withDictionaryRequestBody : (NSDictionary *) requestBody withURLKey : (NSString *) strURLKey withPriority : (WiSeCloudApiRequestPriority ) requestPriority withDelegate : (id<WiSeCloudApiRequestDelegate>) delegate withModelAPIRequest:(id) modelAPIRequest forAPICall : (int) apiName;

/*!
 * @brief Init with Array  Json
 */
- (instancetype) initWiSeApiRequestWithURL : (NSString  *) strULR withHttpMethod : (NSString *) strHttpMethod withHeader : (NSDictionary *) dictRequestHeader withArrayRequestBody : (NSArray *) requestBody withURLKey : (NSString *) strURLKey withPriority : (WiSeCloudApiRequestPriority ) requestPriority withDelegate : (id<WiSeCloudApiRequestDelegate>) delegate withModelAPIRequest:(id) modelAPIRequest forAPICall : (int) apiName;

/*!
 * @brief Init with any type  Json
 */
- (instancetype) initWiSeApiRequestWithURL : (NSString  *) strULR withHttpMethod : (NSString *) strHttpMethod withHeader : (NSDictionary *) dictRequestHeader withRequestBody : (id) requestBody withURLKey : (NSString *) strURLKey withPriority : (WiSeCloudApiRequestPriority ) requestPriority withDelegate : (id<WiSeCloudApiRequestDelegate>) delegate withModelAPIRequest:(id) modelAPIRequest forAPICall : (int) apiName;


@end
