//
//  SRTMUtils.m
//  TestSRTMFormat
//
//  Created by Sunhy on 16/10/15.
//  Copyright © 2016年 Sunhy. All rights reserved.
//

#import "SRTMUtils.h"

@implementation SRTMUtils

+ (NSTextCheckingResult *)checkString:(NSString *)string withRegularExpression:(NSString *)regExp {
    NSRegularExpression *exp = [NSRegularExpression regularExpressionWithPattern:regExp options:0 error:NULL];
    NSTextCheckingResult *result = [exp firstMatchInString:string options:0 range:NSMakeRange(0, string.length)];
    return result;
}

@end
