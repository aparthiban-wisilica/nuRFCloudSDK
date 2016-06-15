//
//  WiSeNetworkErrorConstants.m
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 06/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeNetworkErrorConstants.h"

@implementation WiSeNetworkErrorConstants

// Internet Connection Constants
NSString * const WiSeNetworkFailErrorDecription                  = @"No Internet Connection. Please check your internet connection. Try Later!";
NSString * const WiSeNetworkFailDomainError                      = @"Internet Connection Failed";

// Password Encrption  Constants
NSString * const WiSePasswordEncryptErrorDecription              = @"Password Encryption";
NSString * const WiSePasswordEncryptDomainError                  = @"Could not create sha algorithm. Password contains invalid charectors.";

// WiSeCloudApiRequest Constants
NSString * const WiSeCloudApiRequestDescriptionForError          = @"WiSeCloudApiRequest is nil";
NSString * const WiSeCloudApiRequestDomainError                  = @"Init WiSeNetworkConnection";

// Sign Up API Constants
NSString * const SignUpURLKey                                    = @"SignUp";
NSString * const SignUpFailedErrorDomain                         = @"Handling SignUp Response";

// Add User API Constants
NSString * const AddUserURLKey                                   = @"Add User";
NSString * const AddUserFailedErrorDomain                        = @"Handling Add User Response";

// Edit User API Constants
NSString * const EditUserURLKey                                  = @"Edit User";
NSString * const EditUserFailedErrorDomain                       = @"Handling Edit User Response";

// Login In API Constants
NSString * const LoginURLKey                                     = @"Login";
NSString * const LoginFailedErrorDomain                          = @"Handling Login Response";

// Change Password API Constants
NSString * const ChangePasswordURLKey                            = @"Change Password";
NSString * const ChangePasswordFailedErrorDomain                 = @"Handling Change Password Response";

// Forgot Password API Constants
NSString * const ForgotPasswordURLKey                            = @"Forgot Password";
NSString * const ForgotPasswordFailedErrorDomain                 = @"Handling Forgot Password Response";

// Logout API Constants
NSString * const LogoutURLKey                                    = @"Logout";
NSString * const LogoutFailedErrorDomain                         = @"Handling  Logout Response";

// Update Device Token API Constants
NSString * const UpdateDeviceTokenURLKey                         = @"Update Device Token";
NSString * const UpdateDeviceTokenFailedErrorDomain              = @"Handling Update Device Token Response";

// Add Device API Constants
NSString * const AddDeviceURLKey                                 = @"Add Device";
NSString * const AddDeviceFailedErrorDomain                      = @"Handling Add Device Response";

// Get All Device API Constants

NSString * const GetAllDeviceURLKey                              = @"Get All Device";
NSString * const GetArchiveDeviceURLKey                          = @"Get Archived Devices";
NSString * const GetAllDeviceFailedErrorDomain                   = @"Handling Get All Device Response";
NSString * const GetADeviceFailedErrorDomain                     = @"Handling Get A Device Request";

// Edit Device API Constants
NSString * const EditDeviceURLKey                                = @"Edit Device";
NSString * const EditDeviceFailedErrorDomain                     = @"Handling Edit Device Response";

// Delete Device API Constants
NSString * const DeleteDeviceURLKey                              = @"Delete Device";
NSString * const DeleteDeviceFailedErrorDomain                   = @"Handling Delete Device Response";

// Device Group Association API Constants
NSString * const DeviceGroupAssociationURLKey                      = @"Device Group Association";
NSString * const DeviceGroupAssociationFailedErrorDomain           = @"Handling WiSe Device Group Association Response";

// Secure Device Pairing API Constants
NSString * const SecureDevicePairingURLKey                         = @"Secure Device Pairing";
NSString * const SecureDevicePairingFailedErrorDomain              = @"Handling Secure Device Pairing Response";

// Clear Secure Device Pairing API Constants
NSString * const ClearSecureDevicePairingURLKey                    = @"Clear Secure Device Pairing";
NSString * const ClearSecureDevicePairingFailedErrorDomain         = @"Handling Clear Secure Device Pairing";

// Get Device Group Association API Constants
NSString * const GetDeviceGroupAssociationURLKey                 = @"Get Device Group Association";
NSString * const GetDeviceGroupAssociationFailedErrorDomain      = @"Handling Get Device Group Association";

