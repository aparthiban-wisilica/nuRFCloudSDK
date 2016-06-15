//
//  WiSeAPIHeader.h
//  WiSeCloudAPISDK
//
//  Created by Ashok Parthiban D on 15/04/16.
//  Copyright © 2016 Ashok Parthiban D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiSeAPIHeader : NSObject

@property (nonatomic,assign) int      phoneCloudId;
@property (nonatomic,assign) int      organizationId;
@property (nonatomic,assign) int      subOrganizationId;
@property (nonatomic,copy  ) NSString * userToken;
@property (nonatomic,copy  ) NSString * acceptValue;
@property (nonatomic,copy  ) NSString * contentTypeValue;

@end
