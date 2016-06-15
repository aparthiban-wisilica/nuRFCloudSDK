//
//  WiSeNetworkUtil.m
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 16/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeCloudApiRequest.h>
#import "KeychainUserPass.h"
#import "WiSeParsedAPIResponse.h"
#import <WiSeAppLog/WiSeLogManager.h>
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>
#import "WiSeCloudApiResponse.h"
#import "WiSeCloudSDKInitializer.h"
#import "WiSeAPIHeader.h"
#import "WiSeCloudAPIURLInfo.h"
#import "WiSeNetworkConstants.h"

@implementation WiSeNetworkUtil

// Validate Request Headers : not used now
+ (BOOL) validateRequestHeaders : (NSDictionary *)dictHeader {
    
    NSArray * arrRequestHeaders = [[NSArray alloc] initWithObjects:@"Accept",@"Accept-Charset",@"Accept-Encoding",@"Accept-Language",@"Accept-Datetime",@"Authorization",@"Cache-Control",@"Connection",@"Cookie",@"Content-Length",@"Content-MD5",@"Content-Type",@"Date",@"Expect",@"From",@"Host",@"If-Match",@"If-Modified-Since",@"If-None-Match",@"If-Range",@"If-Unmodified-Since",@"Max-Forwards",@"Origin",@"Pragma",@"Proxy-Authorization",@"Range",@"Referer",@"TE",@"User-Agent",@"Upgrade",@"Via",@"Warning", nil];
    
    BOOL isKeyExsit             = NO;
    
    for (NSString * strKey in dictHeader) {
        isKeyExsit                  = [arrRequestHeaders containsObject:strKey];
        if (isKeyExsit == NO) break;
    }
    return isKeyExsit;
}

// Create SHA 512 Encrypted String
+(NSString *) createSHA512:(NSString *)source
{
    @try {
        const char *s = [source cStringUsingEncoding:NSUTF8StringEncoding];
        
        if(s) {
            
            NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];
            uint8_t digest[64] = {0};
            
            CC_SHA512(keyData.bytes, (int)keyData.length, digest);
            
            NSData *out = [NSData dataWithBytes:digest length:64];
            
            return [out description];
        } else {
            NSLog(@"Could not create sha algorithm. Password contains invalid charectors.");
            return nil;
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Could not create sha algorithm. Password contains invalid charectors. %@",exception.debugDescription);
    }
    return nil;
}

// Create Default Header
+(NSDictionary *)createHeaderForRequest{
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    
    return  objRequestBodyParams;
}

// Create Default Header with UserToken
+(NSDictionary *) createHeaderForRequestWithUserToken : (NSString *) userToken {
    
    userToken = userToken?userToken:@"";
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    [objRequestBodyParams setValue:userToken forKey:TOKEN];
    
    return  objRequestBodyParams;
}


