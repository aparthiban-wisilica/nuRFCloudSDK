//
//  WiSeAPIConstants.m
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 11/12/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeAPIConstants.h"

@implementation WiSeAPIConstants

#pragma mark --- Header Constants ---

NSString * const Accept                                = @"Accept";
NSString * const AcceptValue                           = @"application/json";
NSString * const ContentType                           = @"Content-Type";
NSString * const ContentTypeValue                      = @"application/json;charset=utf-8";

#pragma mark --- URL Constants ---

//NSString * const serverIP =@"https://wiser.wisilica.com/demo2/public/";
//NSString * const serverIP =@"http://192.168.1.81/wiseitcloud/wiseconnect/public/";
//NSString * const serverIP =@"http://192.168.1.217/wiseconnect/public/";
//NSString * const serverIP                         = @"http://192.168.1.49/wiseconnect/public/";

NSString * const serverIP                              = @"http://192.168.10.217/WiSeItCloud/wiseconnect/public/";


NSString * const UrlBaseString                         = @"/wdi/public/";
//NSString * const UrlSignUp = @"/wdi/public/user";

NSString * const UrlSignUp                             = @"user";
NSString * const UrlAddUser                            = @"user";
NSString * const UrlEditUser                           = @"useredit/1";
NSString * const UrlSaveAppInfo                        = @"app";
NSString * const UrlUpdateSaveAppInfo                  = @"app/1";
NSString * const UrlSignIn                             = @"login";
NSString * const UrlChangePassword                     = @"user/1";
NSString * const UrlForgotPassword                     = @"forgot";
NSString * const UrlLogout                             = @"login/1";
NSString * const UrlUpdateDeviceToken                  = @"app/1";

NSString * const UrlUpdateUserProfile             = @"user/1";
NSString * const UrlDashBoard                     = @"group/1";
NSString * const UrlAddDevice                     = @"wide";
NSString * const UrlEditDevice                    = @"wide/0";
NSString * const UrlGetAllDevice                  = @"wide/";
NSString * const UrlGetArchivedDevices            = @"devicearchive/1";
NSString * const UrlGetADevice                    = @"device/";
NSString * const UrlDeleteDevice                  = @"wide/";
NSString * const UrlGetSecureDevice               = @"securedevice-pairing";
NSString * const UrlClearSecureDevice             = @"securedevice-pairing/1";
NSString * const UrlDeleteDevices                 = @"bulkdevice";
NSString * const UrlDevicesGroupAssociation       = @"";
NSString * const UrlGetDevicesGroupAssociation    = @"dvcgrpassoc/1";
NSString * const UrlUpdateDeviceOperationStatus   = @"directopstatus";
NSString * const UrlRequestForRemoteOperation     = @"operate";
NSString * const UrlUpdateRemoteOperationFeedback = @"operate/1";
NSString * const UrlCreateUpdateSubscription      = @"subscription/1";
NSString * const UrlGetSubscription               = @"subscription/1";
NSString * const UrlAddGroup                      = @"group";
NSString * const UrlEditGroup                     = @"group/0";
NSString * const UrlGetGroup                      = @"group/1";
NSString * const UrlGetArchivedGroups             = @"grouparchive/1";
NSString * const UrlDeleteGroup                   = @"group/";
NSString * const UrlDeleteGroups                  = @"bulkgroup";
NSString * const UrlSensorAssociation             = @"sensor/1";
NSString * const UrlGetSensorAssociation          = @"sensor/1";
NSString * const UrlGetArchivedSensorAssociation  = @"sensorassociationarchive/1";
NSString * const UrlMakeMultiSensor               = @"operate/";
NSString * const UrlSensorTriggerLog              = @"sensor";
NSString * const UrlSensorTriggerIntervalSet      = @"sensor/1";
NSString * const UrlGetCustomSensor               = @"customsensor/1";

NSString * const UrlMessageFetch                       = @"message/";
NSString * const UrlNotificationStatusUpdate           = @"notification/";
NSString * const UrlNotificationUpdate                 = @"notificationUpdate";//= @"notification/1";
NSString * const UrlMessageStatusUpdate                = @"message/";
NSString * const UrlResetMessageQueue                  = @"message/1";
NSString * const UrlGetMessageHistory                  = @"messagehistory/";

