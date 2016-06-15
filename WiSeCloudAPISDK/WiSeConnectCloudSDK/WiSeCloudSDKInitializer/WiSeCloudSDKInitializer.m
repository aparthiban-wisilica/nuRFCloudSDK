//
//  WiSeCloudSDKInitializer.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 01/02/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeCloudSDKInitializer.h"
#import "WiSeNetworkConstants.h"
#import "WiSeCloudAPIURLInfo.h"

@interface WiSeCloudSDKInitializer (WiSeCloudSDKinitializerDelegate)

@end

@implementation WiSeCloudSDKInitializer

#pragma mark - Singleton Methods

- (instancetype) sharedWiSeCloudSDKWithDataSource : (id<WiSeCloudSDKinitializerDelegate>) dataSource {
    WiSeCloudSDKInitializer * obj = [WiSeCloudSDKInitializer sharedWiSeCloudSDKInitializer];
    obj.dataSource                = dataSource;
    return obj;
}

+ (id)sharedWiSeCloudSDKInitializer {
    static WiSeCloudSDKInitializer *sharedWiSeCloudSDKInitializer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    sharedWiSeCloudSDKInitializer                                 = [[self alloc] init];
    });
    return sharedWiSeCloudSDKInitializer;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

# pragma mark - Get Base URL

- (NSString *) getBaseURL {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(getBaseURL)]) {
        return [self.dataSource getBaseURL];
    }else {
        return serverIP;
    }
}

# pragma mark - Get Base URL For API

- (NSString *) getBaseURLForAPI : (WiSeAPICall) apiName {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(getBaseURLForAPI:)]) {
        return [self.dataSource getBaseURLForAPI:apiName];
    }else if (self.dataSource && [self.dataSource respondsToSelector:@selector(getBaseURL)]) {
        return [self.dataSource getBaseURL];
    }else {
        return serverIP;
    }
}

# pragma mark - Get Full URL For API

- (NSString *) getFullURLForAPI : (WiSeAPICall) apiName {
    NSString * baseURL;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(getFullURLForAPI:)]) { 
        return [self.dataSource getFullURLForAPI:apiName];
    }else if (self.dataSource && [self.dataSource respondsToSelector:@selector(getBaseURLForAPI:)]) {
        baseURL = [NSString stringWithFormat:@"%@%@",[self.dataSource getBaseURLForAPI:apiName],[self getURLPathForAPI:apiName]];
        return baseURL;
    }else if (self.dataSource && [self.dataSource respondsToSelector:@selector(getBaseURL)]) {
        baseURL = [NSString stringWithFormat:@"%@%@",[self.dataSource getBaseURL],[self getURLPathForAPI:apiName]];
        return baseURL;
    }else {
        baseURL = [NSString stringWithFormat:@"%@%@",serverIP,[self getURLPathForAPI:apiName]];
        return serverIP;
    }
}

# pragma mark - Get URL Info For API

- (WiSeCloudAPIURLInfo *) getURLInfoForAPI : (WiSeAPICall) apiName {
    
    WiSeCloudAPIURLInfo * urlInfo = [WiSeCloudAPIURLInfo new];
    urlInfo.apiURL        = nil;
    urlInfo.apiHttpMethod = nil;
    
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(getURLInfoForAPI:)]) {
        urlInfo        = [self.dataSource getURLInfoForAPI:apiName];
        if (!urlInfo) {
            urlInfo.apiURL = [NSString stringWithFormat:@"%@%@",serverIP,[self getURLPathForAPI:apiName]];
        }
    }
    else if (self.dataSource && [self.dataSource respondsToSelector:@selector(getFullURLForAPI:)])
    {
        urlInfo.apiURL = [self.dataSource getFullURLForAPI:apiName];
        
    }else if (self.dataSource && [self.dataSource respondsToSelector:@selector(getBaseURLForAPI:)])
    {
        urlInfo.apiURL = [NSString stringWithFormat:@"%@%@",[self.dataSource getBaseURLForAPI:apiName],[self getURLPathForAPI:apiName]];
        
    }
    else if (self.dataSource && [self.dataSource respondsToSelector:@selector(getBaseURL)])
    {
        urlInfo.apiURL = [NSString stringWithFormat:@"%@%@",[self.dataSource getBaseURL],[self getURLPathForAPI:apiName]];
        
    }else
    {
        urlInfo.apiURL = [NSString stringWithFormat:@"%@%@",serverIP,[self getURLPathForAPI:apiName]];
    }
    return urlInfo;
}

