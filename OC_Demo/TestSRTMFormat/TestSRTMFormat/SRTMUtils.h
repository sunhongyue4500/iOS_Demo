//
//  SRTMUtils.h
//  TestSRTMFormat
//
//  Created by Sunhy on 16/10/15.
//  Copyright © 2016年 Sunhy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRTMUtils : NSObject

+ (NSTextCheckingResult *)checkString:(NSString *)string withRegularExpression:(NSString *)regExp;

@end
