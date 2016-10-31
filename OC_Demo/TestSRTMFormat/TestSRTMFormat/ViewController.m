//
//  ViewController.m
//  TestSRTMFormat
//
//  Created by Sunhy on 16/10/14.
//  Copyright © 2016年 Sunhy. All rights reserved.
//

#import "ViewController.h"
#import "GeoElevationFile.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    GeoElevationFile *testFile = [[GeoElevationFile alloc] initWithFileName:@"N50E007"];
    
    [testFile fetchStartPosition:@"N50E007"];
    int ele = [testFile fetchElevation:7.3 andLat:50.2 approximate:YES];
#ifdef DEBUG
    NSLog(@"Ele:%d", ele);
#endif
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