// Update Direct Operation Status API Constants
NSString * const UpdateDirectOperationInitErrorDescription       = @"WiSeUpdateDirectOperationStatusAPIRequest is nil";
NSString * const UpdateDirectOperationInitErrorDomain            = @"Init WiSeUpdateDirectOperationStatusAPIRequest";
NSString * const UpdateDirectOperationURLKey                     = @"Update Direct Operation Status";
NSString * const UpdateDirectOperationFailedErrorDomain          = @"Handling Update Direct Operation Status Response";

// Request For Remote Operation API Constants
NSString * const RequestForRemoteOperationURLKey                 = @"Request For Remote Operation";
NSString * const RequestForRemoteOperationFailedErrorDomain      = @"Handling Request For Remote Operation Response";

// Add Group API Constants
NSString * const AddGroupURLKey                                  = @"Add Group";
NSString * const AddGroupErrorDomain                             = @"Handling Add Group Response";

// Edit Group API Constants
NSString * const EditGroupURLKey                                 = @"Edit Group";
NSString * const EditGroupErrorDomain                            = @"Handling Edit Group Response";

// Get Group API Constants

NSString * const GetGroupURLKey                                  = @"Get Group";
NSString * const GetArchivedGroupURLKey                          = @"Get Archived Groups";
NSString * const GetGroupErrorDomain                             = @"Handling Get Group Response";

// Delete Group API Constants
NSString * const DeleteGroupURLKey                               = @"Delete Group";
NSString * const DeleteGroupFailedErrorDomain                    = @"Handling Delete Group Response";

// Sensor Association API Constants
NSString * const SensorAssociationURLKey                         = @"Sensor Association";
NSString * const SensorAssociationFailedErrorDomain              = @"Handling Sensor Association Response";

// Get Sensor Association API Constants

NSString * const GetSensorAssociationURLKey                      = @"Get Sensor Association";
NSString * const GetArchivedSensorAssociationURLKey              = @"Get Archived Sensor Association";
NSString * const GetSensorAssociationFailedErrorDomain           = @"Handling Get Sensor Association Response";

// Message Fetch API Constants
NSString * const MessageFetchURLKey                              = @"Message Fecth";
NSString * const MessageFetchFailedErrorDomain                   = @"Handling Message Fetch Response";

// Get Tracking Alerts API Constants
NSString * const GetTrackingAlertURLKey                          = @"Get Tracking Alerts";
NSString * const GetTrackingAlertFailedErrorDomain               = @"Handling Get Tracking Alerts Response";

// Get Message History API Constants
NSString * const GetMessageHistoryURLKey                         = @"Get Message History";
NSString * const GetMessageHistoryErrorDomain                    = @"Handling Get Message History Response";

// Notification Stauts Update API Constants
NSString * const NotificationStatusUpdateURLKey                  = @"Notification Stauts Update";
NSString * const NotificationStatusUpdateFailedErrorDomain       = @"Handling Notification Status Update Response";

// Message Stauts Update API Constants
NSString * const MessageStatusUpdateURLKey                       = @"Message Stauts Update";
NSString * const MessageStatusUpdateFailedErrorDomain            = @"Handling Message Status Update Response";

// Reset Message Queue API Constants
NSString * const ResetMessageQueueURLKey                         = @"Reset Message Queue";
NSString * const ResetMessageQueueFailedErrorDomain              = @"Handling Get Message History Response";

// Update User Profile API Constants
NSString * const UpdateUserProfileURLKey                         = @"Update User Profile";
NSString * const UpdateUserProfileFailedErrorDomain              = @"Handling Update User Profile Response";

// Add Beacon API Constants
NSString * const AddBeaconURLKey                                 = @"Add Beacon";
NSString * const AddBeaconFailedErrorDomain                      = @"Handling Add Beacon Response";

// Edit Beacon API Constants

NSString * const EditBeaconURLKey                                = @"Edit Beacon";
NSString * const EditBeaconFailedErrorDomain                     = @"Handling Edit Beacon Response";

// Get Beacon API Constants
NSString * const GetBeaconURLKey                                 = @"Get Beacon";
NSString * const GetArchivedBeaconURLKey                         = @"Get Archived Beacon";
NSString * const GetBeaconFailedErrorDomain                      = @"Handling Get Beacon Response";

