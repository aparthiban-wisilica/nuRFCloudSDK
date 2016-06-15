//
//  WiSeNetworkConstants.h
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 23/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WiSeAPIConstants.h"
#import "WiSeNetworkErrorConstants.h"
#import "WiSeNetworkServerSuccesErrorCodeConstants.h"

// Http method constants
extern NSString * const REQUEST_METHOD_GET;
extern NSString * const REQUEST_METHOD_POST;
extern NSString * const REQUEST_METHOD_PUT;
extern NSString * const REQUEST_METHOD_PATCH;
extern NSString * const REQUEST_METHOD_DELETE;
extern NSString * const REQUEST_METHOD_COPY;
extern NSString * const REQUEST_METHOD_HEAD;
extern NSString * const REQUEST_METHOD_OPTIONS;
extern NSString * const REQUEST_METHOD_LINK;
extern NSString * const REQUEST_METHOD_UNLINK;
extern NSString * const REQUEST_METHOD_PURGE;
extern NSString * const REQUEST_METHOD_LOCK;
extern NSString * const REQUEST_METHOD_UNLOCK;
extern NSString * const REQUEST_METHOD_PROPFIND;
extern NSString * const REQUEST_METHOD_VIEW;


// Call for  Type

typedef enum {
    RemoteOperationRequest          = 0,
    DirectOperationStatusUpdate     = 2,
    RemoteOperationStatusUpdate     = 3
}WiSeCallFor;

// Message  Type

typedef enum {
    OperationMessages               = 1,
    OtherMessages                   = 2
}WiSeMessageType;

// Other Message  Type

typedef enum {
    
    RemoteOperationStatus = 2,
    DirectOperationStatus = 4,
    SensorTrigger         = 8
    
}WiSeOtherMessageType;

// Get Friend_User

typedef enum {
    FriendsList                     = 1,
    UserList                        = 2
}WiSeGetList;

// Bridge Action

typedef enum {
    SetBridge                       = 1,
    RemoveBridge                    = 2
}WiSeBridgeAction;

// Friend Request Action

typedef enum {
    FriendRequestAccept             = 1,
    FriendRequestReject             = 2
}WiSeFriendRequestAction;

// ShareAction

typedef enum{
    ShareAccept                     = 0,
    ShareReject                     = 1
}WiSeShareAction;

// Mapping Type

typedef enum {
    WiseItem                        = 0,
    WiseSubItem                     = 1
}WiSeItemType;

// Sensor Association Actions

typedef enum {

    AddSensor                       = 1,
    RemoveSensor                    = 2

} WiSeSensorAssociationActions;

// Device Beacon Association Actions

typedef enum {
    
    SetBeacon                       = 1,
    RemoveBeacon                    = 2
    
} WiSeBeaconAssociationActions;

// Multi Sensor Operation Types
typedef enum {

    PIRActive                       = 19,
    LDRActive                       = 20,
    None                            = 21

} MultiSensorOperationTypes ;

// Multi Sensor Types
typedef enum {

    PIR                             = 1,
    LDR                             = 2,
    NoType                          = 0

} MultiSensorTypes ;

// Request Priority

//static const int registrationFailed = -1;