NSString * const UrlAddBeacon                          = @"library";
NSString * const UrlEditBeacon                         = @"library/1";
NSString * const UrlGetBeacon                          = @"library/1";
NSString * const UrlGetArchivedBeacon                  = @"beaconarchive/1";
NSString * const UrlDeleteBeacon                       = @"librarydelete";
NSString * const UrlDeleteABeacon                      = @"library/";

NSString * const UrlAddConfiguredBeacon                = @"configure";
NSString * const UrlEditConfiguredBeacon               = @"configure";
NSString * const UrlGetConfiguredBeacon                = @"configure/1";
NSString * const UrlDeleteConfiguredBeacon             = @"beaconconfigure/";

NSString * const UrlCreateDeviceBeaconAssociation      = @"listen";
NSString * const UrlGetDeviceBeaconAssociation         = @"listen/1";
NSString * const UrlGetArchivedDeviceBeaconAssociation = @"beaconlistenarchive/1";
NSString * const UrlDeleteDeviceBeaconAssociation      = @"listenbeacon/";

NSString * const UrlUpdateBeaconBatteryLevel           = @"beaconbattery/1";
NSString * const UrlUpdateBeaconDataLog                = @"beaconlog";

NSString * const UrlShutterUpdateAndFetch              = @"shutter/1";

NSString * const UrlAddFriends                         = @"friends";
NSString * const UrlGetFriends                         = @"friends/";
NSString * const UrlDeleteFriends                      = @"friends/";
NSString * const UrlFriendRequestAccept_Reject         = @"friends/1";

NSString * const UrlBridgeSet_Remove                   = @"bridge/1";

NSString * const UrlShareAccept_Reject                 = @"share/";
NSString * const UrlGetSharedGroups                    = @"share/1";
NSString * const UrlGetSharedDevices                   = @"share/";
NSString * const UrlCreateShare                        = @"share";

NSString * const UrlAddOrganization                    = @"organization";
NSString * const UrlEditOrganization                   = @"organization/1";
NSString * const UrlDeleteOrganization                 = @"bulkorganization";
NSString * const UrlDeleteAOrganization                = @"organization/";
NSString * const UrlGetOrganization                    = @"organization/1";

NSString * const UrlSetUpdateSnoozeTiming              = @"alert-settings";//= @"alert-settings/1";
NSString * const UrlCheckOut                           = @"alert/";
NSString * const UrlSelfAssignReset                    = @"alert";
NSString * const UrlListRoles                          = @"role/1";
NSString * const UrlListUsers                          = @"user/1";
NSString * const UrlDeleteUsers                        = @"user/";

NSString * const UrlAddTag                             = @"tagdetail";//= @"tagdata";
NSString * const UrlEditTag                            = @"editTag";//= @"tagdata/1";
NSString * const UrlGetTag                             = @"tagdetail/0";//= @"tagdata/1";
NSString * const UrlGetArchivedTag                     = @"tagarchive/1";
NSString * const UrlDeleteTag                          = @"bulktag";//= @"tag/";
NSString * const UrlDeleteATag                         = @"tagdetail/";
NSString * const UrlSecureTag                          = @"securetag-pairing";
NSString * const UrlDeleteSecureTag                    = @"securetag-pairing/1";
NSString * const UrlTagCheck                           = @"tagcheck";
NSString * const UrlGetListener                        = @"wide/0";//= @"listener/";
NSString * const UrlGetListenerZoneMapping             = @"listenerzonemap/";
NSString * const UrlGetListenerFromOrganizations       = @"listeners";
NSString * const UrlGetArchivedListeners               = @"YetToCome";
NSString * const UrlAddListener                        = @"wide";
NSString * const UrlAddSecureListener                  = @"securedevice-pairing";
NSString * const UrlDeleteSecureListener               = @"securedevice-pairing/1";
NSString * const UrlEditListener                       = @"wide/1";//= @"listener/1";

