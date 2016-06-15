//
//  WiSeAPIConstants.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 11/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeAPIConstants : NSObject

// Header Constants
extern NSString * const Accept;
extern NSString * const AcceptValue;
extern NSString * const ContentType;
extern NSString * const ContentTypeValue;

// URL Constants
extern NSString * const serverIP;
extern NSString * const UrlBaseString;
extern NSString * const UrlSaveAppInfo;
extern NSString * const UrlUpdateSaveAppInfo;
extern NSString * const UrlSignUp;
extern NSString * const UrlAddUser;
extern NSString * const UrlEditUser;
extern NSString * const UrlSignIn;
extern NSString * const UrlChangePassword;
extern NSString * const UrlForgotPassword;
extern NSString * const UrlLogout;
extern NSString * const UrlUpdateDeviceToken;

extern NSString * const UrlUpdateUserProfile;
extern NSString * const UrlDashBoard;
extern NSString * const UrlAddDevice;
extern NSString * const UrlEditDevice;
extern NSString * const UrlGetAllDevice;
extern NSString * const UrlGetArchivedDevices;
extern NSString * const UrlGetADevice;
extern NSString * const UrlDeleteDevice;
extern NSString * const UrlDeleteDevices;
extern NSString * const UrlGetSecureDevice;
extern NSString * const UrlClearSecureDevice;
extern NSString * const UrlDevicesGroupAssociation;
extern NSString * const UrlGetDevicesGroupAssociation;
extern NSString * const UrlUpdateDeviceOperationStatus;
extern NSString * const UrlRequestForRemoteOperation;
extern NSString * const UrlUpdateRemoteOperationFeedback;
extern NSString * const UrlCreateUpdateSubscription;
extern NSString * const UrlGetSubscription;
extern NSString * const UrlAddGroup;
extern NSString * const UrlEditGroup;
extern NSString * const UrlGetGroup;
extern NSString * const UrlGetArchivedGroups;
extern NSString * const UrlDeleteGroup;
extern NSString * const UrlDeleteGroups;
extern NSString * const UrlSensorAssociation;
extern NSString * const UrlGetSensorAssociation;
extern NSString * const UrlGetArchivedSensorAssociation;
extern NSString * const UrlMakeMultiSensor;
extern NSString * const UrlSensorTriggerLog;
extern NSString * const UrlSensorTriggerIntervalSet;
extern NSString * const UrlGetCustomSensor;

extern NSString * const UrlMessageFetch;
extern NSString * const UrlNotificationStatusUpdate;
extern NSString * const UrlNotificationUpdate;
extern NSString * const UrlMessageStatusUpdate;
extern NSString * const UrlResetMessageQueue;
extern NSString * const UrlGetMessageHistory;

extern NSString * const UrlAddBeacon;
extern NSString * const UrlEditBeacon;
extern NSString * const UrlGetBeacon;
extern NSString * const UrlGetArchivedBeacon;
extern NSString * const UrlDeleteBeacon;
extern NSString * const UrlDeleteABeacon;

extern NSString * const UrlAddConfiguredBeacon;
extern NSString * const UrlEditConfiguredBeacon;
extern NSString * const UrlGetConfiguredBeacon;
extern NSString * const UrlDeleteConfiguredBeacon;

extern NSString * const UrlCreateDeviceBeaconAssociation;
extern NSString * const UrlGetDeviceBeaconAssociation;
extern NSString * const UrlGetArchivedDeviceBeaconAssociation;
extern NSString * const UrlDeleteDeviceBeaconAssociation;

extern NSString * const UrlUpdateBeaconBatteryLevel;
extern NSString * const UrlUpdateBeaconDataLog;

extern NSString * const UrlShutterUpdateAndFetch;

extern NSString * const UrlAddFriends;
extern NSString * const UrlGetFriends;
extern NSString * const UrlDeleteFriends;
extern NSString * const UrlFriendRequestAccept_Reject;

extern NSString * const UrlBridgeSet_Remove;

