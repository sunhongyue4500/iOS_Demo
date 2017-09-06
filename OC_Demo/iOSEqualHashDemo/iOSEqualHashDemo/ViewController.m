//
//  ViewController.m
//  iOSEqualHashDemo
//
//  Created by Sunhy on 2017/9/6.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

#define kKey1 @"key1"
#define kKey2 @"key2"

#define kValue1 @"value1"
#define kValue2 @"value2"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person1 = [[Person alloc] initWithName:@"Sun" age:10];
    Person *person2 = [[Person alloc] initWithName:@"Hongyue" age:20];
    
    NSMutableArray *array1 = [NSMutableArray array];
    [array1 addObject:person1];
    NSMutableArray *array2 = [NSMutableArray array];
    [array2 addObject:person2];
    NSLog(@"array end -------------------------------");
    
    NSMutableSet *set1 = [NSMutableSet set];
    [set1 addObject:person1];
    NSMutableSet *set2 = [NSMutableSet set];
    [set2 addObject:person2];
    NSLog(@"set end -------------------------------");
    
    NSMutableDictionary *dictionaryValue1 = [NSMutableDictionary dictionary];
    [dictionaryValue1 setObject:person1 forKey:kKey1];
    NSMutableDictionary *dictionaryValue2 = [NSMutableDictionary dictionary];
    [dictionaryValue2 setObject:person2 forKey:kKey2];
    NSLog(@"dictionary value end -------------------------------");
    
    NSMutableDictionary *dictionaryKey1 = [NSMutableDictionary dictionary];
    [dictionaryKey1 setObject:kValue1 forKey:person1];
    NSMutableDictionary *dictionaryKey2 = [NSMutableDictionary dictionary];
    [dictionaryKey2 setObject:kValue2 forKey:person2];
    NSLog(@"dictionary key end -------------------------------");

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
