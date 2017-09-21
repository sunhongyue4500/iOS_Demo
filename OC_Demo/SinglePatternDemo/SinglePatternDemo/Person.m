//
//  Person.m
//  SinglePatternDemo
//
//  Created by Sunhy on 2017/9/7.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "Person.h"

@implementation Person

static Person *instance = nil;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

// 保证是一个地址的对象
//+ (instancetype)allocWithZone:(struct _NSZone *)zone
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [super allocWithZone:zone];
//    });
//    return instance;
//}

// 为了防止使用init方法
// 1.可以在文档中进行说明
// 2.可以在init中抛出exception

@end
