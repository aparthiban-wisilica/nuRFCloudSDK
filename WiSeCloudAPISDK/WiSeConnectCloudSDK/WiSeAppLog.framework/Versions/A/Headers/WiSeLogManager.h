//
//  WiSeLogManager.h
//  ErrorLogs
//
//  Created by Elbin John on 11/02/14.
//  Copyright (c) 2014 Elbin John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
 

#define __VA_NARG__(...) \
(__VA_NARG_(_0, ## __VA_ARGS__, __RSEQ_N()) - 1)

#define __VA_NARG_(...) \
__VA_ARG_N(__VA_ARGS__)

#define __VA_ARG_N( \
_1, _2, _3, _4, _5, _6, _7, _8, _9,_10, \
_11,_12,_13,_14,_15,_16,_17,_18,_19,_20, \
_21,_22,_23,_24,_25,_26,_27,_28,_29,_30, \
_31,_32,_33,_34,_35,_36,_37,_38,_39,_40, \
_41,_42,_43,_44,_45,_46,_47,_48,_49,_50, \
_51,_52,_53,_54,_55,_56,_57,_58,_59,_60, \
_61,_62,_63,N,...) N

#define __RSEQ_N() \
63, 62, 61, 60,                         \
59, 58, 57, 56, 55, 54, 53, 52, 51, 50, \
49, 48, 47, 46, 45, 44, 43, 42, 41, 40, \
39, 38, 37, 36, 35, 34, 33, 32, 31, 30, \
29, 28, 27, 26, 25, 24, 23, 22, 21, 20, \
19, 18, 17, 16, 15, 14, 13, 12, 11, 10, \
9,  8,  7,  6,  5,  4,  3,  2,  1,  0


extern void  WiSeLogFormat(NSInteger level ,  char *file, int lineNumber, NSString *className , const char *functionName, NSInteger argCount, NSString *fmt, ...);

FOUNDATION_EXPORT NSString *const MyFirstConstant;
FOUNDATION_EXPORT NSString *const MySecondConstant;

@interface WiSeLogManager : NSObject
{
    enum _LogCategory
	{
		nologging = 0,
		fatal,
		error,
		warning,
		info,
		debug,
		allcategories // Value used for filtering
	} LogCategory;
}



#define WiSeLogFatal(fmt, ...)         WiSeLogFormat(1 ,__FILE__,__LINE__, NSStringFromClass ([self class]),__PRETTY_FUNCTION__ ,__VA_NARG__(__VA_ARGS__), fmt, ##__VA_ARGS__);
#define WiSeLogError(fmt, ...)         WiSeLogFormat(2 ,__FILE__,__LINE__, NSStringFromClass ([self class]),__PRETTY_FUNCTION__ ,__VA_NARG__(__VA_ARGS__), fmt, ##__VA_ARGS__);
#define WiSeLogWarning(fmt, ...)       WiSeLogFormat(3 ,__FILE__,__LINE__, NSStringFromClass ([self class]),__PRETTY_FUNCTION__ ,__VA_NARG__(__VA_ARGS__), fmt, ##__VA_ARGS__);
#define WiSeLogInfo(fmt, ...)          WiSeLogFormat(4 ,__FILE__,__LINE__, NSStringFromClass ([self class]),__PRETTY_FUNCTION__ ,__VA_NARG__(__VA_ARGS__), fmt, ##__VA_ARGS__);
#define WiSeLogDebug(fmt, ...)         WiSeLogFormat(5 ,__FILE__,__LINE__, NSStringFromClass ([self class]),__PRETTY_FUNCTION__ ,__VA_NARG__(__VA_ARGS__), fmt, ##__VA_ARGS__);
#define WiSeLogLevel(level,fmt, ...)   WiSeLogFormat(level ,__FILE__,__LINE__, NSStringFromClass ([self class]),__PRETTY_FUNCTION__ ,__VA_NARG__(__VA_ARGS__), fmt, ##__VA_ARGS__);



 
//+ (BOOL)isDebugModeEnabled;
+ (BOOL)isOperationLogEnabled:(NSString *)operationName;

@end
