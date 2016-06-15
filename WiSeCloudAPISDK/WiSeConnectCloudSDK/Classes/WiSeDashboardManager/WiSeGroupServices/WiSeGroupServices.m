//
//  WiSeGroupServices.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 28/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeGroupServices.h"
#import "WiSeGroupServicesRequestParser.h"
#import "WiSeGroupServicesResponseParser.h"
#import "WiSeGroupServicesResponseValidater.h"

#import "WiSeCloudGroupAPIRequest.h"
#import "WiSeCloudGroupAPIResponse.h"

#import "WiSeNetworkUtil.h"
#import <WiSeNetworkManager/WiSeNetworkManager.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequest.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestRegisteredDetails.h>
#import <WiSeNetworkManager/WiSeCloudAPIRequestDetails.h>

#import <WiSeNetworkManager/WiSeCloudApiRequestDelegate.h>
#import "WiSeAPIHeader.h"
#import "WiSeCloudAPIURLInfo.h"

@interface WiSeGroupServices () <WiSeCloudApiRequestDelegate>


@end


@implementation WiSeGroupServices {
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

# pragma mark --- Add Group ---

- (WiSeCloudAPIRequestRegisteredDetails *) addGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request {
    
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeGroupServicesRequestParser createAddGroupApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddGroup]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddGroupURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddGroup]; // Creating Cloud Request Object
        
        regDetails = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (WiSeCloudAPIRequestRegisteredDetails *) addGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                       = [WiSeGroupServicesRequestParser createAddGroupApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:AddGroup]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:AddGroupURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:AddGroup]; // Creating Cloud Request Object

        regDetails = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (void) addGroupRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    
    id result = [WiSeGroupServicesResponseValidater validateAddGroupResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Register App Response
    if ([result isKindOfClass:[WiSeCloudGroupAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudGroupAPIResponse * response = (WiSeCloudGroupAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeGroupServicesResponseValidater getAddGroupFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:AddGroupErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
    
}

# pragma mark --- Edit Group ---

- (WiSeCloudAPIRequestRegisteredDetails *) editGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams       = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                             = [WiSeGroupServicesRequestParser createEditGroupApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditGroup]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:EditGroupURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditGroup];// Creating Cloud Request Object

        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (WiSeCloudAPIRequestRegisteredDetails *) editGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                       = [WiSeGroupServicesRequestParser createEditGroupApiParameters:request];
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:EditGroup]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_PUT;
        NSString * strURL                         = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                        = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:EditGroupURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:EditGroup];// Creating Cloud Request Object
        
        regDetails                                = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];

    }
    return regDetails;
}

- (void) editGroupRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeGroupServicesResponseValidater validateEditGroupResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Register App Response
    if ([result isKindOfClass:[WiSeCloudGroupAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudGroupAPIResponse * response = (WiSeCloudGroupAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeGroupServicesResponseValidater getEditGroupFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:EditGroupErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }
}

# pragma mark --- Delete Group ---

- (WiSeCloudAPIRequestRegisteredDetails *) deleteGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithUserToken:request.token WithPhoneCloudId:request.phoneCloudId];
        NSArray * arr                       = [WiSeGroupServicesRequestParser createDeleteGroupApiParameters:request];
        NSString * baseURL;
        wiseNetworkManager                  = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        NSString * strURL;
        NSString * strMethod;
        int apiId = 0;
        
        if (request.groupList && request.groupList.count) { // Delete List of Groups
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteGroupInBulk]];
            NSString * baseURL            = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
            strURL                        = [NSString stringWithFormat:@"%@",baseURL];
            apiId                         = DeleteGroupInBulk;
        }else {
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteGroup]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
            NSString * strDeviceId        = [NSString stringWithFormat:@"%d",request.groupCloudId];// Delete A Group
            strURL                        = [NSString stringWithFormat:@"%@%@",baseURL,strDeviceId];
            apiId                         = DeleteGroup;
        }

        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:strMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteGroupURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
        
        regDetails = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (WiSeCloudAPIRequestRegisteredDetails *) deleteGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        NSDictionary * objRequestBodyParams = [WiSeNetworkUtil createHeaderForRequestWithHeader:header];
        NSArray * arr                       = [WiSeGroupServicesRequestParser createDeleteGroupApiParameters:request];
        NSString * baseURL;
        wiseNetworkManager                  = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        NSString * strURL;
        NSString * strMethod;
        int apiId = 0;
        if (request.groupList && request.groupList.count) { // Delete List of Groups
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteGroupInBulk]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_POST;
            strURL                        = [NSString stringWithFormat:@"%@",baseURL];
            apiId                         = DeleteGroupInBulk;
        }else {
            WiSeCloudAPIURLInfo * urlInfo = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:DeleteGroup]];
            baseURL                       = urlInfo.apiURL;
            strMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_DELETE;
            NSString * strDeviceId        = [NSString stringWithFormat:@"%d",request.groupCloudId];// Delete A Group
            strURL                        = [NSString stringWithFormat:@"%@%@",baseURL,strDeviceId];
            apiId                         = DeleteGroup;
            
        }
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:strMethod withHeader:objRequestBodyParams withArrayRequestBody:arr withURLKey:DeleteGroupURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:apiId]; // Creating Cloud Request Object
        
        regDetails = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (void) deleteGroupRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeGroupServicesResponseValidater validateDeleteGroupResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Register App Response
    if ([result isKindOfClass:[WiSeCloudGroupAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudGroupAPIResponse * response = (WiSeCloudGroupAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeGroupServicesResponseValidater getDeleteGroupFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:DeleteGroupErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }

}

# pragma mark --- Get Group ---

- (WiSeCloudAPIRequestRegisteredDetails *) getGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        // Header Params
        NSString * token           = request.token?request.token:@"";
        NSString * strPhoneCloudId = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd          = [NSString stringWithFormat:@"%d",request.limit];
        
        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetGroup]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL  = [NSString stringWithFormat:@"%@",baseURL];
        
        wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetGroupURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetGroup]; // Creating Cloud Request Object
        
        regDetails = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (WiSeCloudAPIRequestRegisteredDetails *) getGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        // Header Params
        
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

        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetGroup]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL  = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetGroupURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetGroup]; // Creating Cloud Request Object
        
        regDetails = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        // Header Params
        NSString * token                           = request.token?request.token:@"";
        NSString * strPhoneCloudId                 = [NSString stringWithFormat:@"%d",request.phoneCloudId];
        NSString * strStart                        = [NSString stringWithFormat:@"%f",request.start];
        NSString * strEnd                          = [NSString stringWithFormat:@"%d",request.limit];

        NSMutableDictionary * objRequestBodyParams = [[NSMutableDictionary alloc] init];
        [objRequestBodyParams setValue:AcceptValue forKey:Accept];
        [objRequestBodyParams setValue:ContentTypeValue forKey:ContentType];
        [objRequestBodyParams setValue:token forKey:TOKEN];
        [objRequestBodyParams setValue:strPhoneCloudId forKey:PHONEID];
        [objRequestBodyParams setValue:strStart forKey:START];
        [objRequestBodyParams setValue:strEnd forKey:LIMIT];

        WiSeCloudAPIURLInfo * urlInfo              = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetArchivedGroup]];
        NSString * baseURL                         = urlInfo.apiURL;
        NSString * httpMethod                      = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        NSString * strURL                          = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager                         = [WiSeNetworkManager sharedWiSeNetworkManager];

        WiSeCloudApiRequest * wiseCloudApiRequest  = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetArchivedGroupURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetArchivedGroup];// Creating Cloud Request Object

        regDetails                                 = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;
}

