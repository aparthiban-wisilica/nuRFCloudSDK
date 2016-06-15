//
//  WiSeNetworkManager.m
//  WiSeConnectCloudSDK
//
//  Created by Ashok Parthiban D on 17/11/15.
//  Copyright © 2015 Ashok Parthiban D. All rights reserved.
//

#import "WiSeNetworkManager.h"
#import "WiSeOperationQueue.h"
#import "WiSeCloudApiRequest.h"
#import "WiSeNetworkConnection.h"
#import "WiSeCoreNetworkUtil.h"
#import "WiSeCloudApiRequest.h"
#import "WiSeOperation.h"
#import "WiSeCloudAPIRequestDetails.h"

#import "WiSeCloudAPIRequestRegisteredDetails.h"
#import "WiSeCoreNetworkConstants.h"

static const int maxnumberOfConcurrentOperation = 4;
static const  int maxSizeOfQueue = 20;
static const int maxRetryCount = 2;
static const  int DefaultRetryCount = 3;

#define SortingByPriority @"priority"
#define SortingByOperationRegisteredTime @"operationRegisteredTime"

@implementation WiSeNetworkManager {
    WiSeNetworkConnection * wiseNetworkConnection;
    int numberofCurrentOperations;
    int requestRegisterId;
}

@synthesize operationQueue;

- (WiSeCloudAPIRequestRegisteredDetails *)callApiWithRequest:(WiSeCloudApiRequest *)apiRequest { // First Call
    
   
    
    if (self.maximumNumberOfCuncurrentOperations && (self.maximumNumberOfCuncurrentOperations < maxSizeOfQueue)) {
        self.operationQueue.maxConcurrentOperations = self.maximumNumberOfCuncurrentOperations;
    }
    
    if (!apiRequest) { // Check for nil request
        WiSeCloudAPIRequestRegisteredDetails * registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestIsNil];
        return registeredDetails;
    }
    
    return [self registerRequestWithWiseCloudApiRequest:apiRequest]; // Register the request to queue
}

// Register the request
- (WiSeCloudAPIRequestRegisteredDetails *) registerRequestWithWiseCloudApiRequest : (WiSeCloudApiRequest *) apiRequest {
    
    WiSeCloudAPIRequestRegisteredDetails * registeredDetails = nil;
    @synchronized(operationQueue) {
        if (operationQueue.queue.count < maxSizeOfQueue) { // Check request queue size
            
            if ([WiSeCoreNetworkUtil isNetworkAvailable]) { // When Internet is Available!
                
                if (!apiRequest.requestPriority) { // Setting priority
                    apiRequest.requestPriority = PriorityTen; // Default priority
                }
                
                if (requestRegisterId == INT_MAX) {
                    requestRegisterId = 0;
                }
                requestRegisterId++;
                
              
                //WiSeLogInfo(@"\n ------------------------------------- Request %@ RegisterId: %d \n",apiRequest.strURLKey,requestRegisterId);
                
                WiSeOperation *operation = [[WiSeOperation alloc] initWithDefaultValuesAndWithCloudApiRequest:apiRequest WithRegisteredId:requestRegisterId]; // Init wiseoperation                
                [operationQueue.queue addObject:operation];
                [WiSeCoreNetworkUtil printRequestInfo:operation];
                
                registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:requestRegisterId WithRequestStatus:RequestRegistered];
                
                [self performOperationFromQueue];
                
            }else { // When Internet is not Available!
                
                registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:NoInternet];
            }
            
        }else {
            registeredDetails = [[WiSeCloudAPIRequestRegisteredDetails alloc] initWiSeCloudAPIRequestRegisteredDetailsWithRequestRegisteredId:registrationFailed WithRequestStatus:RequestQueueIsFull];
        }
        
    }
    
    return registeredDetails;
    
}