typedef enum {

    INVALID_ORGANIZATION_ID         = 20004,
    WiSeCloudApiRequestErrorCode    = 4001,
    NetworkConnectionFailedErrorCode,
    LoginErrorCode,
    SignUpErrorCode,
    AddUserErrorCode,
    EditUserErrorCode,
    ChangePasswordErrorCode,
    PasswordEncryptionErrorCode,
    ForgotPasswordErrorCode,
    LogoutErrorCode,
    UpdateUserProfileErrorCode,
    UpdateDeviceTokenErrorCode,
    AddDeviceErrorCode,
    EditDeviceErrorCode,
    GetADeviceErrorCode,
    GetAllDeviceErrorCode,
    GetArchivedDeviceErrorCode,
    GetDeviceErrorCode,
    GetSecureDeviceErrorCode,
    ClearSecureDeviceErrorCode,
    DeleteSecureDeviceErrorCode,
    DeleteDeviceErrorCode,
    DeviceGroupAssociationErrorCode,
    GetDeviceGroupAssociationErrorCode,
    UpdateDirectOperationErrorCode,
    UpdateRemoreOperationErrorCode,
    RequestForRemoteOperationErrorCode,
    AddGroupErrorCode,
    EditGroupErrorCode,
    GetGroupErrorCode,
    GetArchivedGroupErrorCode,
    DeleteGroupErrorCode,
    SensorAssociationErrorCode,
    GetSensorAssociationErrorCode,
    GetArchivedSensorAssociationErrorCode,
    MessageFetchErrorCode,
    GetMessageHistoryErrorCode,
    NotificaitonStatusUpdateErrorCode,
    MessageStatusUpdateErrorCode,
    ResetMessageQueueErrorCode,
    GetTrackingAlertsErrorCode,
    AddBeaconErrorCode,
    EditBeaconErrorCode,
    GetBeaconErrorCode,
    GetArchivedBeaconErrorCode,
    DeleteBeaconErrorCode,
    AddConfiguredBeaconErrorCode,
    EditConfiguredBeaconErrorCode,
    GetConfiguredBeaconErrorCode,
    DeleteConfiguredBeaconErrorCode,
    CreateDeviceBeaconAssociationErrorCode,
    GetDeviceBeaconAssociationErrorCode,
    GetArchivedDeviceBeaconAssociationErrorCode,
    DeleteDeviceBeaconAssociationErrorCode,
    UpdateBeaconBatteryLevelErrorCode,
    UpdateBeaconDataLogErrorCode,
    MakeMultiSensorErrorCode,
    SensorTriggerLogErrorCode,
    SensorTriggerIntervalSetErrorCode,
    ShutterUpdateErrorCode,
    ShutterFetchErrorCode,
    AddFriendsErrorCode,
    GetFriendsErrorCode,
    DeleteFriendErrorCode,
    FriendRequestAccept_RejectErrorCode,
    BridgeSet_RemoveErrorCode,
    ShareAccept_RejectErrorCode,
    GetSharedGroupsErrorCode,
    GetSharedDevicesErrorCode,
    CreateShareErrorCode,
    SaveAppInfoErrorCode,
    UpdateSaveAppInfoErrorCode,
    UpdateRemoteOperationFeedbackErrorCode,
    CreateUpdateSubscriptionErrorCode,
    GetSubcriptionErrorCode,
    AddOrganizationErrorCode,
    EditOrganizationErrorCode,
    DeleteOrganizationErrorCode,
    GetOrganizationErrorCode,
    SetUpdateSnoozeTimingErrorCode,
    CheckOutErrorCode,
    SelfAssignResetErrorCode,
    ListRolesErrorCode,
    ListUsersErrorCode,
    DeleteUserErrorCode,
    AddTagErrorCode,
    EditTagErrorCode,
    GetTagErrorCode,
    DeleteTagErrorCode,
    SecureTagErrorCode,
    GetArchivedTagErrorCode,
    DeleteSecureTagErrorCode,
    TagCheckErrorCode,
    GetListenerErrorCode,
    GetListenerZoneMappingErrorCode,
    GetListenerFromOrganizationsErrorCode,
    GetArchivedListenerErrorCode,
    AddListenerErrorCode,
    AddSecureListenerErrorCode,
    DeleteSecureListenerErrorCode,
    EditListenerErrorCode,
    DeleteListenerErrorCode,
    AddInfantErrorCode,
    EditInfantErrorCode,
    GetInfantErrorCode,
    DeleteInfantErrorCode,
    GetArchivedInfantErrorCode,
    GetInfantsFromOrganizationsErrorCode,
    InfantTagAssociationErrorCode,
    AddRuleErrorCode,
    EditRuleErrorCode,
    AddZoneErrorCode,
    EditZoneErrorCode,
    DeleteZoneErrorCode,
    GetZoneErrorCode,
    GetArchivedZoneErrorCode,
    GetZoneFromOrganizationErrorCode,
    GetZoneListenerMappingErrorCode,
    MapZoneAndListenerErrorCode,
    GetMapSettingsErrorCode,
    HealthCheckErrorCode,
    AddScheduleErrorCode,
    EditScheduleErrorCode,
    DeleteScheduleErrorCode,
    GetScheduleErrorCode,
    GetInfantPositionErrorCode

} WiSeAPIDomainErrorCode;

