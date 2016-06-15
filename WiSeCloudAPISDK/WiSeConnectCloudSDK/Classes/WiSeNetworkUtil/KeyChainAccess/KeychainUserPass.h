//
//  KeychainUserPass.h
//  WiseHome
//
//  Created by Arjun on 17/02/15.
//  Copyright (c) 2015 Wisilica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainUserPass : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString             *)service;
+ (void)delete:(NSString         *)service;

@end
