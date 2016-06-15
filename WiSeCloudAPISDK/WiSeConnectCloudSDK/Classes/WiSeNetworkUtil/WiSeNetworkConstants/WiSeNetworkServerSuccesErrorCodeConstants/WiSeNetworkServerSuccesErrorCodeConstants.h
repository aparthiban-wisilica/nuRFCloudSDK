//
//  WiSeNetworkServerSuccesErrorCodeConstants.h
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 06/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#ifndef WiSeNetworkServerSuccesErrorCodeConstants_h
#define WiSeNetworkServerSuccesErrorCodeConstants_h


#endif /* WiSeNetworkServerSuccesErrorCodeConstants_h */

// Request Succes and Error Code

typedef enum {
    
    SUCCESS          = 20001,
    VALIDATION_ERROR = 20005,
    TOKEN_MISSING    = 20006,
    
} RequestSuccesAndError;

// Save App Info Succes and Error Code

typedef enum {

    APP_REGISTRATION_SUCCESSFULL             = 20001,
    APP_REGISTRATION_UPDATED                 = 20002,
    APP_INFO_INVALID_DEVICE_ID               = 20003,
    APP_INFO_VALIDATION_ERROR                = 20005

} SaveAppInfoSuccesAndError;

// SignUp Succes and Error Code

typedef enum {

    USER_REGISTRATION_SUCCESSFULL            = 20001,
    USER_REGISTRATION_USER_NAME_EXISTS       = 20012,
    USER_REGISTRATION_INVALID_EMAIL_ID       = 20013,
    //    INVALID_ORGANIZATION_ID = 20004,
    USER_REGISTRATION_VALIDATION_ERROR       = 20015

} SignUpSuccesAndError;

// Login Succes and Error Code

typedef enum {

    USER_LOGIN_SUCCESSFULL                   = 20001,
    USER_LOGIN_INVALID_USER_NAME_PASSWORD    = 20022,
    USER_LOGIN_INVALID_PASSWORD              = 20013,
    //    INVALID_ORGANIZATION_ID = 20004,
    USER_LOGIN_VALIDATION_ERROR              = 20015

} LoginSuccesAndError;

// ForgotPassword Succes and Error Code

typedef enum {

    USER_REQUEST_SUCCESSFULL                 = 20001,
    USER_REQUEST_INVALID_USER_NAME           = 20032,
    //    INVALID_ORGANIZATION_ID = 20004,
    USER_FORGOTPASSWORD_VALIDATION_ERROR     = 20015

} ForgorPasswordSuccesAndError;

// Change Password Succes and Error Code

typedef enum {

    USER_PASSWORD_CHANGE_SUCCESSFULL         = 20001,
    USER_PASSWORD_INVALID_USER_OLD_PASSWORD  = 20042,
    //    INVALID_ORGANIZATION_ID = 20004,
    USER_PASSWORD_CHANGE_VALIDATION_ERROR    = 20043

} ChangePasswordSuccesAndError;

// Logout Succes and Error Code

typedef enum {

    USER_LOGOUT_SUCCESSFULL                  = 20001,
    USER_LOGOUT_INVALID_USER_NAME            = 20052,
    //    INVALID_ORGANIZATION_ID = 20004,
    USER_LOGOUT_INVALID_USER_TOKEN           = 20053,
    USER_LOGOUT_VALIDATION_ERROR             = 20054

} LogoutSuccesAndError;

// Update Device Token Succes and Error Code

typedef enum {
    
    UPDATE_DEVICE_TOKEN_SUCCESSFULL         = 20001,
    UPDATE_DEVICE_TOKEN_FAIL                = 20052
    
} UpdateDeviceTokenSuccessAndError;

// Add Group Succes and Error Code

typedef enum {

    ADD_GROUP_SUCCESSFULL                    = 20001,
    ADD_GROUP_VALIDATION_ERROR               = 20062,
    //    INVALID_ORGANIZATION_ID = 20004,
    USER_ADD_GROUP_INVALID_USER_TOKEN        = 20063

} AddGroupSuccesAndError;

// Edit Group Succes and Error Code

typedef enum {

    EDIT_GROUP_SUCCESSFULL                   = 20001,
    EDIT_GROUP_VALIDATION_ERROR              = 20072
    //    INVALID_ORGANIZATION_ID = 20004,

} EditGroupSuccesAndError;

// Get Group Succes and Error Code

typedef enum {

    GET_GROUP_SUCCESSFULL                    = 20001,
    GET_GROUP_VALIDATION_ERROR               = 20082
    //    INVALID_ORGANIZATION_ID = 20004,

} GetGroupSuccesAndError;

