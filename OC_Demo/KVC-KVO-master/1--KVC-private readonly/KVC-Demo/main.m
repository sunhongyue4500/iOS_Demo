//
//  main.m
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
        Teacher *teacher = [Teacher new];
        
        [teacher log];
    
        // 设置 readonly value
        //[teacher setValue:@"Jack" forKey:@"name"];
        [teacher setValue:@"Jack" forKey:@"_name"];
        // teacher.name = @"Jack";
        
        // 设置 private value
        [teacher setValue:@24 forKey:@"_age"];
        // teacher.age = 24;

        [teacher setValue:@1 forKey:@"male"];
        
        [teacher setValue:@11 forKey:@"_year"];
        [teacher setValue:@90 forKey:@"month"];
        
        [teacher log];

        // 获取 readonly value
        NSLog(@"name: %@", [teacher valueForKey:@"_name"]);
        
        //  获取 private value
        NSLog(@"age: %d", [[teacher valueForKey:@"_age"] intValue]);
        
        
        NSLog(@"male: %d", [[teacher valueForKey:@"isMale"] boolValue]);

    }
    return 0;
}