// Delete Beacon API Constants
NSString * const DeleteBeaconURLKey                              = @"Delete Beacon";
NSString * const DeleteBeaconFailedErrorDomain                   = @"Handling Delete Beacon Response";

// Add Configured Beacon API Constants
NSString * const AddConfiguredBeaconURLKey                       = @"Add Configured Beacon";
NSString * const AddConfiguredBeaconFailedErrorDomain            = @"Handling Add Configured Beacon Response";

// Edit Configured Beacon API Constants
NSString * const EditConfiguredBeaconURLKey                      = @"Edit Configured Beacon";
NSString * const EditConfiguredBeaconFailedErrorDomain           = @"Handling Edit Configured Beacon Response";

// Get Configured Beacon API Constants
NSString * const GetConfiguredBeaconURLKey                       = @"Get Configured Beacon";
NSString * const GetConfiguredBeaconFailedErrorDomain            = @"Handling Get Configured Beacon Response";

// Delete Configured Beacon API Constants
NSString * const DeleteConfiguredBeaconURLKey                    = @"Delete Configured Beacon";
NSString * const DeleteConfiguredBeaconFailedErrorDomain         = @"Handling Delete Configured Beacon Response";

// Create Device Beacon Association API Constants
NSString * const DeviceBeaconAssociationURLKey                   = @"Create Device Beacon Association";
NSString * const CreateDeviceBeaconAssociationFailedErrorDomain  = @"Handling Create Device Beacon Association Response";

// Get Device Beacon Association API Constants
NSString * const GetDeviceBeaconAssociationURLKey                = @"Get Device Beacon Association";
NSString * const GetArchivedDeviceBeaconAssociationURLKey        = @"Get Archived Device Beacon Association";
NSString * const GetDeviceBeaconAssociationFailedErrorDomain     = @"Handling Get Device Beacon Association Response";

// Delete Device Beacon Association API Constants
NSString * const DeleteDeviceBeaconAssociationURLKey             = @"Delete Device Beacon Association";
NSString * const DeleteDeviceBeaconAssociationFailedErrorDomain  = @"Handling Delete Device Beacon Association Response";

// Update Beacon Battery Level API Constants
NSString * const UpdateBeaconBatteryLevelURLKey                  = @"Update Beacon Battery Level";
NSString * const UpdateBeaconBatteryLevelFailedErrorDomain       = @"Handling Update Beacon Battery Level Response";

// Update Beacon Data Log API Constants
NSString * const UpdateBeaconDataLogURLKey                       = @"Update Beacon Data Log";
NSString * const UpdateBeaconDatatLogFailedErrorDomain           = @"Handling Update Beacon Data Log Response";

// Make Multi Sensor API Constants
NSString * const MakeMultiSensorInitErrorDescription             = @"WiSeMakeMultiSensorAPIRequest is nil";
NSString * const MakeMultiSensorInitErrorDomain                  = @"Init WiSeMakeMultiSensorAPIRequest";
NSString * const MakeMultiSensorURLKey                           = @"Make Multi Sensor";
NSString * const MakeMultiSensorFailedErrorDomain                = @"Handling Make Multi Sensor Response";

// Sensor Trigger Log API Constants
NSString * const SensorTriggerLogInitErrorDescription            = @"WiSeSensorTriggerLogAPIRequest is nil";
NSString * const SensorTriggerLogInitErrorDomain                 = @"Init WiSeSensorTriggerLogAPIRequest";
NSString * const SensorTriggerLogURLKey                          = @"Sensor Trigger Log";
NSString * const SensorTriggerLogFailedErrorDomain               = @"Handling Sensor Trigger Log Response";

// Sensor Trigger Interval Set API Constants
NSString * const SensorTriggerIntervalSetInitErrorDescription    = @"WiSeSensorTriggerIntervalSetAPIRequest is nil";
NSString * const SensorTriggerIntervalSetInitErrorDomain         = @"Init WiSeSensorTriggerIntervalSetAPIRequest";
NSString * const SensorTriggerIntervalSetURLKey                  = @"Sensor Trigger Interval Set";
NSString * const SensorTriggerIntervalSetErrorDomain             = @"Handling Sensor Trigger Interval Set Request";

