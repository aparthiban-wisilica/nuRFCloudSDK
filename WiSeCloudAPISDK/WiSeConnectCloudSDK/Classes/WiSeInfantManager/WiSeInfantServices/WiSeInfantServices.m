//
//  WiSeInfantServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeInfantServices.h"
#import "WiSeInfantServicesRequestParser.h"
#import "WiSeInfantServicesResponseParser.h"
#import "WiSeInfantServicesResponseValidater.h"

#import "WiSeCloudInfantRequest.h"
#import "WiSeCloudInfantResponse.h"

#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>
#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import <WiSeNetworkManager/WiSeCloudAPIResponseDetails.h>
#import "WiSeAPIHeader.h"
#import "WiSeCloudAPIURLInfo.h"

@interface WiSeInfantServices () <WiSeCloudApiRequestDelegate>

@end

@implementation WiSeInfantServices {
    WiSeNetworkManager * wiseNetworkManager;
}

# pragma mark --- Trigger Call back ---

- (void) triggerSuccessCallBack : (id) response withRequestDetails : (WiSeCloudAPIRequestDetails *)requestInfo{
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiCallIsSuccessfulWithResponse:WithRequestDetails:)]) {
        [self.delegate apiCallIsSuccessfulWithResponse:response WithRequestDetails:requestInfo];
    }
}

- (void) triggerFailCallBack : (WiSeAppError *) error withRequestDetails : (WiSeCloudAPIRequestDetails *)requestInfo{
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiCallIsFailedWithError:WithRequestDetails:)]) {
        [self.delegate apiCallIsFailedWithError:error WithRequestDetails:requestInfo];
    }
}

# pragma mark --- Add Infant ---

