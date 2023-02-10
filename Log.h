//
//  Log.h
//  CleverTapSDK
//
//  Created by Aakarsh on 10/02/23.
//  Copyright © 2023 CleverTap. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define NSLog(args...) _Log(@"DEBUG ", __FILE__,__LINE__,__PRETTY_FUNCTION__,args);

@interface Log : NSObject
void _Log(NSString *prefix, const char *file, int lineNumber, const char *funcName, NSString *format,...);
@end

NS_ASSUME_NONNULL_END