extern NSString * const UrlShareAccept_Reject;
extern NSString * const UrlGetSharedGroups;
extern NSString * const UrlGetSharedDevices;
extern NSString * const UrlCreateShare;

extern NSString * const UrlAddOrganization;
extern NSString * const UrlEditOrganization;
extern NSString * const UrlDeleteOrganization;
extern NSString * const UrlDeleteAOrganization;
extern NSString * const UrlGetOrganization;

extern NSString * const UrlSetUpdateSnoozeTiming;
extern NSString * const UrlCheckOut;
extern NSString * const UrlSelfAssignReset;
extern NSString * const UrlListRoles;
extern NSString * const UrlListUsers;
extern NSString * const UrlDeleteUsers;

extern NSString * const UrlAddTag;
extern NSString * const UrlEditTag;
extern NSString * const UrlGetTag;
extern NSString * const UrlGetArchivedTag;
extern NSString * const UrlDeleteTag;
extern NSString * const UrlDeleteATag;
extern NSString * const UrlSecureTag;
extern NSString * const UrlDeleteSecureTag;
extern NSString * const UrlTagCheck;
extern NSString * const UrlGetListener;
extern NSString * const UrlGetListenerZoneMapping;
extern NSString * const UrlGetListenerFromOrganizations;
extern NSString * const UrlGetArchivedListeners;
extern NSString * const UrlAddListener;
extern NSString * const UrlAddSecureListener;
extern NSString * const UrlDeleteSecureListener;
extern NSString * const UrlEditListener;

extern NSString * const UrlAddInfant;
extern NSString * const UrlEditInfant;
extern NSString * const UrlGetInfant;
extern NSString * const UrlGetAInfant;
extern NSString * const UrlDeleteInfant;
extern NSString * const UrlDeleteAInfant;
extern NSString * const UrlGetInfantFromOrganization;
extern NSString * const UrlGetArchivedInfant;
extern NSString * const UrlAddRule;
extern NSString * const UrlEditRule;
extern NSString * const UrlInfantTagAss;

extern NSString * const UrlAddZone;
extern NSString * const UrlEditZone;
extern NSString * const UrlDeleteZone;
extern NSString * const UrlDeleteAZone;
extern NSString * const UrlGetZone;
extern NSString * const UrlGetZone;
extern NSString * const UrlGetArchivedZone;
extern NSString * const UrlGetZoneListenerMapping;
extern NSString * const UrlMapZoneListener;
extern NSString * const UrlGetZoneFromOrganization;

extern NSString * const UrlGetMapSettings;
extern NSString * const UrlGetTrackingAlerts;
extern NSString * const UrlHealthCheck;

extern NSString * const UrlAddSchedule;
extern NSString * const UrlEditSchedule;
extern NSString * const UrlDeleteSchedule;
extern NSString * const UrlGetSchedule;
extern NSString * const UrlGetInfantPosition;


// Common API Constants
extern NSString * const USER_NAME;
extern NSString * const USER_EMAIL;
extern NSString * const USER_DISPLAY_NAME;
extern NSString * const DISPLAY_NAME;
extern NSString * const USER_PASSWORD;
extern NSString * const USER_TYPE;
extern NSString * const USER_STATUS;
extern NSString * const ORGANIZATION_ID;
extern NSString * const NETWORK_ID;
extern NSString * const NETWORK_KEY;
extern NSString * const RESPONSE_STATUS;
extern NSString * const RESPONSE;
extern NSString * const MESSAGE;

