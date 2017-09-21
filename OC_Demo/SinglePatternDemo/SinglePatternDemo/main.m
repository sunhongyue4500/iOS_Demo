//
//  main.m
//  SinglePatternDemo
//
//  Created by Sunhy on 2017/9/7.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *per1 = [[Person alloc] init];
        Person *per2 = [Person new];
        NSLog(@"%@", per1);
        NSLog(@"%@", per2);
    }
    return 0;
}
