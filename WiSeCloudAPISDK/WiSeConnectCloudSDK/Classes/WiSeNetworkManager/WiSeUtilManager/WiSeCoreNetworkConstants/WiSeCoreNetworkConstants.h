//
//  WiSeCoreNetworkConstants.h
//  WiSeCoreNetworkManager
//
//  Created by Ashok Parthiban D on 20/01/16.
//  Copyright © 2016 WiSilica. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int registrationFailed = -1;

// Request Status Enum
typedef enum {
    RequestRegistered = 201,
    RequestFailedToRegister,
    RequestQueueIsFull,
    RequestConcurrecnyFailed,
    RequestInvalid,
    RequestLost,
    RequestInProgress,
    RequestIsReady,
    RequestFinished,
    RequestFailed,
    RequestSuccess,
    RequestExecuted,
    RequestFailedToExecute,
    RequestIsNil,
    NoInternet
} WiSeCloudApiRequestStatus;

// Request Priority

typedef enum {
    
    PriorityOne = 1,
    PriorityTwo,
    PriorityThree,
    PriorityFour,
    PriorityFive,
    PrioritySix,
    PrioritySeven,
    PriorityEight,
    PriorityNine,
    PriorityTen
    
} WiSeCloudApiRequestPriority;

@interface WiSeCoreNetworkConstants : NSObject



@end