NSString * const UrlAddInfant                          = @"infant";
NSString * const UrlEditInfant                         = @"infant";
NSString * const UrlGetInfant                          = @"infant/0";
NSString * const UrlGetAInfant                         = @"infant/";
NSString * const UrlDeleteInfant                       = @"bulkinfant";
NSString * const UrlDeleteAInfant                      = @"infant/";
NSString * const UrlGetInfantFromOrganization          = @"infants";
NSString * const UrlGetArchivedInfant                  = @"infantarchive/1";
NSString * const UrlAddRule                            = @"tagrule";
NSString * const UrlEditRule                           = @"tagrule";
NSString * const UrlInfantTagAss                       = @"infanttaglink";

NSString * const UrlAddZone                            = @"zone";
NSString * const UrlEditZone                           = @"zone";
NSString * const UrlDeleteZone                         = @"bulkzone";
NSString * const UrlDeleteAZone                        = @"zone/";
NSString * const UrlGetZone                            = @"zone/0";
NSString * const UrlGetArchivedZone                    = @"YetToCome";
NSString * const UrlGetZoneListenerMapping             = @"zone/";
NSString * const UrlMapZoneListener                    = @"zone/1";
NSString * const UrlGetZoneFromOrganization            = @"zones";

NSString * const UrlGetMapSettings                     = @"map-file/1"; //= @"getMap";//
NSString * const UrlGetTrackingAlerts                  = @"message/3";
NSString * const UrlHealthCheck                        = @"healthcheck";

NSString * const UrlAddSchedule                        = @"";
NSString * const UrlEditSchedule                       = @"";
NSString * const UrlDeleteSchedule                     = @"";
NSString * const UrlGetSchedule                        = @"";

NSString * const UrlGetInfantPosition                  = @"infantposition/";

#pragma mark --- Common API Constants ---

NSString * const USER_NAME                             = @"userName";
NSString * const USER_EMAIL                            = @"userEmail";
NSString * const USER_DISPLAY_NAME                     = @"userDisplayName";
NSString * const DISPLAY_NAME                          = @"display_name";
NSString * const USER_PASSWORD                         = @"userPassword";
NSString * const USER_TYPE                             = @"userType";
NSString * const USER_STATUS                           = @"userStatus";
NSString * const USER_ID                               = @"userId";

NSString * const ORGANIZATION_ID                       = @"organizationId";

NSString * const NETWORK_ID                            = @"networkId";
NSString * const NETWORK_KEY                           = @"networkKey";

NSString * const RESPONSE_STATUS                       = @"Status";
NSString * const RESPONSE                              = @"Response";
NSString * const MESSAGE                               = @"message";
NSString * const NOTIFICATION_STATUS                   = @"notification_status";

NSString * const LAST_INSERT_ID                        = @"last_insert_id";
NSString * const RESPONSE_IS_NIL                       = @"Response is Nil";
NSString * const DEVICEID                              = @"deviceId";
NSString * const OSINFO                                = @"osInfo";
NSString * const EMAIL                                 = @"emailId";
NSString * const IS_BRIDGE                             = @"isBridge";
NSString * const ISBRIDGE                              = @"is_bridge";
NSString * const PHONE_LONG_ID                         = @"phoneLongId";
NSString * const PHONE_MESH_ID                         = @"phoneMeshId";
NSString * const OPERATION_MESSAGE_TIMESTAMP           = @"operationMessageTimestamp";
NSString * const OTHER_MESSAGE_TIMESTAMP               = @"otherMessageTimestamp";

NSString * const MESSAGE_ID                            = @"messageID";
NSString * const MESSAGEID                             = @"messageId";
NSString * const TOKEN                                 = @"token";
NSString * const GRP_DVC                               = @"grpDvc";
NSString * const OPERATION_ID                          = @"operation_id";
NSString * const OPERATIONID                           = @"operationId";
NSString * const PHONEOPERATIONID                      = @"phoneOperationId";
NSString * const STATUS                                = @"Status";
NSString * const _STATUS                               = @"status";
NSString * const MESSAGESTATUS                         = @"messageStatus";
NSString * const NEXT_STATUS                           = @"nextStatus";
NSString * const DEVICE_STATUS                         = @"deviceStatus";
NSString * const GROUP_STATUS                          = @"groupStatus";
NSString * const TIMESTAMP                             = @"timestamp";

