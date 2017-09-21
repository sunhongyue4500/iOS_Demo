//
//  Person.m
//  LockDemo
//
//  Created by Sunhy on 2017/9/21.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "Person.h"

@implementation Person

static id obj;
- (void)test {
    @synchronized(obj) {
        
    }
}

@end
