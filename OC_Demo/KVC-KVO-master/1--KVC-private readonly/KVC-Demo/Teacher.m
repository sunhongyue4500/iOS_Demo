//
//  Teacher.m
//  KVC-Demo
//
//  Created by LeeJay on 16/6/2.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import "Teacher.h"

@interface Teacher ()

@property (nonatomic, assign) NSUInteger month;

@end

@implementation Teacher

- (void)log
{
    NSLog(@"name:%@ --- age: %d male: %d year:%d  month:%d",__name, _age, _isMale, _year, _month);
}

@end