// Delete Group Succes and Error Code

typedef enum {

    DELETE_GROUP_SUCCESSFULL                 = 20001,
    DELETE_GROUP_VALIDATION_ERROR            = 20092
    //    INVALID_ORGANIZATION_ID = 20004,

} DeleteGroupSuccesAndError;

// Add Device Succes and Error Code

typedef enum {

    ADD_DEVICE_SUCCESSFULL                   = 20001,
    ADD_DEVICE_INVALID_GUUID                 = 20112,
    ADD_DEVICE_INVALID_GROUP_ID              = 20113,
    ADD_DEVICE_VALIDATION_ERROR              = 20114

} AddDeviceSuccesAndError;

// Edit Device Succes and Error Code

typedef enum {

    EDIT_DEVICE_SUCCESSFULL                  = 20001,
    EDIT_DEVICE_INVALID_GROUP_ID             = 20122,
    EDIT_DEVICE_VALIDATION_ERROR             = 20123

} EditDeviceSuccesAndError;

// Get Device Succes and Error Code

typedef enum {

    DEVICE_GET_SUCCESSFULL                   = 20001,
    DEVICE_GET_VALIDATION_ERROR              = 20132

} GetDeviceSuccesAndError;

// Delete Device Succes and Error Code

typedef enum {

    DEVICE_DELETE_SUCCESSFULL                = 20001,
    DEVICE_DELETE_VALIDATION_ERROR           = 20142

} DeleteDeviceSuccesAndError;

// Sensor Association Succes and Error Code

typedef enum {

    DEVICE_LINK_DELINK_SUCCESSFULL           = 20001,
    DEVICE_LINK_DELINK_VALIDATION_ERROR      = 20152,
    DEVICE_LINK_DELINK_FAILED                = 20153

} SensorAssociationSuccesAndError;

// Get Sensor Association Succes and Error Code

typedef enum {
    
    GET_DEVICE_LINK_DELINK_SUCCESSFULL           = 20001,
    GET_DEVICE_LINK_DELINK_VALIDATION_ERROR      = 20152,
    GET_DEVICE_LINK_DELINK_FAILED                = 20153
    
} GetSensorAssociationSuccesAndError;

// Set Sensor Trigger Succes and Error Code

typedef enum {

    SENSOR_TRIGGER_LOG_SUCCESSFULL           = 20001,
    SENSOR_TRIGGER_INVALID_DATA              = 20192,
    SENSOR_TRIGGER_LOG_FAILED                = 20193,
    SENSOR_TRIGGER_LOGGED_ALERT_FAILED       = 20194

} SetSensorTriggerSuccesAndError;

// Get Sensor Trigger Succes and Error Code

typedef enum {

    GET_CUSTOMSENSOR_SUCCESSFULL             = 20001

} GetSensorTriggerSuccesAndError;

// Device Remote Operation Request Succes and Error Code

typedef enum {

    DEVICE_OPERATION_LOGGED                  = 20001,
    DEVICE_OPERATION_LOG_FAILED              = 20162,
    DEVICE_OPERATION_VALIDATION_ERROR        = 20163

} DeviceRemoteOperationRequestSuccesAndError;

// Device Direct Operation Status Succes and Error Code

typedef enum {

    DEVICE_DIRECT_OPERATION_LOGGED           = 20001,
    DEVICE_DIRECT_OPERATION_LOG_FAILED       = 20172,
    DEVICE_DIRECT_OPERATION_VALIDATION_ERROR = 20173

} DeviceDirectOperationStatusSuccesAndError;

// Update Remote Operation Feedback Succes and Error Code

typedef enum {

    DEVICE_OPERATION_UPDATED                 = 20001,
    DEVICE_OPERATION_UPDATE_FAILED           = 20182,
    DEVICE_OPERATION_VALIDATION_ERRORR       = 20183

} UpdateRemoteOperationFeedbackSuccesAndError;

// # TODO : Need to add enum for Remote operation update

// Get Message Succes and Error Code

typedef enum {

    GET_MESSAGE_SUCCESSFULL                  = 20001,
    GET_MESSAGE_VALIDATION_ERROR             = 20053

} GetMessageSuccesAndError;

// Update Message Status Succes and Error Code

typedef enum {

    MESSAGE_STATUS_UPDATE_SUCCESSFULL        = 20001,
    MESSAGE_STATUS_UPDATE_VALIDATION_ERROR   = 20053

} UpdateMessageStatusSuccesAndError;

// Reset Message Queue Succes and Error Code

typedef enum {

    RESET_MESSAGE_QUEUE_SUCCESSFULL          = 20001

} ResetMessageQueueSuccesAndError;