extern NSString * const LAST_INSERT_ID;
extern NSString * const RESPONSE_IS_NIL;
extern NSString * const RESPONSE_IS_NIL;
extern NSString * const DEVICEID;
extern NSString * const OSINFO;
extern NSString * const EMAIL;
extern NSString * const IS_BRIDGE;
extern NSString * const ISBRIDGE;
extern NSString * const PHONE_LONG_ID;
extern NSString * const PHONE_MESH_ID;
extern NSString * const OPERATION_MESSAGE_TIMESTAMP;
extern NSString * const OTHER_MESSAGE_TIMESTAMP;
extern NSString * const MESSAGE_ID;
extern NSString * const MESSAGEID;
extern NSString * const TOKEN;
extern NSString * const USER_ID;
extern NSString * const NEW_PASSWORD;
extern NSString * const OLD_PASSWORD;
extern NSString * const NOTIFICATION;
extern NSString * const OPERATION_SEQUENCE;
extern NSString * const GROUP_OPERATION_SEQUENCE;
extern NSString * const WISE_DEVICE_SHORT_ID;
extern NSString * const DEVICE_SHORT_ID;
extern NSString * const DEVICE_MESH_ID;
extern NSString * const GROUP_ID;
extern NSString * const GROUP_SHORT_ID;
extern NSString * const GROUP_MESH_ID;
extern NSString * const GRPDVCID;
extern NSString * const GRPDVCSHOARTID;
extern NSString * const SENSORE_DATA;
extern NSString * const DATA;
extern NSString * const DEVICE_DETAILS;
extern NSString * const GROUP_DETAILS;
extern NSString * const PARENT_GROUP_ID;
extern NSString * const PARENT_GROUP_MESH_ID;
extern NSString * const GROUP_PATH;
extern NSString * const PARENT_GROUP_PATH;
extern NSString * const OLD_GROUP_ID;
extern NSString * const FRESH_GROUP_ID;
extern NSString * const GROUP_LEVEL;
extern NSString * const WISE_GROUP_NAME;
extern NSString * const WISE_GROUP_ICON_ID;
extern NSString * const WISE_GROUP_SEQUENCE_NUMBER;
extern NSString * const WISE_DEVICE_NAME;
extern NSString * const WISE_DEVICE_UUID;
extern NSString * const WISE_DEVICE_GUUID;
extern NSString * const WISE_DEVICE_TYPE;
extern NSString * const WISE_DEVICE_SEQUENCE_NUMBER;
extern NSString * const INTENSITY;
extern NSString * const COOL;
extern NSString * const WISE_DEVICE_PAIR_INFO;
extern NSString * const HARDWARD_VERSION;
extern NSString * const SOFTWARE_VERSION;
extern NSString * const FIRMWARE_VERSION;
extern NSString * const FEEDBACK;
extern NSString * const RGB;
extern NSString * const TIMER;
extern NSString * const TIME;
extern NSString * const OPERATE_PHONE_ID;
extern NSString * const IS_CONNECTABLE;
extern NSString * const WISE_DEVICE_MAC;
extern NSString * const MULTY_SENSORE_FLAG;
extern NSString * const GRP_DVC;
extern NSString * const OPERATION_ID;
extern NSString * const OPERATIONID;
extern NSString * const PHONEOPERATIONID;
extern NSString * const STATUS;
extern NSString * const _STATUS;
extern NSString * const MESSAGESTATUS;
extern NSString * const NEXT_STATUS;
extern NSString * const DEVICE_STATUS;
extern NSString * const GROUP_STATUS;
extern NSString * const TIMESTAMP;
extern NSString * const SEQUENCENUMBER;
extern NSString * const GROUP_ASSOCIATION;
extern NSString * const CHANNAL;
extern NSString * const NOTIFICATION_STATUS;
extern NSString * const SENSOR_ID;
extern NSString * const SENSOR_MESH_ID;
extern NSString * const ID;
extern NSString * const Id;
extern NSString * const ACTION;
extern NSString * const TYPE;
extern NSString * const DEVICE_UUID;
extern NSString * const START_TIME;
extern NSString * const END_TIME;
extern NSString * const OPERATION;