// Called for every second to perform operation from the queue
- (void) performOperationFromQueue {
    
    @synchronized(operationQueue) {
        
        if (operationQueue.queue && [operationQueue.queue count]) { // When Queue count is not zero
            
            if (operationQueue.queue.count != 1) {
                [self sortQueue]; // Sort the Queue before itration
            }
            
            for (WiSeOperation * operation in operationQueue.queue) {
                // Operation should be ready and the retry count must be lesser than 3 and checking number of concurrent operation
                if (operation.requestStatus == RequestIsReady && operation.retryCount < DefaultRetryCount && numberofCurrentOperations < self.operationQueue.maxConcurrentOperations) {
                    operation.requestStatus = RequestInProgress;
                    numberofCurrentOperations++;
                   // WiSeLogInfo(@"\n Current Operations count: %d Time : %@ \n Op Rg Time : %@ \n Api Name : %@ \n",numberofCurrentOperations,[NSDate date],operation.operationRegisteredTime,operation.apiRequest.strURLKey);
                    
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                        [self invokeApiCallWithRequest:operation];
                    });
                }
            }
        }
        else {
            //WiSeLogInfo(@"\n Queue Size : %lu \n =========================== No Operations to Perform =========================== \n",(unsigned long)operationQueue.queue.count);
        }
    }
    
}

// Sort the queue on priority

- (void) sortQueue {
    
    NSSortDescriptor *sortDescriptorForPriority;
    sortDescriptorForPriority = [[NSSortDescriptor alloc] initWithKey:SortingByPriority // Sorting based on request priority in decending order. So that , request with high priority will be executed first.
                                                            ascending:NO];
    NSSortDescriptor *sortDescriptorForTime;
    sortDescriptorForTime = [[NSSortDescriptor alloc] initWithKey:SortingByOperationRegisteredTime // Sorting based on request operationRegisteredTime in ascending order. So that , request was registered first, will be executed first.
                                                        ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptorForTime,sortDescriptorForPriority, nil];
    [operationQueue.queue sortUsingDescriptors:sortDescriptors]; // Sorting using sort descriptor.
    
}