NSString * const NEW_PASSWORD                          = @"newPassword";
NSString * const OLD_PASSWORD                          = @"oldPassword";
NSString * const NOTIFICATION                          = @"notification";

NSString * const OPERATION_SEQUENCE                    = @"operation_sequence";
NSString * const GROUP_OPERATION_SEQUENCE              = @"group_operation_sequence";
NSString * const SEQUENCENUMBER                        = @"sequenceNumber";
NSString * const GROUP_ASSOCIATION                     = @"groupAssociation";
NSString * const CHANNAL                               = @"channel";
NSString * const SENSORE_DATA                          = @"sensor_data";
NSString * const DATA                                  = @"Data";
NSString * const DEVICE_DETAILS                        = @"deviceDetails";
NSString * const GROUP_DETAILS                         = @"groupDetails";

NSString * const PARENT_GROUP_ID                       = @"parentGroupId";
NSString * const PARENT_GROUP_MESH_ID                  = @"parentGroupMeshId";
NSString * const GROUP_PATH                            = @"groupPath";
NSString * const PARENT_GROUP_PATH                     = @"parentGroupPath";
NSString * const OLD_GROUP_ID                          = @"oldGroupId";
NSString * const FRESH_GROUP_ID                        = @"newGroupId";
NSString * const GROUP_LEVEL                           = @"level";

NSString * const GROUP_ID                              = @"groupId";
NSString * const GROUP_SHORT_ID                        = @"groupShortId";
NSString * const GROUP_MESH_ID                         = @"groupMeshId";
NSString * const GRPDVCID                              = @"grpDvcId";
NSString * const GRPDVCSHOARTID                        = @"grpDvcMeshId";

NSString * const WISE_GROUP_NAME                       = @"groupName";
NSString * const WISE_GROUP_ICON_ID                    = @"groupIconId";
NSString * const WISE_GROUP_SEQUENCE_NUMBER            = @"groupSequenceNumber";

NSString * const SENSOR_ID                             = @"sensorId";
NSString * const SENSOR_MESH_ID                        = @"sensorMeshId";

NSString * const ID                                    = @"id";
NSString * const Id                                    = @"Id";
NSString * const ACTION                                = @"action";

NSString * const WISE_DEVICE_SHORT_ID                  = @"mobileDeviceId";
NSString * const DEVICE_SHORT_ID                       = @"deviceShortId";
NSString * const DEVICE_MESH_ID                        = @"deviceMeshId";
NSString * const WISE_DEVICE_NAME                      = @"deviceName";
NSString * const WISE_DEVICE_UUID                      = @"deviceUuid";
NSString * const WISE_DEVICE_GUUID                     = @"deviceGuuid";
NSString * const WISE_DEVICE_TYPE                      = @"deviceType";
NSString * const WISE_DEVICE_MAC                       = @"wide_mac";
NSString * const WISE_DEVICE_SEQUENCE_NUMBER           = @"deviceSequenceNumber";

NSString * const INTENSITY                             = @"intensity";
NSString * const COOL                                  = @"cool";
NSString * const WISE_DEVICE_PAIR_INFO                 = @"pairingInfo";
NSString * const HARDWARD_VERSION                      = @"hwVersion";
NSString * const SOFTWARE_VERSION                      = @"swVersion";
NSString * const FIRMWARE_VERSION                      = @"fmVersion";
NSString * const FEEDBACK                              = @"feedback";
NSString * const RGB                                   = @"rgb";
NSString * const TIMER                                 = @"timer";
NSString * const TIME                                  = @"time";
NSString * const OPERATE_PHONE_ID                      = @"operatePhoneId";
NSString * const IS_CONNECTABLE                        = @"conOrNot";