// Create Default Header with UserToken and PhoneCloudId
+(NSDictionary *) createHeaderForRequestWithUserToken : (NSString *) userToken WithPhoneCloudId : (int) phoneCloudId{
    
    userToken = userToken?userToken:@"";
    NSString * strPhoneCloudId = [NSString stringWithFormat:@"%d",phoneCloudId];
    
    NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
    [objRequestBodyParams setValue:AcceptValue forKey:Accept];
    [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
    [objRequestBodyParams setValue:userToken forKey:TOKEN];
    [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
    
    return  objRequestBodyParams;
}

// Create Default Header with Header Values
+(NSDictionary *)createHeaderForRequestWithHeader : (WiSeAPIHeader *) header {
    
    NSMutableDictionary * objRequestBodyParams = nil;
    
    if (header) {
        header.userToken            = header.userToken?header.userToken:@"";
        header.acceptValue          = header.acceptValue?header.acceptValue:AcceptValue;
        header.contentTypeValue     = header.contentTypeValue?header.contentTypeValue:ContentTypeValue;
        NSString * strPhoneCloudId  = [NSString stringWithFormat:@"%d",header.phoneCloudId];
        NSString * strOrgCloudId    = [NSString stringWithFormat:@"%d",header.organizationId];
        NSString * strSubOrgCloudId = [NSString stringWithFormat:@"%d",header.subOrganizationId];

        objRequestBodyParams        = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:header.acceptValue forKey:Accept];
        [objRequestBodyParams setValue:header.contentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:header.userToken forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strOrgCloudId forKey:ORG_ID];
        [objRequestBodyParams setValue:strSubOrgCloudId forKey:SUB_ORG_ID];
    }
    
    return objRequestBodyParams;
}

// Create Error
+ (WiSeAppError *) getErrorWithDomainName : (NSString *) domainName withErrorDescription : (NSString *) errorDescription withDomainCode : (WiSeAPIDomainErrorCode) code {
    errorDescription              = errorDescription?errorDescription:@"";
    NSMutableDictionary * details = [NSMutableDictionary dictionary];
    [details setValue:[NSString stringWithFormat:@"%@",errorDescription] forKey:NSLocalizedDescriptionKey];
    WiSeAppError *error           = [[WiSeAppError alloc] initWithDomain:domainName code:code userInfo:details];
    return error;
}

// Convert Base 64 String To Data
+ (NSData*)convertBase64StringToDataWithString:(NSString *)base64String
{
    base64String = base64String?base64String:@"";
    
    NSData *decodedData  = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
    if(decodedData != nil)
    {
        return decodedData;
    }
    
    return nil;
}

// Convert Base 64 String to Short Id
+ (NSInteger)convertBase64StringToMeshIdWithString:(NSString *)base64String {
    
    base64String = base64String?base64String:@"";
    
    NSData *decodedMeshID = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
    const uint8_t *decodedID = [decodedMeshID bytes];
    if(decodedID != nil)
    {
        return decodedID[0];
    }
    
    return 0;
}

// Convert ShortI to Base 64 String
+ (NSString *) convertMeshIdToBase64StringWithMeshId : (NSInteger) MeshId {
    
    if (MeshId) {
        const uint8_t shortId = MeshId;
        NSData * dataa = [[NSData alloc] initWithBytes:&shortId length:sizeof(shortId)];
        NSString * str64 = [dataa base64EncodedStringWithOptions:0];
        return str64;
    }
    
    return @"";
}


// Get date in the following format :  2015-11-25 14:32:41
+ (NSDate *) getFormattedDateFromString : (NSString *) strDate {
    
    strDate = strDate?strDate:@"";
    
    if (strDate != (NSString *) [NSNull null]) {
        
        NSDateFormatter *dtFrmt = [[NSDateFormatter alloc] init];
        [dtFrmt setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [dtFrmt setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
        NSDate * date = [dtFrmt dateFromString:strDate];
        return date;
        
    }
    
    return nil;
}

// Convert String to Base 64 String
+ (NSString *) convertStringToBase64StringWithString : (NSString *) string{
    string                 = string?string:@"";
    NSData *encodeData     = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [encodeData base64EncodedStringWithOptions:0];
    return base64String;
}


+ (NSString *) convertDataToBase64StringWithData : (NSData *) data
{
    NSString *base64String = @"";
    if (data) {
        base64String = [data base64EncodedStringWithOptions:0];
    }
    
    return base64String;
}


// Convert Base64 String to String
+ (NSString *) convertBase64StringToStringWithBase64String : (NSString *) base64String {
    base64String            = base64String?base64String:@"";
    NSData *decodedData     = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    return decodedString;
}

// Check for Null Values

+ (id) replaceNullValues : (id) object {
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary * dict           = (NSDictionary *) object;
        NSMutableDictionary * mutDict = [[NSMutableDictionary alloc] init];
        
        for (NSString * key in [dict allKeys]) {
            id value = [dict objectForKey:key];
            if (value == [NSNull null]) {
                [mutDict setObject:@"" forKey:key];
            }else {
                [mutDict setObject:value forKey:key];
            }
        }
        return mutDict;
    }else if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray * mutArray = [[NSMutableArray alloc] init];
        for (id value in object) {
            if (value != [NSNull null]) {
                [mutArray addObject:value];
            }
        }
        return mutArray;
    }else {
        
        if (object == [NSNull null]) {
            return nil;
        }
        
    }
    
    return object;
}

// Check for Null in Response Dictionary
+ (NSDictionary *) checkForNullInResponse : (NSDictionary *) dictResponse {
    if ([self isDictionaryValid:dictResponse]) {
        NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];

        NSDictionary * dictStatus  = [[dictResponse objectForKey:RESPONSE] objectForKey:STATUS];
        dictStatus                 = [self replaceNullValues:dictStatus];
        if (dictStatus && [dictStatus isKindOfClass:[NSDictionary class]]) {
            [dict setObject:dictStatus forKey:STATUS];
        }
        
        id dataValue = [[dictResponse objectForKey:RESPONSE] objectForKey:DATA];
        
        if (dataValue) {
            if ([dataValue isKindOfClass:[NSDictionary class]]) {
                NSDictionary * dictData = dataValue;
                dictData = [self replaceNullValues:dictData];
                if (dictData && [dictData isKindOfClass:[NSDictionary class]]) {
                    [dict setObject:dictData forKey:DATA];
                }
            }else if ([dataValue isKindOfClass:[NSArray class]]) {
                NSArray * arrData = dataValue;
                arrData = [self replaceNullValues:arrData];
                if (arrData && [arrData isKindOfClass:[NSArray class]]) {
                    if (arrData.count) {
                        [dict setObject:arrData forKey:DATA];
                    }
                }
            }
        }
        
        NSDictionary * dict1 = [[NSDictionary alloc] initWithDictionary:dict];
        return dict1;
        
    }else {
        return nil;
    }
}

