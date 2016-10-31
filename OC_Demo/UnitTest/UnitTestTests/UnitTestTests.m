//
//  UnitTestTests.m
//  UnitTestTests
//
//  Created by Sunhy on 16/10/14.
//  Copyright © 2016年 Sunhy. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UnitTestTests : XCTestCase

@end

@implementation UnitTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