// Get Message History Succes and Error Code

typedef enum {

    HISTORY_MESSAGE_SUCCESSFULL              = 20001

} GetMessageHistorySuccesAndError;

// Bridge SetRemove Succes and Error Code

typedef enum {

    SET_BRIDGE_SUCCESSFULL                   = 20001,
    SET_BRIDGE_ERROR                         = 20232

} BridgeSetRemoveSuccesAndError;

// Create/Update Subscription Succes and Error Code

typedef enum {

    CREATE_UPDATE_SUBCRIPTION_SUCCESSFULL    = 20001,
    CREATE_UPDATE_SUBCRIPTION_ERROR          = 20082,
    PHONE_ID_MISMATCH_ERROR                  = 20000,
    USER_NOT_AUTHORIZED_ERROR                = 20053


} CreateUpdateSubscriptionSuccesAndError;

// Get Subscription Succes and Error Code

typedef enum {

    GET_SUBCRIPTION_SUCCESSFULL              = 20001,
    GET_SUBCRIPTION_ERROR                    = 20082

} GetSubscriptionSuccesAndError;

// Add Beacon Succes and Error Code

typedef enum {
    
    ADD_BEACON_SUCCESSFULL      = 20001,
    ADD_BEACON_VALIDATION_ERROR = 20082
    
} AddBeaconSuccesAndError;

// Edit Beacon Succes and Error Code

typedef enum {
    
    EDIT_BEACON_SUCCESSFULL      = 20001,
    EDIT_BEACON_VALIDATION_ERROR = 20082
    
} EditBeaconSuccesAndError;

// Delete Beacon Succes and Error Code

typedef enum {
    
    DELETE_BEACON_SUCCESSFULL      = 20001,
    DELETE_BEACON_VALIDATION_ERROR = 20082
    
} DeleteBeaconSuccesAndError;

// Get Beacon Succes and Error Code

typedef enum {
    
    GET_BEACON_SUCCESSFULL      = 20001,
    GET_BEACON_VALIDATION_ERROR = 20082
    
} GetBeaconSuccesAndError;

// Add Configured Beacon Succes and Error Code

typedef enum {
    
    ADD_CONFIGURED_BEACON_SUCCESSFULL      = 20001,
    ADD_CONFIGURED_BEACON_VALIDATION_ERROR = 20082
    
} AddConfiguredBeaconSuccesAndError;

// Edit Configured Beacon Succes and Error Code

typedef enum {
    
    EDIT_CONFIGURED_BEACON_SUCCESSFULL      = 20001,
    EDIT_CONFIGURED_BEACON_VALIDATION_ERROR = 20082
    
} EditConfiguredBeaconSuccesAndError;

// Get Configured Beacon Succes and Error Code

typedef enum {
    
    GET_CONFIGURED_BEACON_SUCCESSFULL      = 20001,
    GET_CONFIGURED_BEACON_VALIDATION_ERROR = 20082
    
} GetConfiguredBeaconSuccesAndError;

// Delete Configured Beacon Succes and Error Code

typedef enum {
    
    DELETE_CONFIGURED_BEACON_SUCCESSFULL      = 20001,
    DELETE_CONFIGURED_BEACON_VALIDATION_ERROR = 20082
    
} DeleteConfiguredBeaconSuccesAndError;

// Update Beacon Battery Status and Error Code

typedef enum {
    
    UPDATE_BEACON_BATTERY_STATUS_SUCCESSFULL      = 20001,
    UPDATE_BEACON_BATTERY_STATUS_VALIDATION_ERROR = 20082
    
} UpdateBeaconBatteryStatusSuccesAndError;

// Update Beacon Data Log Success and Error Code

typedef enum {
    
    UPDATE_BEACON_DATA_LOG_SUCCESSFULL      = 20001,
    UPDATE_BEACON_DATA_LOG_VALIDATION_ERROR = 20082
    
} UpdateBeaconDataLogSuccesAndError;

// Create Device Beacon Association Success and Error Code

typedef enum {
    
    CREATE_DEVICE_BEACON_ASSOCIATION_SUCCESSFULL      = 20001,
    CREATE_DEVICE_BEACON_ASSOCIATION_VALIDATION_ERROR = 20082
    
} CreateDeviceBeaconAssociationSuccesAndError;

// Get Device Beacon Association Success and Error Code

typedef enum {
    
    GET_DEVICE_BEACON_ASSOCIATION_SUCCESSFULL      = 20001,
    GET_DEVICE_BEACON_ASSOCIATION_VALIDATION_ERROR = 20082
    
} GetDeviceBeaconAssociationSuccesAndError;


