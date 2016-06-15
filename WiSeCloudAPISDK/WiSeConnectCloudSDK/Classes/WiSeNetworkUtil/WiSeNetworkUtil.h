//
//  WiSeNetworkUtil.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 16/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>
#import "WiSeNetworkConstants.h"
#include<unistd.h>
#include<netdb.h>
#import <WiSeNetworkManager/WiSeAppError.h>

@class WiSeCloudApiRequest;
@class WiSeParsedAPIResponse;
@class WiSeCloudAPIRequestRegisteredDetails;
@class WiSeCloudAPIResponseDetails;
@class WiSeCloudApiResponse;
@class WiSeAPIHeader;
@class WiSeCloudAPIURLInfo;

@interface WiSeNetworkUtil : NSObject

// Validate Request Headers : not used now
+ (BOOL) validateRequestHeaders : (NSDictionary *)dictHeader;

// Create SHA 512 Encrypted String
+(NSString *) createSHA512:(NSString *)source;

// Create Default Header
+(NSDictionary *)createHeaderForRequest;

// Create Default Header with UserToken
+(NSDictionary *) createHeaderForRequestWithUserToken : (NSString *) userToken;

// Create Default Header with UserToken and PhoneCloudId
+(NSDictionary *) createHeaderForRequestWithUserToken : (NSString *) userToken WithPhoneCloudId : (int) phoneCloudId;

// Create Default Header with Header Values
+(NSDictionary *)createHeaderForRequestWithHeader : (WiSeAPIHeader *) header;

// Create Error
+ (WiSeAppError *) getErrorWithDomainName : (NSString *) domainName withErrorDescription : (NSString *) errorDescription withDomainCode : (WiSeAPIDomainErrorCode) code;

// Convert Base 64 String To Data
+ (NSInteger) convertBase64StringToMeshIdWithString : (NSString *) base64String;

+ (NSString *) convertMeshIdToBase64StringWithMeshId : (NSInteger) shortId;

// Get date in the following format :  2015-11-25 14:32:41
+ (NSDate *) getFormattedDateFromString : (NSString *) strDate;

// Convert String to Base 64 String
+ (NSString *) convertStringToBase64StringWithString : (NSString *) string;

// Convert Base64 String to String
+ (NSString *) convertBase64StringToStringWithBase64String : (NSString *) base64String;

// Check for Null Values
+ (id) replaceNullValues : (id) object;

// Convert Base 64 String To Data
+ (NSData *)convertBase64StringToDataWithString:(NSString *)base64String;

+ (NSString *) convertDataToBase64StringWithData : (NSData *) data;

// Check for Null in Response Dictionary
+ (NSDictionary *) checkForNullInResponse : (NSDictionary *) dictResponse;

// Converting Milli Seconds to Date
+ (NSDate *) convertMillisencondsToDate : (NSString *) millisenconds;

// Validating Dictionary
+ (BOOL) isDictionaryValid : (NSDictionary *) dict;

// Validating Array
+ (BOOL) isArrayValid : (NSArray *) array;

// Parse Json Data to valide response and error if any
+ (WiSeParsedAPIResponse *) parseJsonDataWith : (NSData *) jsonData;

+ (BOOL) isResponseFromIISServer : (id) response;

+ (id) getValideResponse : (id) responseData;

// Parsing the Response Details
+ (id) parseAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo;

// Validating request class by checking whether it is nil or not
+ (WiSeCloudAPIRequestRegisteredDetails *) isRequestValid : (id) request;

// Get Common WiSeCloudApiResponse obj from Status Object of Response
+ (WiSeCloudApiResponse *) getCloudAPIResponseFromStatusDict : (NSDictionary *) dictStatus WithResponseInfo : (WiSeCloudAPIResponseDetails *) responseInfo;

// Getting proper error message from any exsiting error
+ (NSString *) getValidErrorMessageFromError : (id) result AndResponseInfo : (WiSeCloudAPIResponseDetails *) responseInfo;

// Get Base URL from User End
+ (NSString *) getBaseURL;

+ (WiSeCloudAPIURLInfo *) getBaseURLForAPI : (WiSeAPICall) apiName;

+ (WiSeCloudAPIURLInfo *) validateAPIURL : (WiSeCloudAPIURLInfo *) urlInfo;

// Get Valide String From Object
+ (NSString *) getValidStringFromObject : (id) obj;

/* Returns hexadecimal string of NSData. Empty string if data is empty.   */
+ (NSString *)hexadecimalStringFromNsData:(NSData*)data;

// Convert String To Hexa Value
+(NSMutableData *) convertStringToHexa:(NSString *) strToBeConverted;


@end