#pragma mark - Get URL Path For API

- (NSString *) getURLPathForAPI : (WiSeAPICall) apiName {
    NSString * pathOfURL = @"";
    
    switch (apiName) {
        case Login:
            pathOfURL = UrlSignIn;
            break;
        case Logout:
            pathOfURL = UrlLogout;
            break;
        case SignUp:
            pathOfURL = UrlSignUp;
            break;
        case AddUser:
            pathOfURL = UrlAddUser;
            break;
        case EditUser:
            pathOfURL = UrlEditUser;
            break;
        case ChangePassword:
            pathOfURL = UrlChangePassword;
            break;
        case ForgotPassword:
            pathOfURL = UrlForgotPassword;
            break;
        case UpdateUserProfile:
            pathOfURL = UrlUpdateUserProfile;
            break;
        case UpdateDeviceToken:
            pathOfURL = UrlUpdateDeviceToken;
            break;
        case AddDevice:
            pathOfURL = UrlAddDevice;
            break;
        case EditDevice:
            pathOfURL = UrlEditDevice;
            break;
        case GetADevice:
            pathOfURL = UrlGetADevice;
            break;
        case GetAllDevice:
            pathOfURL = UrlGetAllDevice;
            break;
        case GetArchivedDevice:
            pathOfURL = UrlGetArchivedDevices;
            break;
        case DeleteDevice:
            pathOfURL = UrlDeleteDevice;
            break;
        case DeleteDeviceInBulk:
            pathOfURL = UrlDeleteDevices;
            break;
        case DeviceGroupAssociation:
            pathOfURL = UrlDevicesGroupAssociation;
            break;
        case GetSecureDevice:
            pathOfURL = UrlGetSecureDevice;
            break;
        case DeleteSecureDevice:
            pathOfURL = @"";
            break;
        case GetDeviceGroupAssociation:
            pathOfURL = UrlGetDevicesGroupAssociation;
            break;
        case AddGroup:
            pathOfURL = UrlAddGroup;
            break;
        case EditGroup:
            pathOfURL = UrlEditGroup;
            break;
        case GetGroup:
            pathOfURL = UrlGetGroup;
            break;
        case GetArchivedGroup:
            pathOfURL = UrlGetArchivedGroups;
            break;
        case DeleteGroup:
            pathOfURL = UrlDeleteGroup;
            break;
        case DeleteGroupInBulk:
            pathOfURL = UrlDeleteGroups;
            break;
        case UpdateDirectOperationStatus:
            pathOfURL = UrlUpdateDeviceOperationStatus;
            break;
        case UpdateRemoteOperationStatus:
            pathOfURL = @"";
            break;
        case RequestForRemoteOperation:
            pathOfURL = UrlRequestForRemoteOperation;
            break;
        case SensorAssociation:
            pathOfURL = UrlSensorAssociation;
            break;
        case GetSensorAssociation:
            pathOfURL = UrlGetSensorAssociation;
            break;
        case GetArchivedSensorAssociation:
            pathOfURL = UrlGetArchivedSensorAssociation;
            break;
        case OtherMessagesFetch:
            pathOfURL = UrlMessageFetch;
            break;
        case OperationMessagesFetch:
            pathOfURL = UrlMessageFetch;
            break;
        case OtherMessagesUpdate:
            pathOfURL = UrlMessageStatusUpdate;
            break;
        case OperationMessagesUpdate:
            pathOfURL = UrlMessageStatusUpdate;
            break;
        case GetMessageHistory:
            pathOfURL = UrlGetMessageHistory;
            break;
        case NotificationStatusUpdate:
            pathOfURL = UrlNotificationStatusUpdate;
            break;
        case MessageStatusUpdate:
            pathOfURL = UrlMessageStatusUpdate;
            break;
        case ResetMessageQueue:
            pathOfURL = UrlResetMessageQueue;
            break;
        case AddBeacon:
            pathOfURL = UrlAddBeacon;
            break;
        case EditBeacon:
            pathOfURL = UrlEditBeacon;
            break;
        case GetBeacon:
            pathOfURL = UrlGetBeacon;
            break;
        case GetArchivedBeacon:
            pathOfURL = UrlGetArchivedBeacon;
            break;
        case DeleteBeacon:
            pathOfURL = UrlDeleteABeacon;
            break;
        case DeleteBeaconInBulk:
            pathOfURL = UrlDeleteBeacon;
            break;
        case AddConfiguredBeacon:
            pathOfURL = UrlAddConfiguredBeacon;
            break;
        case EditConfiguredBeacon:
            pathOfURL = UrlEditConfiguredBeacon;
            break;
        case GetConfiguredBeacon:
            pathOfURL = UrlGetConfiguredBeacon;
            break;
        case DeleteConfiguredBeacon:
            pathOfURL = UrlDeleteConfiguredBeacon;
            break;
        case DeviceBeaconAssociation:
            pathOfURL = UrlCreateDeviceBeaconAssociation;
            break;
        case GetDeviceBeaconAssociation:
            pathOfURL = UrlGetDeviceBeaconAssociation;
            break;
        case GetArchivedDeviceBeaconAssociation:
            pathOfURL = UrlGetArchivedDeviceBeaconAssociation;
            break;
        case DeleteDeviceBeaconAssociation:
            pathOfURL = UrlDeleteDeviceBeaconAssociation;
            break;
        case UpdateBeaconBatteryLevel:
            pathOfURL = UrlUpdateBeaconBatteryLevel;
            break;
        case UpdateBeaconDataLog:
            pathOfURL = UrlUpdateBeaconDataLog;
            break;
        case MakeMultiSensor:
            pathOfURL = UrlMakeMultiSensor;
            break;
        case SensorTriggerLog:
            pathOfURL = UrlSensorTriggerLog;
            break;
        case SensorTriggerIntervalSet:
            pathOfURL = UrlSensorTriggerIntervalSet;
            break;
        case ShutterUpdate:
            pathOfURL = UrlShutterUpdateAndFetch;
            break;
        case ShutterFetch:
            pathOfURL = UrlShutterUpdateAndFetch;
            break;
        case AddFriends:
            pathOfURL = UrlAddFriends;
            break;
        case GetFriends:
            pathOfURL = UrlGetFriends;
            break;
        case DeleteFriend:
            pathOfURL = UrlDeleteFriends;
            break;
        case FriendRequestAccept_Reject:
            pathOfURL = UrlFriendRequestAccept_Reject;
            break;
        case BridgeSet_Remove:
            pathOfURL = UrlBridgeSet_Remove;
            break;
        case ShareAccept_Reject:
            pathOfURL = UrlShareAccept_Reject;
            break;
        case GetSharedGroups:
            pathOfURL = UrlGetSharedGroups;
            break;
        case GetSharedDevices:
            pathOfURL = UrlGetSharedDevices;
            break;
        case CreateShare:
            pathOfURL = UrlCreateShare;
            break;
        case SaveAppInfo:
            pathOfURL = UrlSaveAppInfo;
            break;
        case UpdateSaveAppInfo:
            pathOfURL = UrlUpdateSaveAppInfo;
            break;
        case UpdateRemoteOperationFeedback:
            pathOfURL = UrlUpdateRemoteOperationFeedback;
            break;
        case CreateUpdateSubscription:
            pathOfURL = UrlCreateUpdateSubscription;
            break;
        case GetSubcription:
            pathOfURL = UrlGetSubscription;
            break;
        case AddOrganization:
            pathOfURL = UrlAddOrganization;
            break;
        case EditOrganization:
            pathOfURL = UrlEditOrganization;
            break;
        case DeleteOrganization:
            pathOfURL = UrlDeleteAOrganization;
            break;
        case DeleteOrganizationInBulk:
            pathOfURL = UrlDeleteOrganization;
            break;
        case GetOrganization:
            pathOfURL = UrlGetOrganization;
            break;
        case SetUpdateSnoozeTiming:
            pathOfURL = UrlSetUpdateSnoozeTiming;
            break;
        case CheckOut:
            pathOfURL = UrlCheckOut;
            break;
        case SelfAssignReset:
            pathOfURL = UrlSelfAssignReset;
            break;
        case ListRoles:
            pathOfURL = UrlListRoles;
            break;
        case ListUsers:
            pathOfURL = UrlListUsers;
            break;
        case DeleteUser:
            pathOfURL = UrlDeleteUsers;
            break;
        case AddTag:
            pathOfURL = UrlAddTag;
            break;
        case EditTag:
            pathOfURL = UrlEditTag;
            break;
        case GetTag:
            pathOfURL = UrlGetTag;
            break;
        case DeleteTag:
            pathOfURL = UrlDeleteATag;
            break;
        case DeleteTagInBulk:
            pathOfURL = UrlDeleteTag;
            break;
        case SecureTag:
            pathOfURL = UrlSecureTag;
            break;
        case DeleteSecureTag:
            pathOfURL = UrlDeleteSecureTag;
            break;
        case GetListener:
            pathOfURL = UrlGetListener;
            break;
        case GetListenerZoneMapping:
            pathOfURL = UrlGetListenerZoneMapping;
            break;
        case GetAListenerZoneMapping:
            pathOfURL = UrlGetListenerZoneMapping;
            break;
        case GetListenerFromOrganizations:
            pathOfURL = UrlGetListenerFromOrganizations;
            break;
        case AddListener:
            pathOfURL = UrlAddListener;
            break;
        case AddSecureListener:
            pathOfURL = UrlAddSecureListener;
            break;
        case DeleteSecureListener:
            pathOfURL = UrlDeleteSecureListener;
            break;
        case EditListener:
            pathOfURL = UrlEditListener;
            break;
        case DeleteListener:
            pathOfURL = UrlDeleteDevice;
        case DeleteListenerInBulk:
            pathOfURL = UrlDeleteDevices;
            break;
        case AddInfant:
            pathOfURL = UrlAddInfant;
            break;
        case EditInfant:
            pathOfURL = UrlEditInfant;
            break;
        case GetInfant:
            pathOfURL = UrlGetInfant;
            break;
        case GetAInfant:
            pathOfURL = UrlGetAInfant;
            break;
        case DeleteInfant:
            pathOfURL = UrlDeleteAInfant;
            break;
        case DeleteInfantInBulk:
            pathOfURL = UrlDeleteInfant;
            break;
        case GetInfantsFromOrganizations:
            pathOfURL = UrlGetInfantFromOrganization;
            break;
        case InfantTagAssociation:
            pathOfURL = UrlInfantTagAss;
            break;
        case AddRule:
            pathOfURL = UrlAddRule;
            break;
        case EditRule:
            pathOfURL = UrlEditRule;
            break;
        case AddZone:
            pathOfURL = UrlAddZone;
            break;
        case EditZone:
            pathOfURL = UrlEditZone;
            break;
        case DeleteZone:
            pathOfURL = UrlDeleteAZone;
            break;
        case DeleteZoneInBulk:
            pathOfURL = UrlDeleteZone;
            break;
        case GetZone:
            pathOfURL = UrlGetZone;
            break;
        case GetZoneFromOrganization:
            pathOfURL = UrlGetZoneFromOrganization;
            break;
        case GetZoneListenerMapping:
            pathOfURL = UrlGetZoneListenerMapping;
            break;
        case MapZoneAndListener:
            pathOfURL = UrlMapZoneListener;
            break;
        case GetMapSettings:
            pathOfURL = UrlGetMapSettings;
            break;
        case GetTrackingAlerts:
            pathOfURL = UrlGetTrackingAlerts;
            break;
        case GetArchivedListener:
            pathOfURL = UrlGetArchivedListeners;
            break;
        case GetArchivedInfant:
            pathOfURL = UrlGetArchivedInfant;
            break;
        case GetArchivedZone:
            pathOfURL = UrlGetArchivedZone;
            break;
        case GetArchivedTag:
            pathOfURL = UrlGetArchivedTag;
            break;
        case TagCheck:
            pathOfURL = UrlTagCheck;
            break;
        case HealthCheck:
            pathOfURL = UrlHealthCheck;
            break;
        case AddSchedule:
            pathOfURL = UrlAddSchedule;
            break;
        case EditSchedule:
            pathOfURL = UrlEditSchedule;
            break;
        case DeleteSchedule:
            pathOfURL = UrlDeleteSchedule;
            break;
        case GetSchedule:
            pathOfURL = UrlGetSchedule;
            break;
        case ClearSecureDevice:
            pathOfURL = UrlClearSecureDevice;
            break;
        case GetInfantPosition:
            pathOfURL = UrlGetInfantPosition;
            break;
        default:
            break;
    }
    
    return pathOfURL;
}


@end