- (WiSeCloudAPIRequestRegisteredDetails *) addInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeInfantServicesRequestParser createAddInfantApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddInfant]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddInfantURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddInfant]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) addInfantRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeInfantServicesResponseValidater validateAddInfantResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudInfantResponse class ]]) { // When model response class exsit
        
        WiSeCloudInfantResponse * response = (WiSeCloudInfantResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeInfantServicesResponseValidater getAddInfantFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddInfantErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


# pragma mark --- Edit Infant ---

- (WiSeCloudAPIRequestRegisteredDetails *) editInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeInfantServicesRequestParser createEditInfantApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditInfant]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:EditInfantURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditInfant]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) editInfantRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeInfantServicesResponseValidater validateEditInfantResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudInfantResponse class ]]) { // When model response class exsit
        
        WiSeCloudInfantResponse * response = (WiSeCloudInfantResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeInfantServicesResponseValidater getEditInfantFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditInfantErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}



# pragma mark --- Delete Infant ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeInfantServicesRequestParser createDeleteInfantApiParameters:request];
        NSString * baseURL;
        NSString * strURL;
        NSString * strMethod;
        int apiId = 0;
        if (request.infantList && request.infantList.count) { // Delete List of Infants
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteInfantInBulk]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
            strURL                        = [NSString stringWithFormat:@"%@",baseURL];
            apiId                         = DeleteInfantInBulk;
        }else {
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteInfant]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
            NSString * strInfantId        = [NSString stringWithFormat:@"%d",request.infantCloudId];// Delete An Infant
            strURL                        = [NSString stringWithFormat:@"%@%@",baseURL,strInfantId];
            apiId                         = DeleteInfant;
        }

        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:strMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteInfantURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) deleteInfantRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeInfantServicesResponseValidater validateDeleteInfantResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudInfantResponse class ]]) { // When model response class exsit
        
        WiSeCloudInfantResponse * response = (WiSeCloudInfantResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeInfantServicesResponseValidater getDeleteInfantFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteInfantErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}


# pragma mark --- Get Infant ---

- (WiSeCloudAPIRequestRegisteredDetails*) getInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        
        NSString * baseURL;
        
        NSString * strURL;
        
        NSString * httpMethod;

        int apiId = 0;
        if (!request.infantCloudId) { // Get Infants
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetInfant]];
            baseURL                       = urlInfo.apiURL;
            strURL                        = [NSString stringWithFormat:@"%@",baseURL];
            apiId                         = GetInfant;
            httpMethod                    = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        }else {
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetAInfant]];
            baseURL                       = urlInfo.apiURL;
            NSString * strOrgId           = [NSString stringWithFormat:@"%d",request.infantCloudId];// Get An Infant
            strURL                        = [NSString stringWithFormat:@"%@%@",baseURL,strOrgId];
            apiId                         = GetAInfant;
            httpMethod                    = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        }

        NSString * queryParams                    = [NSString stringWithFormat:@"?orgId=%d&chkout=%d&tagassign=%d&discharge=%d&start=%f&limit=%d",header.subOrganizationId,request.checkoutStatus,request.tagAssignStatus,request.dischargeStatus,request.start,request.limit];

        strURL                                    = [strURL stringByAppendingString:queryParams];

        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetInfantURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getInfantRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeInfantServicesResponseValidater validateGetInfantResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudInfantResponse class ]]) { // When model response class exsit
        
        WiSeCloudInfantResponse * response = (WiSeCloudInfantResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeInfantServicesResponseValidater getGetInfantFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetInfantErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Get Archived Infant ---

- (WiSeCloudAPIRequestRegisteredDetails*) getArchivedInfantApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];

        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetArchivedInfant]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;

        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];

        NSString * queryParams                    = [NSString stringWithFormat:@"?start=%f&limit=%d",request.start,request.limit];

        strURL                                    = [strURL stringByAppendingString:queryParams];

        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetArchivedInfantURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetArchivedInfant];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getArchivedInfantRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeInfantServicesResponseValidater validateGetArchivedInfantResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudInfantResponse class ]]) { // When model response class exsit
        
        WiSeCloudInfantResponse * response = (WiSeCloudInfantResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeInfantServicesResponseValidater getGetArchivedInfantFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetArchivedInfantErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Get Infants From Organizations ---

- (WiSeCloudAPIRequestRegisteredDetails *) getInfantsFromOrganizationsApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header{
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        NSMutableDictionary * objRequestBodyParams = nil;
        
        if (header) {
            header.userToken           = header.userToken?header.userToken:@"";
            header.acceptValue         = header.acceptValue?header.acceptValue:AcceptValue;
            header.contentTypeValue    = header.contentTypeValue?header.contentTypeValue:ContentTypeValue;
            NSString * strPhoneCloudId = [NSString stringWithFormat:@"%d",header.phoneCloudId];
            NSString * strOrgCloudId   = [NSString stringWithFormat:@"%d",header.organizationId];
            NSString * strStart        = [NSString stringWithFormat:@"%f",request.start];
            NSString * strEnd          = [NSString stringWithFormat:@"%d",request.limit];
            
            objRequestBodyParams       = [[NSMutableDictionary alloc] init];
            [objRequestBodyParams setValue:header.acceptValue forKey:Accept];
            [objRequestBodyParams setValue:header.contentTypeValue forKey:ContentType];
            [objRequestBodyParams setValue:header.userToken forKey:TOKEN];
            [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
            [objRequestBodyParams setValue:strOrgCloudId forKey:ORG_ID];
            [objRequestBodyParams setValue:strStart forKey:START];
            [objRequestBodyParams setValue:strEnd forKey:LIMIT];
        }
        
        NSArray * arrJson                         = [WiSeInfantServicesRequestParser createGetInfantFromOrganizationApiParameters:request];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetInfantsFromOrganizations]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arrJson withURLKey:GetInfantFromOrganizationsURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetInfantsFromOrganizations]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getInfantFromOrganizationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeInfantServicesResponseValidater validateGetInfantFromOrganizationResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudInfantResponse class ]]) { // When model response class exsit
        
        WiSeCloudInfantResponse * response = (WiSeCloudInfantResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeInfantServicesResponseValidater getGetInfantFromOrganizationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetInfantsFromOrganizationsErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Infant Tag Assocation ---

- (WiSeCloudAPIRequestRegisteredDetails*) infantTagAssociationApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeInfantServicesRequestParser createInfantTagAssociationApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:InfantTagAssociation]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:InfantTagAssociationURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:InfantTagAssociation]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) infantTagAssociationRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeInfantServicesResponseValidater validateInfantTagAssociationResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudInfantResponse class ]]) { // When model response class exsit
        
        WiSeCloudInfantResponse * response = (WiSeCloudInfantResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeInfantServicesResponseValidater getInfantTagAssociationFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:InfantTagAssociationErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Add Rule ---

- (WiSeCloudAPIRequestRegisteredDetails*) addRuleApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeInfantServicesRequestParser createAddInfantApiParameters:request];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddRule]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddRuleURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddRule]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) addRuleRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeInfantServicesResponseValidater validateAddRuleResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudInfantResponse class ]]) { // When model response class exsit
        
        WiSeCloudInfantResponse * response = (WiSeCloudInfantResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeInfantServicesResponseValidater getAddRuleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddRuleErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Edit Rule ---

- (WiSeCloudAPIRequestRegisteredDetails*) editRuleApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = [WiSeInfantServicesRequestParser createAddInfantApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditRule]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:EditRuleURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditRule]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) editRuleRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeInfantServicesResponseValidater validateEditRuleResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudInfantResponse class ]]) { // When model response class exsit
        
        WiSeCloudInfantResponse * response = (WiSeCloudInfantResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeInfantServicesResponseValidater getEditRuleFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditRuleErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Get Infant Position ---

- (WiSeCloudAPIRequestRegisteredDetails*) getInfantPositionApiWithRequest : (WiSeCloudInfantRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails                                        = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                             = nil;
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetInfantPosition]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                         = [NSString stringWithFormat:@"%@%d",baseURL,request.infantCloudId];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:GetInfantPositionURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetInfantPosition]; // Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) getInfantPositionRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeInfantServicesResponseValidater validateGetInfantPositionResponse:responseInfo WithRequestDetails:requestInfo];
    if ([result isKindOfClass:[WiSeCloudInfantResponse class ]]) { // When model response class exsit
        
        WiSeCloudInfantResponse * response = (WiSeCloudInfantResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeInfantServicesResponseValidater getGetInfantPositionFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetInfantPositionErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case AddInfant:
            [self addInfantRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case EditInfant:
            [self editInfantRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteInfant:
        case DeleteInfantInBulk:
            [self deleteInfantRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetInfant:
        case GetAInfant:
            [self getInfantRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case InfantTagAssociation:
            [self infantTagAssociationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case AddRule:
            [self addRuleRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case EditRule:
            [self editRuleRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetInfantsFromOrganizations:
            [self getInfantFromOrganizationRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetArchivedInfant:
            [self getArchivedInfantRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetInfantPosition:
            [self getInfantPositionRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}


@end