// Shutter Update API Constants
NSString * const ShutterUpdateInitErrorDescription               = @"WiSeShutterUpdateAPIRequest is nil";
NSString * const ShutterUpdateInitErrorDomain                    = @"Init WiSeShutterUpdateAPIRequest";
NSString * const ShutterUpdateURLKey                             = @"Shutter Update";
NSString * const ShutterUpdateErrorDomain                        = @"Handling WiSeShutterUpdateAPIResponse";

// Shutter Fetch API Constants
NSString * const ShutterFetchInitErrorDescription                = @"WiSeShutterFetchAPIRequest is nil";
NSString * const ShutterFetchInitErrorDomain                     = @"Init WiSeShutterFetchAPIRequest";
NSString * const ShutterFetchURLKey                              = @"Shutter Fetch";
NSString * const ShutterFetchErrorDomain                         = @"Handling WiSeShutterFetchAPIResponse";

// Add Friends API Constants
NSString * const AddFriendInitErrorDescription                   = @"WiSeAddFriendAPIRequest is nil";
NSString * const AddFriendInitErrorDomain                        = @"Init WiSeAddFriendAPIRequest";
NSString * const AddFriendURLKey                                 = @"Add Friends";
NSString * const AddFriendFailedErrorDomain                      = @"Handling WiSeAddFriendAPIResponse";

// Get Friends API Constants
NSString * const GetFriend_UsersInitErrorDescription             = @"WiSeGetFriends_UsersAPIRequest is nil";
NSString * const GetFriend_UsersInitErrorDomain                  = @"Init WiSeGetFriends_UsersAPIRequest";
NSString * const GetFriend_UsersURLKey                           = @"Get Friends";
NSString * const GetFriend_UsersFailedErrorDomain                = @"Handling WiSeGetFriends_UsersAPIResponse";

// Delete Friends API Constants
NSString * const DeleteFriendInitErrorDescription                = @"WiSeDeleteFriendAPIRequest is nil";
NSString * const DeleteFriendInitErrorDomain                     = @"Init WiSeDeleteFriendAPIRequest";
NSString * const DeleteFriendURLKey                              = @"Delete Friend";
NSString * const DeleteFriendFailedErrorDomain                   = @"Handling WiSeDeleteFriendAPIResponse";

// Friends Request Accept_Reject API Constants
NSString * const FriendsRequestAccept_RejectInitErrorDescription = @"WiSeFriendRequestAccept_RejectAPIRequest is nil";
NSString * const FriendsRequestAccept_RejectInitErrorDomain      = @"Init WiSeFriendRequestAccept_RejectAPIRequest";
NSString * const FriendsRequestAccept_RejectURLKey               = @"Friends Request Accept_Reject";
NSString * const FriendsRequestAccept_RejectFailedErrorDomain    = @"Handling WiSeFriendRequestAccept_RejectAPIResponse";

// Bridge Set_Remove API Constants
NSString * const BridgeSet_RemoveInitErrorDescription            = @"WiSeBridgeSet_RemoveAPIRequest is nil";
NSString * const BridgeSet_RemoveInitErrorDomain                 = @"Init WiSeBridgeSet_RemoveAPIRequest";
NSString * const BridgeSet_RemoveURLKey                          = @"Bridge Set_Remove";
NSString * const BridgeSet_RemoveFailedErrorDomain               = @"Handling WiSeBridgeSet_RemoveAPIResponse";

// Share Accept_Reject API Constants
NSString * const ShareAccept_RejectInitErrorDescription          = @"WiSeShareAccept_RejectAPIRequest is nil";
NSString * const ShareAccept_RejectInitErrorDomain               = @"Init WiSeShareAccept_RejectAPIRequest";
NSString * const ShareAccept_RejectURLKey                        = @"Share Accept_Reject";
NSString * const ShareAccept_RejectFailedErrorDomain             = @"Handling WiSeShareAccept_RejectAPIResponse";

// Get Shared Groups API Constants
NSString * const GetSharedGroupsInitErrorDescription             = @"WiSeGetSharedGroupsAPIRequest is nil";
NSString * const GetSharedGroupsInitErrorDomain                  = @"Init WiSeGetSharedGroupsAPIRequest";
NSString * const GetSharedGroupsURLKey                           = @"Get Shared Groups";
NSString * const GetSharedGroupsFailedErrorDomain                = @"Handling WiSeGetSharedGroupsAPIResponse";