extern NSString * const BEACON_NAME;
extern NSString * const BEACON_UUID;
extern NSString * const BEACON_MAJOR;
extern NSString * const BEACON_MINOR;
extern NSString * const BEACON_DATA;
extern NSString * const BEACON_PREFIX;
extern NSString * const BEACON_ID;
extern NSString * const TX_POWER;
extern NSString * const CAPABILITY;
extern NSString * const ADV_INTERVAL;
extern NSString * const BEACON_SLOT;
extern NSString * const BEACON_RANGE_NAME;
extern NSString * const RANGE_RSSI;
extern NSString * const BEACON_TYPE;
extern NSString * const BEACON_ACTION;
extern NSString * const BATTARY_LEVEL;
extern NSString * const CALIBRATED_VALUE;
extern NSString * const  BEACON_LONG_ID;
extern NSString * const  FLAG;
extern NSString * const TIME_STAMP_BATTARY_LEVEL;
extern NSString * const DEVICE_NAME;
extern NSString * const DEVICE_BEACON_DATA;
extern NSString * const BEACONID;
extern NSString * const BEACON_MESH_ID;
extern NSString * const BEACON_STATUS;
extern NSString * const LISTEN_STATUS;
extern NSString * const TRIGGER;
extern NSString * const PHONE_DEVICE_ID;
extern NSString * const SENSORID;
extern NSString * const SENSOR_LONG_ID;
extern NSString * const SENSOR_LINK_ID;
extern NSString * const TIEM;
extern NSString * const STARTTIME;
extern NSString * const ENDTIME;

extern NSString * const REMOTE_ID;
extern NSString * const VALUES;
extern NSString * const SLOT;
extern NSString * const SHUTTER_DATA;
extern NSString * const FRIEND_ID;
extern NSString * const ACCEPT_REJECT;
extern NSString * const ACPT_REJECT;
extern NSString * const PHONEID;
extern NSString * const PHONEId;
extern NSString * const SHARE_USER;
extern NSString * const COUNT;
extern NSString * const CHECK;
extern NSString * const LAST_UPDATED;
extern NSString * const ICON_URL;
extern NSString * const SUB_USER_ID;
extern NSString * const GROUP_DEVICE;

extern NSString * const MODELINFO;
extern NSString * const DEVICETOKEN;
extern NSString * const ORGANIZATIONID;
extern NSString * const APPVERSION;
extern NSString * const APP_ID;
extern NSString * const APPId;
extern NSString * const USER_DEFAULT_GROUP_ID;

extern NSString * const API_ID;
extern NSString * const API_Id;
extern NSString * const STATUS_CODE;
extern NSString * const _STATUS_CODE;
extern NSString * const STATUS_MESSAGE;
extern NSString * const GROUP_COUNT;
extern NSString * const DEVICE_COUNT;

extern NSString * const START;
extern NSString * const END;
extern NSString * const  LIMIT;
extern NSString * const  OPERATION_LOG_ID;
extern NSString * const  ENCDATA;
extern NSString * const  ENCBRIDGEDATA;
extern NSString * const  ENCKEY;
extern NSString * const  OLID;
extern NSString * const  MESSAGE_ARRAY;
extern NSString * const  APPLICATION_DATA;
extern NSString * const  APPLICATIONDATA;
extern NSString * const  UUID;
extern NSString * const  OPID;
extern NSString * const  WARM_COOL;
extern NSString * const  WARM;
extern NSString * const  MSG_ID_ARRAY;
extern NSString * const  SENSOR_LINKID_STATUS;
extern NSString * const  SUBSCRIPTIONID;
extern NSString * const  SUBSCRIPTION_ID;

extern NSString * const  BRIDGEDATA;

extern NSString * const  BEACON_DEVICE_ASSOCIATION_COUNT;
extern NSString * const  BEACON_DEVICE_ASSOCIATION_DETAILS;

extern NSString * const  SENSOR_ASSOCIATION_COUNT;
extern NSString * const  SENSOR_ASSOCIATION_DETAILS;

extern NSString * const  BEACON_COUNT;
extern NSString * const  BEACON_DETAILS;

extern NSString * const  MESSAGE_COUNT;
extern NSString * const  MESSAGE_DETAILS;

extern NSString * const  DEVICES;
extern NSString * const  GROUPS;

extern NSString * const  DEVICE_TOKEN;
extern NSString * const  DEVICE_GROUP_ASSOCIATION_COUNT;
extern NSString * const  DEVICE_GROUP_ASSOCIATION_DETAILS;
extern NSString * const ASSOCIATION_MESSAGE;