// Converting Milli Seconds to Date
+ (NSDate *) convertMillisencondsToDate : (NSString *) millisenconds {
    millisenconds                   = millisenconds?millisenconds:@"";
    double seconds                  = [millisenconds doubleValue];
    NSDate *date                    = [NSDate dateWithTimeIntervalSince1970:seconds];

    NSDateFormatter *dateFormatter  = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat        = @"yyyy-MM-dd HH:mm:ss";
    NSTimeZone* destinationTimeZone = [NSTimeZone systemTimeZone];
    [dateFormatter setTimeZone:destinationTimeZone];

    NSString *strDate               = [dateFormatter stringFromDate:date];

    date                            = [dateFormatter dateFromString:strDate];
    
    return date;
}

// Validating Dictionary
+ (BOOL) isDictionaryValid : (NSDictionary *) dict {
    if (dict && ( [dict isMemberOfClass:[NSDictionary class]] || [dict isKindOfClass:[NSDictionary class]] )) {
        return YES;
    }
    return NO;
}

// Validating Array
+ (BOOL) isArrayValid : (NSArray *) array {
    
    if (array && ([array isMemberOfClass:[NSArray class]] || [array isKindOfClass:[NSArray class]] )) {
        if (array.count) {
            return YES;
        }
    }
    return NO;
}

// Parse Json Data to valide response and error if any
+ (WiSeParsedAPIResponse *) parseJsonDataWith : (NSData *) jsonData {
    WiSeParsedAPIResponse * response = nil;
    if (jsonData) {
        NSError * jsonError;
        
        id jResponse          = [NSJSONSerialization JSONObjectWithData :jsonData
                                                                 options:kNilOptions error:&jsonError];
        
        response              = [WiSeParsedAPIResponse new];
        response.responseData = jResponse;
        response.error        = (WiSeAppError *) jsonError;
        
        if ([WiSeNetworkUtil isResponseFromIISServer:jResponse]) {
            response.responseData = [WiSeNetworkUtil getValideResponse:jResponse];
        }
    }
    return response;
}

+ (BOOL) isResponseFromIISServer : (id) response {
    BOOL isThereD = NO;
    if (response) {
        NSDictionary * dict = (NSDictionary*) response;
        dict = [WiSeNetworkUtil replaceNullValues:dict];
        if ([WiSeNetworkUtil isDictionaryValid:dict]) {
            
            if ([dict objectForKey:@"d"]) {
                isThereD = YES;
            }
        }
    }
    return isThereD;
}

+ (id) getValideResponse : (id) responseData {
    id modifiedResponse = nil;
    
    if (responseData) {
        NSDictionary * dict = (NSDictionary *) responseData;
        dict = [WiSeNetworkUtil replaceNullValues:dict];
        if ([WiSeNetworkUtil isDictionaryValid:dict]) {
            NSString * jsonData = [dict objectForKey:@"d"];
            if (jsonData && ![jsonData isEqualToString:@""]) {
                jsonData = [jsonData stringByReplacingOccurrencesOfString:@"\\" withString:@""];
                WiSeParsedAPIResponse * temp = [WiSeNetworkUtil parseJsonDataWith:[jsonData dataUsingEncoding:NSUTF8StringEncoding]];
                modifiedResponse = temp.responseData;
                
            }
        }

    }
    
    return modifiedResponse;
}

// Parsing the Response Details
+ (id) parseAPIResponse : (WiSeCloudAPIResponseDetails *) responseInfo {
    id result = nil;
    
    if (responseInfo) { // Checking Response Info
        
        if (responseInfo.responseData) {
            WiSeParsedAPIResponse * response = [WiSeNetworkUtil parseJsonDataWith:responseInfo.responseData];
            if (response.responseData) { // Checking response data
                
                if ([response.responseData isKindOfClass:[NSDictionary class]]) { // Checking Dictionary Response
                    
                    NSDictionary * dict = (NSDictionary *) response.responseData;
                    dict                = [self checkForNullInResponse:dict];// Get only Status and Data from Dict
                    result              = [self isDictionaryValid:dict]?dict:nil;
                    
                }else if ([response.responseData isKindOfClass:[NSArray class]]) { // Checking Array Response
                    
                    NSArray * arr       = (NSArray *) response.responseData;
                    result              = [self isArrayValid:arr]?arr:nil;
                    
                }else {
                    result              = nil;
                }
                
            }else if (response.error) { // Checking for any error
                result = response.error;
            }else {
                result = nil;
            }
        }else if(responseInfo.error) {  // Checking error in response
            result = responseInfo.error;
        }
    }
    return result;
}