// Get Shared Devices API Constants
NSString * const GetSharedDevicesInitErrorDescription            = @"WiSeGetSharedDevicesAPIRequest is nil";
NSString * const GetSharedDevicesInitErrorDomain                 = @"Init WiSeGetSharedDevicesAPIRequest";
NSString * const GetSharedDevicesURLKey                          = @"Get Shared Devices";
NSString * const GetSharedDevicesFailedErrorDomain               = @"Handling WiSeGetSharedDevicesAPIResponse";

// Create Share API Constants
NSString * const CreateShareInitErrorDescription                 = @"WiSeShareCreateAPIRequest is nil";
NSString * const CreateShareInitErrorDomain                      = @"Init WiSeShareCreateAPIRequest";
NSString * const CreateShareURLKey                               = @"Create Share";
NSString * const CreateShareFailedErrorDomain                    = @"Handling WiSeShareCreateAPIResponse";

// Save App Info API Constants
NSString * const SaveAppInfoURLKey                               = @"Register App";
NSString * const SaveAppInfoFailedErrorDomain                    = @"Handling Register App Response";

// Update Save App Info API Constants
NSString * const UpdateSaveAppInfoURLKey                         = @"Update Register App";
NSString * const UpdateSaveAppInfoFailedErrorDomain              = @"Handling Update Register App Response";

// Update Remote Operation Feedback API Constants
NSString * const UpdateRemoteOperationFeedbackURLKey             = @"Update Remote Operation Feedback";
NSString * const UpdateRemoteOperationFeedbackFailedErrorDomain  = @"Handling Update Remote Operation Feedback Response";

// Create/Update Subscription API Constants

NSString * const CreateUpdateSubscriptionURLKey                  = @"Create/Update Subscription";
NSString * const CreateUpdateSubscriptionFailedErrorDomain       = @"Handling Create/Update Subscription Response";

// Get Subscription API Constants

NSString * const GetSubscriptionURLKey                           = @"Get Subscription";
NSString * const GetSubscriptionFailedErrorDomain                = @"Handling Get Subscription Response";

// Add Organization API Constants
NSString * const AddOrganizationURLKey                           = @"Add Organization";
NSString * const AddOrganizationFailedErrorDomain                = @"Handling Add Organization Response";

// Edit Organization API Constants
NSString * const EditOrganizationURLKey                          = @"Edit Organization";
NSString * const EditOrganizationFailedErrorDomain               = @"Handling Edit Organization Response";

// Delete Organization API Constants
NSString * const DeleteOrganizationURLKey                        = @"Delete Organization";
NSString * const DeleteOrganizationFailedErrorDomain             = @"Handling Delete Organization Response";

// Get Organization API Constants
NSString * const GetOrganizationURLKey                           = @"Get Organization";
NSString * const GetOrganizationFailedErrorDomain                = @"Handling Get Organization Response";

// Set/Update Snooze Timing API Constants
NSString * const SetUpdateSnoozeTimingURLKey                     = @"Set/Update Snooze Timing";
NSString * const SetUpdateSnoozeTimingFailedErrorDomain          = @"Handling Set/Update Snooze Timing Response";

// Enable/Disable CheckOut API Constants
NSString * const EnableDisableCheckOutURLKey                     = @"Enable/Disable CheckOut";
NSString * const EnableDisableCheckOutFailedErrorDomain          = @"Handling Enable/Disable CheckOut Response";

// Self Assign-Assign Reset API Constants
NSString * const SelfAssignResetURLKey                           = @"Self Assign-Assign Reset";
NSString * const SelfAssignResetFailedErrorDomain                = @"Handling Self Assign-Assign Reset Response";

// List Roles API Constants
NSString * const ListRolesURLKey                                 = @"List Roles";
NSString * const ListRolesFailedErrorDomain                      = @"Handling List Roles Response";

// List Users API Constants
NSString * const ListUsersURLKey                                 = @"List Users";
NSString * const ListUsersFailedErrorDomain                      = @"Handling List Users Response";

// Delete User API Constants
NSString * const DeleteUsersURLKey                               = @"Delete/Disable User";
NSString * const DeleteUsersFailedErrorDomain                    = @"Handling Delete/Disable User Response";