extern NSString * const  ORG_NAME;
extern NSString * const  CUSTOMER_ID;
extern NSString * const  ORG_ID;
extern NSString * const  ROOT_ORG_ID;
extern NSString * const  ORG_COUNT;
extern NSString * const SUB_ORG_DETAILS;
extern NSString * const SUB_ORG_ID;
extern NSString * const PERMISSION_ID;
extern NSString * const ORG_DETAILS;
extern NSString * const PARENT_ID;

extern NSString * const ALERT_TYPE;
extern NSString * const ALERT_ID;
extern NSString * const SNOOZE_TIME;
extern NSString * const SNOOZE_COUNT;
extern NSString * const CHECKOUT_INTERVAL;
extern NSString * const TAG_CLOUD_ID;
extern NSString * const ASSIGN_NAME;
extern NSString * const NOTIFICATION_ID_ARRAY;
extern NSString * const NOTIFICATION_ID;

extern NSString * const ROLE_ID;
extern NSString * const ROLE_NAME;

extern NSString * const TAG_ID;
extern NSString * const TAG_MESH_ID;
extern NSString * const TAG_NAME;
extern NSString * const TAG_MAJOR;
extern NSString * const TAG_MINOR;
extern NSString * const TAG_COUNT;
extern NSString * const TAG_DETAILS;
extern NSString * const TAG_ARCHIVE_DETAILS;
extern NSString * const TAG_ARCHIVE_COUNT;

extern NSString * const LISTENER_ID;
extern NSString * const LISTENER_MESH_ID;
extern NSString * const LISTENER_NAME;
extern NSString * const LATITUDE;
extern NSString * const LONGTITUDE;
extern NSString * const MIN_RSSI;
extern NSString * const LISTENER_COUNT;
extern NSString * const LISTENER_DETAILS;

extern NSString * const ZONE_ID;
extern NSString * const ZONE_TYPE;
extern NSString * const ZONE_SAFE_TIME;
extern NSString * const ZONE_NAME;
extern NSString * const ZONE_RULES;
extern NSString * const ZONE_COUNT;
extern NSString * const SUB_ORGANIZATION_ZONE_DETAILS;
extern NSString * const ZONE_DETAILS;
extern NSString * const ZONE_MAPPING;
extern NSString * const MAPPING_DETAILS;


extern NSString * const INFANT_ID;
extern NSString * const INFANT_HOS_ID;
extern NSString * const INFANT_FNAME;
extern NSString * const INFANT_LNAME;
extern NSString * const INFANT_NAME;
extern NSString * const INFANT_COUNT;
extern NSString * const INFANT_DETAILS;
extern NSString * const CHECK_OUT_STATUS;
extern NSString * const INFANT_ARCHIVED_COUNT;
extern NSString * const INFANT_ARCHIVED_DETAILS;

extern NSString * const CUSTOMER_KEY;
extern NSString * const MAP_STATUS;
extern NSString * const MAP_MESSAGE;

extern NSString * const DEVICE_SECURITY_KEY;
extern NSString * const OWNER_SHIP_CHANGE_STATUS;

extern NSString * const LISTENER_MAP;
extern NSString * const ACTIVE;
extern NSString * const DEVICE_PAIRTING_KEY;

extern NSString * const VERSION;
extern NSString * const FILE_NAME;
extern NSString * const FILE_PATH;
extern NSString * const SCALING_FACTOR;
extern NSString * const FILE_SIZE;
extern NSString * const MAP_BOUNDARIES;
extern NSString * const TEMP_ID;

extern NSString * const USER_COUNT;
extern NSString * const USER_DETAILS;

extern NSString * const MESSAGE_TYPE;
extern NSString * const LAYER_ID;
extern NSString * const EXTRA_MESSAGE;
extern NSString * const TAG_STATUS;
extern NSString * const RSSI;
extern NSString * const CONFIDENT_LEVEL;


@end