// Invoke Api Call
- (void) invokeApiCallWithRequest : (WiSeOperation *) operation {
    
    //WiSeCloudApiRequest * apiRequest = operation.apiRequest; // Extracting request from the operation.
    int regId = operation.requestRegisteredId;
    
    if(!wiseNetworkConnection)
    {
        wiseNetworkConnection = [WiSeNetworkConnection new];
    }
    
//        WiSeLogInfo(@" %@ Retry Fail \n Retry Count : %d",operation.apiRequest.strURLKey,operation.retryCount);
    __weak typeof (operation) weakOperartion = operation;
    
    NSURL * url=[[NSURL alloc]initWithString:operation.apiRequest.strULR];
    
    NSString * json= [WiSeCoreNetworkUtil getJsonString:operation.apiRequest.requestBody];
    
    [wiseNetworkConnection sendRequestForUrl :url headerParams:operation.apiRequest.dictRequestHeader
                                 jsonRequest : json :
     ^(NSData *responsedata, NSError *error,NSURLResponse * response)
     {
         
         numberofCurrentOperations--;
         weakOperartion.operationCompletedTime = [NSDate date];
         weakOperartion.totalTimeTaken = [weakOperartion.operationCompletedTime timeIntervalSinceDate:weakOperartion.operationRegisteredTime];
         WiSeLogInfo(@"\n %@ Json : %@ \n Current Operations count: %d \n Request : %@ Completed At : %@ \n %@ Response : %@ \n -----RequestId %d-----",weakOperartion.apiRequest.strURLKey,json,numberofCurrentOperations,weakOperartion.apiRequest.strURLKey,weakOperartion.operationCompletedTime,weakOperartion.apiRequest.strURLKey,[[NSString alloc] initWithData:responsedata encoding:4],weakOperartion.requestRegisteredId);
         
         
         error = [WiSeCoreNetworkUtil replaceNullValues:error];
         
         if (responsedata) { // Success
            if(weakOperartion.apiRequest.delegate && [weakOperartion.apiRequest.delegate respondsToSelector:@selector(apiRequestSuccessWithJSON:forRequest:withRequestStatus:)])
             {
                 WiSeCloudAPIRequestDetails * requestDetails = [[WiSeCloudAPIRequestDetails alloc] initRequestDetailsWithRequest:weakOperartion.apiRequest.modelAPIRequest withRequestId:regId withRequestStatus:RequestSuccess withAPICallName:weakOperartion.apiRequest.forAPICall];
                 [weakOperartion.apiRequest.delegate apiRequestSuccessWithJSON:responsedata forRequest:requestDetails withRequestStatus:RequestSuccess];
             }
             
             // Remove operation
             operation.requestStatus = RequestFinished;
             [self removeOperationFromQueue:operation];
             
         }else { // Fail
             
             // Check retry count of request
             if (operation.retryCount < maxRetryCount) {
                 // Set Retry Option
                 [self setRetryOptionForOperation:operation];
             }else {
                 
                 if(weakOperartion.apiRequest.delegate && [weakOperartion.apiRequest.delegate respondsToSelector:@selector(apiRequestFailedWithError:withResponse:withJSON:forRequest:withRequestStatus:)])
                 {
                     WiSeCloudAPIRequestDetails * requestDetails = [[WiSeCloudAPIRequestDetails alloc] initRequestDetailsWithRequest:weakOperartion.apiRequest.modelAPIRequest withRequestId:regId withRequestStatus:RequestFailedToExecute withAPICallName:weakOperartion.apiRequest.forAPICall];
                     WiSeAppError * err = nil;
                     if (error && [error isKindOfClass:[NSError class]]) {
                         err = (WiSeAppError *)error;
                     }
                     [weakOperartion.apiRequest.delegate apiRequestFailedWithError:err withResponse:nil withJSON:responsedata forRequest:requestDetails withRequestStatus:RequestFailed];
                 }
                 // Remove operation
                 operation.requestStatus = RequestFinished;
                 
                 WiSeLogInfo(@"\n Retry Count : %d  \n Request %@ Failed After Retry \n ",weakOperartion.retryCount,weakOperartion.apiRequest.strURLKey);
                 
                 [self removeOperationFromQueue:operation];
             }
             
         }
         
     } HTTPMethod:operation.apiRequest.strHttpMethod];
}

// Remove Operation from Queue
- (void) removeOperationFromQueue : (WiSeOperation *) operation {
    
    @synchronized(operationQueue) {
        
        NSUInteger index =  [operationQueue.queue indexOfObject:operation];
        
        if(index <  [operationQueue.queue count])
        {
            [operationQueue.queue removeObjectAtIndex:index];
        }
        
    }
    [self performOperationFromQueue];
}

// Set Retry Option for an Operation
- (void) setRetryOptionForOperation : (WiSeOperation *) operation {
    
    @synchronized(operationQueue) {
        
        if (operation.retryCount < maxRetryCount) {
            operation.retryCount++; // Increase retry count
            operation.requestStatus = RequestIsReady; // Change the Request Status
            operation.priority--; // Decrease the priority
            [self performOperationFromQueue];
        }else {
            WiSeLogInfo(@"\n %@ Retry Fail \n Retry Count : %d \n -----RequestId %d----- \n",operation.apiRequest.strURLKey,operation.retryCount,operation.requestRegisteredId);
            [self removeOperationFromQueue:operation];
        }
        
    }
}

#pragma mark - Singleton Methods

+ (id)sharedWiSeNetworkManager {
    static WiSeNetworkManager *sharedWiSeNetworkManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedWiSeNetworkManager = [[self alloc] init];
    });
    return sharedWiSeNetworkManager;
}

- (id)init {
    if (self = [super init]) {
        self.operationQueue = [[WiSeOperationQueue alloc] init];
        self.operationQueue.queue = [[NSMutableArray alloc] init];
        self.operationQueue.maxConcurrentOperations = maxnumberOfConcurrentOperation;
        self.operationQueue.maxQueueSize = maxSizeOfQueue;
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
