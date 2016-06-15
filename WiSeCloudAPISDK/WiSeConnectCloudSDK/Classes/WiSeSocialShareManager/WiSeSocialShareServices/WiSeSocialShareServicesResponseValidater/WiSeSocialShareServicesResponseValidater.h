//
//  WiSeSocialShareServicesResponseValidater.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 09/03/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WiSeCloudAPIResponseDetails;
@class WiSeCloudAPIRequestDetails;
@class WiSeAppError;

@interface WiSeSocialShareServicesResponseValidater : NSObject

+ (id ) validateAddFriendsResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getAddFriendsFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateGetFriendsResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetFriendsFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateDeleteFriendsResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getDeleteFriendsFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateAcceptOrRejectFriendRequestResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getAcceptOrRejectFriendRequestFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateGetSharedDevicesResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetSharedDevicesFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateGetSharedGroupsResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getGetSharedGroupsFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateAcceptOrRejectShareRequestResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getAcceptOrRejectShareRequestFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


+ (id ) validateCreateShareResponse : (WiSeCloudAPIResponseDetails *) responseInfo WithRequestDetails : (WiSeCloudAPIRequestDetails *) requestInfo;

+ (WiSeAppError *) getCreateShareFailedErrorWithErrorDes : (NSString *) errDes WithStatusCode : (int) statusCode ;


@end