NSString * const MULTY_SENSORE_FLAG                    = @"multisensorFlag";
NSString * const TYPE                                  = @"type";
NSString * const DEVICE_UUID                           = @"device_uuid";
NSString * const START_TIME                            = @"start_time";
NSString * const END_TIME                              = @"end_time";
NSString * const OPERATION                             = @"operation";

NSString * const BEACON_NAME                           = @"beaconName";
NSString * const BEACON_UUID                           = @"beaconUuid";
NSString * const BEACON_MAJOR                          = @"beaconMajor";
NSString * const BEACON_MINOR                          = @"beaconMinor";
NSString * const BEACON_DATA                           = @"beaconData";
NSString * const BEACON_PREFIX                         = @"beaconPrefix";
NSString * const BEACON_ID                             = @"beaconId";
NSString * const TX_POWER                              = @"txPower";
NSString * const CAPABILITY                            = @"capability";
NSString * const ADV_INTERVAL                          = @"advInterval";
NSString * const BEACON_SLOT                           = @"beaconSlot";
NSString * const BEACON_RANGE_NAME                     = @"beaconRangeName";
NSString * const RANGE_RSSI                            = @"rangeRssi";
NSString * const BEACON_TYPE                           = @"beaconType" ;
NSString * const BEACON_ACTION                         = @"beaconAction";
NSString * const BATTARY_LEVEL                         = @"batteryLevel";
NSString * const CALIBRATED_VALUE                      = @"calibratedValue";
NSString * const  BEACON_LONG_ID                       = @"beacon_long_id";
NSString * const TIME_STAMP_BATTARY_LEVEL              = @"tme_stamp_batt_level";
NSString * const DEVICE_NAME                           = @"device_name";
NSString * const  FLAG                                 = @"flag";
NSString * const DEVICE_BEACON_DATA                    = @"device_beacon_data";
NSString * const BEACONID                              = @"beaconId";
NSString * const BEACON_MESH_ID                        = @"beaconMeshId";
NSString * const BEACON_STATUS                         = @"beaconStatus";
NSString * const LISTEN_STATUS                         = @"listenStatus";

NSString * const TRIGGER                               = @"trigger";
NSString * const PHONE_DEVICE_ID                       = @"phoneDeviceId";
NSString * const SENSORID                              = @"sensorId";
NSString * const SENSOR_LONG_ID                        = @"sensor_long_id";
NSString * const SENSOR_LINK_ID                        = @"sensorLinkId";

NSString * const TIEM                                  = @"time";
NSString * const STARTTIME                             = @"startTime";
NSString * const ENDTIME                               = @"endTime";


NSString * const REMOTE_ID                             = @"remote_id";
NSString * const VALUES                                = @"value";
NSString * const SLOT                                  = @"slot";
NSString * const SHUTTER_DATA                          = @"shutter_data";

NSString * const FRIEND_ID                             = @"friend_id";
NSString * const ACCEPT_REJECT                         = @"accept_reject";
NSString * const ACPT_REJECT                           = @"acpt_reject";

NSString * const PHONEID                               = @"phoneId";
NSString * const PHONEId                               = @"phoneId";
NSString * const SHARE_USER                            = @"share_user";
NSString * const COUNT                                 = @"count";
NSString * const CHECK                                 = @"check";
NSString * const LAST_UPDATED                          = @"last_updated";
NSString * const ICON_URL                              = @"icon_url";
NSString * const SUB_USER_ID                           = @"sub_user_id";
NSString * const GROUP_DEVICE                          = @"group_device";

NSString * const MODELINFO                             = @"modelInfo";
NSString * const DEVICETOKEN                           = @"deviceToken";
NSString * const ORGANIZATIONID                        = @"organizationId";
NSString * const APPVERSION                            = @"appVersion";
NSString * const APP_ID                                = @"appID";
NSString * const APPId                                 = @"appId";
NSString * const USER_DEFAULT_GROUP_ID                 = @"userDefaultGroupId";

NSString * const API_ID                                = @"apiId";
NSString * const API_Id                                = @"apiId";
NSString * const STATUS_CODE                           = @"statusCode";
NSString * const _STATUS_CODE                          = @"statusCode";
NSString * const STATUS_MESSAGE                        = @"statusMessage";
NSString * const GROUP_COUNT                           = @"groupCount";
NSString * const DEVICE_COUNT                          = @"deviceCount";

