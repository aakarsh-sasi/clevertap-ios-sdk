
//  Log.m
//  Zomato
//
//  Created by Aakarsh on 10/02/23.
//  Copyright © 2023 Zomato. All rights reserved.


#import "Log.h"
#import "CleverTapSDK/CleverTap.h"


@implementation Log
void _Log(NSString *prefix, const char *file, int lineNumber, const char *funcName, NSString *format,...) {
    va_list ap;
    va_start (ap, format);
    format = [format stringByAppendingString:@"\n"];
    NSString *msg = [[NSString alloc] initWithFormat:[NSString stringWithFormat:@"%@",format] arguments:ap];
    va_end (ap);

    if ([msg containsString:@"CleverTap"]) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        NSString *funcNameString = [[NSString alloc] initWithUTF8String:funcName];
        NSString *fileNameString = [[NSString alloc] initWithUTF8String:file];
        [dict setObject:funcNameString forKey:@"func_name"];
        [dict setObject:msg forKey:@"log_output"];
        [dict setObject:fileNameString forKey:@"file_name"];
        [[CleverTap sharedInstance] sendNSLogPayload:dict];
    }
    else {
        printf("%s", [@"Didn't work aaaaa" UTF8String]);
    }

}
@end
