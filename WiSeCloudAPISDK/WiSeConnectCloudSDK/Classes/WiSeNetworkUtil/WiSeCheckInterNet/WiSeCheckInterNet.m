//
//  WiSeCheckInterNet.m
//  WiSeNewCloudAPISDK
//
//  Created by Ashok Parthiban D on 12/01/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import "WiSeCheckInterNet.h"
#import <WiSeNetworkManager/WiSeCoreNetworkManager.h>

@implementation WiSeCheckInterNet

- (BOOL)checkInternetAvailability {
    BOOL status ;
    
     BOOL (^CheckInterNetBlcok)(void);
    CheckInterNetBlcok = ^BOOL (void) {
        __block BOOL s = YES;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            Reachability * reach = [Reachability reachabilityForInternetConnection];
            if ([reach currentReachabilityStatus] != NotReachable) {
                s = YES;
            }else {
                s = NO;
            }
        });
        return s;
    };
    
    status = CheckInterNetBlcok ();
    return status;
}

@end