NSString * const START                                 = @"start";
NSString * const END                                   = @"end";
NSString * const  LIMIT                                = @"limit";
NSString * const  OPERATION_LOG_ID                     = @"operateLogId";
NSString * const  ENCDATA                              = @"encData";
NSString * const  ENCBRIDGEDATA                        = @"encBridgeData";
NSString * const  ENCKEY                               = @"encKey";
NSString * const  OLID                                 = @"olid";
NSString * const  MESSAGE_ARRAY                        = @"messageArray";
NSString * const  APPLICATION_DATA                     = @"application_data";
NSString * const  APPLICATIONDATA                      = @"applicationData";
NSString * const  UUID                                 = @"uuid";
NSString * const  OPID                                 = @"opid";
NSString * const  WARM_COOL                            = @"warmCool";
NSString * const  WARM                                 = @"warm";
NSString * const  MSG_ID_ARRAY                         = @"msgIdArray";
NSString * const  SENSOR_LINKID_STATUS                 = @"sensorLinkIdstatus";
NSString * const  SUBSCRIPTIONID                       = @"subscriptionId";
NSString * const  SUBSCRIPTION_ID                      = @"subscription_id";
NSString * const  BRIDGEDATA                           = @"bridgeData";

NSString * const  BEACON_DEVICE_ASSOCIATION_COUNT      = @"beaconDeviceAssociationCount";
NSString * const  BEACON_DEVICE_ASSOCIATION_DETAILS    = @"beaconDeviceAssociationDetails";

NSString * const  SENSOR_ASSOCIATION_COUNT             = @"sensorAssociationCount";
NSString * const  SENSOR_ASSOCIATION_DETAILS           = @"sensorAssociationDetails";

NSString * const  BEACON_COUNT                         = @"beaconCount";
NSString * const  BEACON_DETAILS                       = @"beaconDetails";

NSString * const  MESSAGE_COUNT                        = @"messageCount";
NSString * const  MESSAGE_DETAILS                      = @"messageDetails";

NSString * const  DEVICES                              = @"devices";
NSString * const  GROUPS                               = @"groups";

NSString * const  DEVICE_TOKEN                         = @"deviceToken";

NSString * const  ORG_NAME                             = @"organizationName";
NSString * const  CUSTOMER_ID                          = @"customerId";
NSString * const  ORG_ID                               = @"organizationId";
NSString * const  ROOT_ORG_ID                          = @"rootOrganizationId";
NSString * const  ORG_COUNT                            = @"organizationCount";
NSString * const SUB_ORG_DETAILS                       = @"subOrganizationDetails";
NSString * const SUB_ORG_ID                            = @"subOrganizationId";
NSString * const PERMISSION_ID                         = @"permissionId";
NSString * const ORG_DETAILS                           = @"organizationDetails";
NSString * const PARENT_ID                             = @"parentId";
NSString * const  DEVICE_GROUP_ASSOCIATION_COUNT       = @"deviceGroupAssociationCount";
NSString * const  DEVICE_GROUP_ASSOCIATION_DETAILS     = @"deviceGroupAssociationDetails";
NSString * const ASSOCIATION_MESSAGE                   = @"associationMessage";

NSString * const ALERT_TYPE                            = @"alertType";
NSString * const ALERT_ID                              = @"alertId";
NSString * const SNOOZE_TIME                           = @"snoozeTime";
NSString * const SNOOZE_COUNT                          = @"snoozeCount";
NSString * const CHECKOUT_INTERVAL                     = @"checkOutInterval";

NSString * const TAG_CLOUD_ID                          = @"tagcloudId";
NSString * const ASSIGN_NAME                           = @"assignName";
NSString * const NOTIFICATION_ID_ARRAY                 = @"notificationIdArray";
NSString * const NOTIFICATION_ID                       = @"notificationId";

NSString * const ROLE_ID                               = @"roleId";
NSString * const ROLE_NAME                             = @"roleName";