- (WiSeCloudAPIRequestRegisteredDetails *) getArchivedGroupApiWithRequest : (WiSeCloudGroupAPIRequest *) request WithHeader : (WiSeAPIHeader *) header {
    WiSeCloudAPIRequestRegisteredDetails * regDetails = nil;
    regDetails = [WiSeNetworkUtil isRequestValid:request];
    
    if (!regDetails) { // When Reg is nil , that means request is valid
        
        // Header Params
        
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
        
        WiSeCloudAPIURLInfo * urlInfo             = [WiSeNetworkUtil validateAPIURL:[WiSeNetworkUtil getBaseURLForAPI:GetArchivedGroup]];
        NSString * baseURL                        = urlInfo.apiURL;
        NSString * httpMethod                     = urlInfo.apiHttpMethod?urlInfo.apiHttpMethod:REQUEST_METHOD_GET;
        
        NSString * strURL  = [NSString stringWithFormat:@"%@",baseURL];
        wiseNetworkManager = [WiSeNetworkManager sharedWiSeNetworkManager];
        
        WiSeCloudApiRequest * wiseCloudApiRequest = [[WiSeCloudApiRequest alloc] initWiSeApiRequestWithURL:strURL withHttpMethod:httpMethod withHeader:objRequestBodyParams withArrayRequestBody:nil withURLKey:GetArchivedGroupURLKey withPriority:request.priority withDelegate:self withModelAPIRequest:request forAPICall:GetArchivedGroup]; // Creating Cloud Request Object
        
        regDetails = [wiseNetworkManager callApiWithRequest:wiseCloudApiRequest];
    }
    return regDetails;

}


- (void) getGroupRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    id result = [WiSeGroupServicesResponseValidater validateGetGroupResponse:responseInfo WithRequestDetails:requestInfo]; // Validate Get Group
    if ([result isKindOfClass:[WiSeCloudGroupAPIResponse class ]]) { // When model response class exsit
        
        WiSeCloudGroupAPIResponse * response = (WiSeCloudGroupAPIResponse *) result;
        [self triggerSuccessCallBack:response withRequestDetails:requestInfo]; // Call Success Callback
        
    }else{
        // Check Error what cause fail and call fail callback
        WiSeAppError * error = (WiSeAppError *) result;
        if (error) {
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }else { // Create new error when error is nil
            error = [WiSeGroupServicesResponseValidater getEditGroupFailErrorWithErrorDes:RESPONSE_IS_NIL WithStatusCode:GetGroupErrorCode];
            [self triggerFailCallBack:error withRequestDetails:requestInfo];
        }
    }

}

#pragma mark - Core API Call Back

// Triggered from Network Manager SDK

- (void)apiCallBackWithRequestDetails:(WiSeCloudAPIRequestDetails *)requestInfo WithResponseDetails:(WiSeCloudAPIResponseDetails *)responseInfo {
    switch (requestInfo.apiId) {
        case AddGroup:
            [self addGroupRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case EditGroup:
            [self editGroupRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case DeleteGroup:
        case DeleteGroupInBulk:
            [self deleteGroupRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetGroup:
            [self getGroupRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        case GetArchivedGroup:
            [self getGroupRequestDetails:requestInfo WithResponseDetails:responseInfo];
            break;
        default:
            break;
    }
}


@end