// Add Tag API Constants
NSString * const AddTagURLKey                                    = @"Add Tag";
NSString * const AddTagFailedErrorDomain                         = @"Handling Add Tag Response";

// Edit Tag API Constants
NSString * const EditTagURLKey                                   = @"Edit Tag";
NSString * const EditTagFailedErrorDomain                        = @"Handling Edit Tag Response";

// Get Tag API Constants
NSString * const GetTagURLKey                                    = @"Get Tag";
NSString * const GetTagFailedErrorDomain                         = @"Handling Get Tag Response";

// Get Archived Tag API Constants
NSString * const GetArchivedTagURLKey                            = @"Get Archived Tag";
NSString * const GetArchivedTagFailedErrorDomain                 = @"Handling Get Archived Tag Response";

// Delete Tag API Constants
NSString * const DeleteTagURLKey                                 = @"Delete Tag";
NSString * const DeleteTagFailedErrorDomain                      = @"Handling Delete Tag Response";

// Secure Tag API Constants
NSString * const SecureTagURLKey                                 = @"Secure Tag";
NSString * const SecureTagFailedErrorDomain                      = @"Handling Secure Tag Response";

// Delete Secure Tag API Constants
NSString * const DeleteSecureTagURLKey                           = @"Delete Secure Tag";
NSString * const DeleteSecureTagFailedErrorDomain                = @"Handling Delete Secure Response";

// Check Tag API Constants
NSString * const CheckTagURLKey                                  = @"Tag Check";
NSString * const CheckTagFailedErrorDomain                       = @"Handling Tag Check Response";

// Get Listener API Constants
NSString * const GetListenerURLKey                               = @"Get Listener";
NSString * const GetListenerFailedErrorDomain                    = @"Handling Get Listener Response";

// Get Archived Listener API Constants
NSString * const GetArchivedListenerURLKey                       = @"Get Archived Listener";
NSString * const GetArchivedListenerFailedErrorDomain            = @"Handling Get Archived Listener Response";

// Get Listener API Constants
NSString * const GetListenerZoneMappingURLKey                    = @"Get Listener Zone Mapping";
NSString * const GetListenerZoneMappingFailedErrorDomain         = @"Handling Get Listener Zone Mapping Response";

// Get Listener From Organizations API Constants
NSString * const GetListenerFromOrganizationsURLKey              = @"Get Listener From Organizations";
NSString * const GetListenerFromOrganizationsFailedErrorDomain   = @"Handling Get Listener From Organizations Response";

// Add Listener API Constants
NSString * const AddListenerURLKey                               = @"Add Listener";
NSString * const AddListenerFailedErrorDomain                    = @"Handling Add Listener Response";

// Add Secure Listener API Constants
NSString * const AddSecureListenerURLKey                         = @"Get Secure Listener";
NSString * const AddSecureListenerFailedErrorDomain              = @"Handling Get Secure Listener Response";

// Delete Secure Listener API Constants
NSString * const DeleteSecureListenerURLKey                      = @"Delete Secure Listener";
NSString * const DeleteSecureListenerFailedErrorDomain           = @"Handling Delete Secure Listener Response";

// Edit Listener API Constants
NSString * const EditListenerURLKey                              = @"Edit Listener";
NSString * const EditListenerFailedErrorDomain                   = @"Handling Edit Listener Response";

// Delete Device API Constants
NSString * const DeleteListenerURLKey                            = @"Delete Listener";
NSString * const DeleteListenerFailedErrorDomain                 = @"Handling Delete Listener Response";

// Add Infant API Constants
NSString * const AddInfantURLKey                                 = @"Add Infant";
NSString * const AddInfantFailedErrorDomain                      = @"Handling Add Infant Response";

// Edit Infant API Constants
NSString * const EditInfantURLKey                                = @"Edit Infant";
NSString * const EditInfantFailedErrorDomain                     = @"Handling Edit Infant Response";

// Get Infant API Constants
NSString * const GetInfantURLKey                                 = @"Get Infant";
NSString * const GetInfantFailedErrorDomain                      = @"Handling Get Infant Response";