NSString * const TAG_ID                                = @"tagId";
NSString * const TAG_MESH_ID                           = @"tagMeshId";
NSString * const TAG_NAME                              = @"tagName";
NSString * const TAG_MAJOR                             = @"tagMajor";
NSString * const TAG_MINOR                             = @"tagMinor";
NSString * const TAG_COUNT                             = @"tagCount";
NSString * const TAG_DETAILS                           = @"tagDetails";
NSString * const TAG_ARCHIVE_DETAILS                   = @"tagArchiveDetails";
NSString * const TAG_ARCHIVE_COUNT                     = @"tagArchiveCount";

NSString * const LISTENER_ID                           = @"listenerId";
NSString * const LISTENER_MESH_ID                      = @"listenerMeshId";
NSString * const LISTENER_NAME                         = @"listenerName";
NSString * const LATITUDE                              = @"latitude";
NSString * const LONGTITUDE                            = @"longitude";
NSString * const MIN_RSSI                              = @"minRssi";
NSString * const LISTENER_COUNT                        = @"listenerCount";
NSString * const LISTENER_DETAILS                      = @"listenerDetails";

NSString * const ZONE_ID                               = @"zoneId";
NSString * const ZONE_TYPE                             = @"zoneType";
NSString * const ZONE_SAFE_TIME                        = @"zoneSafeTime";
NSString * const ZONE_NAME                             = @"zoneName";
NSString * const ZONE_RULES                            = @"zoneRules";
NSString * const ZONE_COUNT                            = @"zoneCount";
NSString * const SUB_ORGANIZATION_ZONE_DETAILS         = @"subOrganizationZoneDetails";
NSString * const ZONE_DETAILS                          = @"zoneDetails";
NSString * const ZONE_MAPPING                          = @"zoneMap";
NSString * const MAPPING_DETAILS                       = @"mapDetails";

NSString * const INFANT_ID                             = @"infantId";
NSString * const INFANT_HOS_ID                         = @"infantHosId";
NSString * const INFANT_FNAME                          = @"infantFname";
NSString * const INFANT_LNAME                          = @"infantLname";
NSString * const INFANT_NAME                           = @"infantName";
NSString * const INFANT_COUNT                          = @"infantCount";
NSString * const INFANT_DETAILS                        = @"infantDetails";
NSString * const CHECK_OUT_STATUS                      = @"checkOutStatus";
NSString * const INFANT_ARCHIVED_COUNT                 = @"infantArchiveCount";
NSString * const INFANT_ARCHIVED_DETAILS               = @"infantArchiveDetails";

NSString * const CUSTOMER_KEY                          = @"customerKey";
NSString * const MAP_STATUS                            = @"mapStatus";
NSString * const MAP_MESSAGE                           = @"mapMessage";

NSString * const DEVICE_SECURITY_KEY                   = @"deviceSecurityKey";
NSString * const OWNER_SHIP_CHANGE_STATUS              = @"ownershipChangeStatus";

NSString * const LISTENER_MAP                          = @"listenerMap";
NSString * const ACTIVE                                = @"active";

NSString * const DEVICE_PAIRTING_KEY                   = @"devicePairingKey";

NSString * const VERSION                               = @"version";
NSString * const FILE_NAME                             = @"fileName";
NSString * const FILE_PATH                             = @"filePath";
NSString * const SCALING_FACTOR                        = @"scalingFactor";
NSString * const FILE_SIZE                             = @"fileSize";
NSString * const MAP_BOUNDARIES                        = @"mapBoundaries";
NSString * const TEMP_ID                               = @"tempId";

NSString * const USER_COUNT                            = @"userCount";
NSString * const USER_DETAILS                          = @"userDetails";
NSString * const MESSAGE_TYPE                          = @"messageType";
NSString * const LAYER_ID                              = @"layerId";
NSString * const EXTRA_MESSAGE                         = @"extraMessage";
NSString * const TAG_STATUS                            = @"tagStatus";
NSString * const RSSI                                  = @"rssi";
NSString * const CONFIDENT_LEVEL                       = @"confidenceLevel";

@end
