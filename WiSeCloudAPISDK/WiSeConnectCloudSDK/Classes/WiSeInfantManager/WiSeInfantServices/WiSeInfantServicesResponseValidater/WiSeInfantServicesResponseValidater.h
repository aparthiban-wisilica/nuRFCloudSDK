//
//  WiSeInfantServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeInfantServicesResponseValidater : NSObject

+ (id) validateAddInfantResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getAddInfantFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateEditInfantResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getEditInfantFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateDeleteInfantResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getDeleteInfantFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateGetInfantResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getGetInfantFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateInfantTagAssociationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getInfantTagAssociationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateAddRuleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getAddRuleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateEditRuleResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getEditRuleFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateGetInfantFromOrganizationResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getGetInfantFromOrganizationFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateGetArchivedInfantResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getGetArchivedInfantFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

+ (id) validateGetInfantPositionResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;
+ (WiSeAppError *) getGetInfantPositionFailErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode;

@end