// Validating request class by checking whether it is nil or not
+ (WiSeCloudAPIRequestRegisteredDetails *) isRequestValid : (id) request{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    if (!request) { // Pass Register Fail Object
        regDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
    }
    return regDetails;
}

// Get Common WiSeCloudApiResponse obj from Status Object of Response
+ (WiSeCloudApiResponse *) getCloudAPIResponseFromStatusDict : (NSDictionary *) dictStatus WithResponseInfo : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeCloudApiResponse * response = nil;
    if ([self isDictionaryValid:dictStatus]) {
        response                       = [WiSeCloudApiResponse new];
        response.statusMessage         = [WiSeNetworkUtil getValidStringFromObject:[dictStatus objectForKey:STATUS_MESSAGE]];
        response.apiId                 = [[dictStatus objectForKey:API_ID] intValue];
        response.startTime             = [self convertMillisencondsToDate:[dictStatus objectForKey:STARTTIME]];
        response.endTime               = [self convertMillisencondsToDate:[dictStatus objectForKey:ENDTIME]];
        response.executionTime         = responseInfo.executionTime;
        response.urlResponseStatusCode = responseInfo.statusCode;
    }
    return response;
}

// Getting proper error message from any exsiting error
+ (NSString *) getValidErrorMessageFromError : (id) result AndResponseInfo : (WiSeCloudAPIResponseDetails *) responseInfo {
    WiSeAppError * error = (WiSeAppError *) result;
    NSString * strErrorDes = nil;
    if (responseInfo.error) {
        strErrorDes = responseInfo.error.localizedDescription;
    }else if (error) {
        strErrorDes = error.localizedDescription;
    }
    else {
        strErrorDes = RESPONSE_IS_NIL;
    }
    return strErrorDes;
}

// Get Base URL from User End
+ (NSString *) getBaseURL {
    NSString * str;
    id <WiSeCloudSDKinitializerDelegate> initializer = [WiSeCloudSDKInitializer sharedWiSeCloudSDKInitializer];
    if (initializer && [initializer respondsToSelector:@selector(getBaseURL)]) {
        str = [initializer getBaseURL];
    }
    return str;
}

+ (WiSeCloudAPIURLInfo *) getBaseURLForAPI : (WiSeAPICall) apiName {
    
    WiSeCloudAPIURLInfo * urlInfo = nil;
    
    id <WiSeCloudSDKinitializerDelegate> initializer = [WiSeCloudSDKInitializer sharedWiSeCloudSDKInitializer];
    if (initializer && [initializer respondsToSelector:@selector(getURLInfoForAPI:)]) {
        urlInfo = [initializer getURLInfoForAPI:apiName];
    }
    return urlInfo;
}

+ (WiSeCloudAPIURLInfo *) validateAPIURL : (WiSeCloudAPIURLInfo *) urlInfo{
    if (urlInfo) {
        urlInfo.apiURL        = urlInfo.apiURL?urlInfo.apiURL:@"";
        urlInfo.apiHttpMethod = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:nil;
    }else {
        urlInfo               = [WiSeCloudAPIURLInfo new];
        urlInfo.apiURL        = @"";
        urlInfo.apiHttpMethod = nil;
    }
    return urlInfo;
}

// Get Valide String From Object
+ (NSString *) getValidStringFromObject : (id) obj {
    NSString * validString = @"";
    if ([obj isKindOfClass:[NSString class]]) {
        validString = obj;
    }else {
        if ([obj respondsToSelector:@selector(stringValue)]) {
            validString = [obj stringValue];
        }
    }
    return validString;
}


/* Returns hexadecimal string of NSData. Empty string if data is empty.   */
+ (NSString *)hexadecimalStringFromNsData:(NSData*)data {
    
    const unsigned char *dataBuffer = (const unsigned char *)[data bytes];
    
    if (!dataBuffer)
        return [NSString string];
    
    NSUInteger          dataLength  = [data length];
    NSMutableString     *hexString  = [NSMutableString stringWithCapacity:(dataLength * 2)];
    
    for (int i = 0; i < dataLength; ++i)
        [hexString appendString:[NSString stringWithFormat:@"%02lX", (unsigned long)dataBuffer[i]]];
    
    return [NSString stringWithString:hexString];
}

// Convert String To Hexa Value

+(NSMutableData *) convertStringToHexa:(NSString *) strToBeConverted{
    NSMutableData *textval = [[NSMutableData alloc] init];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < (strToBeConverted.length)/2; i++) {
        byte_chars[0] = [strToBeConverted characterAtIndex:i*2];
        byte_chars[1] = [strToBeConverted  characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [textval appendBytes:&whole_byte length:1];
    }
    return textval;
}


@end