// WiSe API Call Names

typedef enum {

    Login                           = 5001,
    Logout,
    SignUp,
    AddUser,
    EditUser,
    ChangePassword,
    ForgotPassword,
    UpdateUserProfile,
    UpdateDeviceToken,
    AddDevice,
    EditDevice,
    GetADevice,
    GetAllDevice,
    GetArchivedDevice,
    DeleteDevice,
    DeleteDeviceInBulk,
    DeviceGroupAssociation,
    GetSecureDevice,
    ClearSecureDevice,
    DeleteSecureDevice,
    GetDeviceGroupAssociation,
    AddGroup,
    EditGroup,
    GetGroup,
    GetArchivedGroup,
    DeleteGroup,
    DeleteGroupInBulk,
    UpdateDirectOperationStatus,
    UpdateRemoteOperationStatus,
    RequestForRemoteOperation,
    SensorAssociation,
    GetSensorAssociation,
    GetArchivedSensorAssociation,
    OtherMessagesFetch,
    OperationMessagesFetch,
    OtherMessagesUpdate,
    OperationMessagesUpdate,
    GetMessageHistory,
    NotificationStatusUpdate,
    MessageStatusUpdate,
    ResetMessageQueue,
    GetTrackingAlerts,
    AddBeacon,
    EditBeacon,
    GetBeacon,
    GetArchivedBeacon,
    DeleteBeacon,
    DeleteBeaconInBulk,
    AddConfiguredBeacon,
    EditConfiguredBeacon,
    GetConfiguredBeacon,
    DeleteConfiguredBeacon,
    DeviceBeaconAssociation,
    GetDeviceBeaconAssociation,
    GetArchivedDeviceBeaconAssociation,
    DeleteDeviceBeaconAssociation,
    UpdateBeaconBatteryLevel,
    UpdateBeaconDataLog,
    MakeMultiSensor,
    SensorTriggerLog,
    SensorTriggerIntervalSet,
    ShutterUpdate,
    ShutterFetch,
    AddFriends,
    GetFriends,
    DeleteFriend,
    FriendRequestAccept_Reject,
    BridgeSet_Remove,
    ShareAccept_Reject,
    GetSharedGroups,
    GetSharedDevices,
    CreateShare,
    SaveAppInfo,
    UpdateSaveAppInfo,
    UpdateRemoteOperationFeedback,
    CreateUpdateSubscription,
    GetSubcription,
    AddOrganization,
    EditOrganization,
    DeleteOrganization,
    DeleteOrganizationInBulk,
    GetOrganization,
    SetUpdateSnoozeTiming,
    CheckOut,
    SelfAssignReset,
    ListRoles,
    ListUsers,
    DeleteUser,
    AddTag,
    EditTag,
    GetTag,
    GetArchivedTag,
    DeleteTag,
    DeleteTagInBulk,
    SecureTag,
    TagCheck,
    DeleteSecureTag,
    GetListener,
    GetArchivedListener,
    GetListenerZoneMapping,
    GetAListenerZoneMapping,
    GetListenerFromOrganizations,
    AddListener,
    AddSecureListener,
    DeleteSecureListener,
    EditListener,
    DeleteListener,
    DeleteListenerInBulk,
    AddInfant,
    EditInfant,
    GetInfant,
    GetAInfant,
    DeleteInfant,
    DeleteInfantInBulk,
    GetArchivedInfant,
    GetInfantsFromOrganizations,
    InfantTagAssociation,
    AddRule,
    EditRule,
    AddZone,
    EditZone,
    DeleteZone,
    DeleteZoneInBulk,
    GetZone,
    GetArchivedZone,
    GetZoneFromOrganization,
    GetZoneListenerMapping,
    MapZoneAndListener,
    GetMapSettings,
    HealthCheck,
    AddSchedule,
    EditSchedule,
    DeleteSchedule,
    GetSchedule,
    GetInfantPosition
    
}WiSeAPICall;


@interface WiSeNetworkConstants : NSObject

@end