// Get Archived Infant API Constants
NSString * const GetArchivedInfantURLKey                         = @"Get Archived Infant";
NSString * const GetArchivedInfantFailedErrorDomain              = @"Handling Get Archived Infant Response";

// Delete Infant API Constants
NSString * const DeleteInfantURLKey                              = @"Delete Infant";
NSString * const DeleteInfantFailedErrorDomain                   = @"Handling Delete Infant Response";

// Get Infant From Organizations API Constants
NSString * const GetInfantFromOrganizationsURLKey                = @"Get Infant From Organizations";
NSString * const GetInfantFromOrganizationsFailedErrorDomain     = @"Handling Get Infant From Organizations Response";

// Infant Tag Association API Constants
NSString * const InfantTagAssociationURLKey                      = @"Infant Tag Association";
NSString * const InfantTagAssociationFailedErrorDomain           = @"Handling Infant Tag Association Response";

// Add Rule API Constants
NSString * const AddRuleURLKey                                   = @"Add Zone Rule";
NSString * const EditRuleURLKey                                  = @"Edit Zone Rule";
NSString * const AddRuleFailedErrorDomain                        = @"Handling Add/Edit Zone Rule Response";

// Add Zone API Constants
NSString * const AddZoneURLKey                                   = @"Add Zone";
NSString * const AddZoneFailedErrorDomain                        = @"Handling Add Zone Response";

// Edit Zone API Constants
NSString * const EditZoneURLKey                                  = @"Edit Zone";
NSString * const EditZoneFailedErrorDomain                       = @"Handling Edit Zone Response";

// Get Zone API Constants
NSString * const GetZoneURLKey                                   = @"Get Zone";
NSString * const GetZoneFailedErrorDomain                        = @"Handling Get Zone Response";

// Get Archived Zone API Constants
NSString * const GetArchivedZoneURLKey                           = @"Get Archived Zones";
NSString * const GetArchivedZoneFailedErrorDomain                = @"Handling Archived Get Zone Response";

// Get Zones From Organization API Constants
NSString * const GetZoneFromOrganizationsURLKey                  = @"Get Zone From Organizations";
NSString * const GetZoneFromOrganizationsFailedErrorDomain       = @"Handling Get Zone From Organizations Response";

// Delete Zone API Constants
NSString * const DeleteZoneURLKey                                = @"Delete Zone";
NSString * const DeleteZoneFailedErrorDomain                     = @"Handling Delete Zone Response";

// Get Zone Listener Mapping API Constants
NSString * const GetZoneListenerMappingURLKey                    = @"Get Zone Listener Mapping";
NSString * const GetZoneListenerMappingFailedErrorDomain         = @"Handling Get Zone Listener Mapping Response";

// Map Zone & Listener API Constants
NSString * const MapZoneListenerURLKey                           = @"Map Zone and Listener";
NSString * const MapZoneListenerFailedErrorDomain                = @"Handling Map Zone and Listener Response";

// Get Map Settings API Constants
NSString * const GetMapSettingsURLKey                            = @"Get Map Settings";
NSString * const GetMapSettingsFailedErrorDomain                 = @"Handling Get Map Settings Response";

// Health Check API Constants
NSString * const HealthCheckURLKey                               = @"Health Check";
NSString * const HealthCheckFailedErrorDomain                    = @"Handling Health Check Response";

// Add Schedule API Constants
NSString * const AddScheduleURLKey                               = @"Add Schedule";
NSString * const AddScheduleFailedErrorDomain                    = @"Handling Add Schedule Response";

// Edit Schedule API Constants
NSString * const EditScheduleURLKey                              = @"Edit Schedule";
NSString * const EditScheduleFailedErrorDomain                   = @"Handling Edit Schedule Response";

// Delete Schedule API Constants
NSString * const DeleteScheduleURLKey                            = @"Delete Schedule";
NSString * const DeleteScheduleFailedErrorDomain                 = @"Handling Delete Schedule Response";

// Get Schedule API Constants
NSString * const GetScheduleURLKey                               = @"Get Schedule";
NSString * const GetScheduleFailedErrorDomain                    = @"Handling Get Schedule Response";

// Get Infant Position API Constants
NSString * const GetInfantPositionURLKey                         = @"Get Infant Position";
NSString * const GetInfantPositionFailedErrorDomain              = @"Handling Get Infant Position Response";

@end
