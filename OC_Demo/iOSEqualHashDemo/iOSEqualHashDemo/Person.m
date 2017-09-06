//
//  Person.m
//  TestShit
//
//  Created by Sunhy on 2017/9/6.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "Person.h"

@interface Person () <NSCopying>

@property (nonatomic, copy) NSString  *name;
@property (nonatomic, assign) NSInteger age;

@end

@implementation Person


- (instancetype)init {
    return [self initWithName:nil age:0];
}

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age{
    if (self = [super init]) {
        _name = [name copy];
        _age = age;
    }
    return self;
}

/** 在头文件公开*/
- (BOOL)isEqualToPerson:(Person *)object {
    if (!object) return NO;
    /** 对属性进行与操作*/
    BOOL hasSameName = ((!self.name && !object.name) || [self.name isEqualToString:object.name]);
    BOOL hasSameAge = (self.age == object.age);
    return hasSameName && hasSameAge;
}

- (BOOL)isEqual:(id)object {
    /** 判断是否是同一个对象*/
    if (self == object) {
        return YES;
    }
    /** 类型检查*/
    if (![object isKindOfClass:[Person class]]) {
        return NO;
    }
    /** 提高复用性*/
    return [self isEqualToPerson:(Person *)object];
}

/**
 NSSet添加新成员时, 需要根据hash值来快速查找成员, 以保证集合中是否已经存在该成员
 NSDictionary在查找key时, 也利用了key的hash值来提高查找的效率
 */

- (NSUInteger)hash {
    NSInteger hash = [_name hash] ^ [[NSString stringWithFormat:@"%ld", _age] hash];
    NSLog(@"hash = %ld", hash);
    return hash;
}

@end
