//
//  ViewController.m
//  TestCMAltimeter
//
//  Created by Sunhy on 16/10/11.
//  Copyright © 2016年 Sunhy. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *AltimeterLabel;
@property (nonatomic, strong) CMAltimeter *altimeter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _altimeter = [[CMAltimeter alloc] init];
    if ([CMAltimeter isRelativeAltitudeAvailable]) {
        [_altimeter startRelativeAltitudeUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAltitudeData * _Nullable altitudeData, NSError * _Nullable error) {
            NSLog(@"变化:%@",altitudeData.relativeAltitude);
            NSLog(@"当前气压值:%@ kPa",altitudeData.pressure);
            NSLog(@"当前气压高:%f feet",[self altPressure2AltFeet:[altitudeData.pressure doubleValue]] );
        }];
    }
}


/**
 气压值转气压高度公式
 https://en.wikipedia.org/wiki/Pressure_altitude

 @param altPressure 气压值 单位 kPa

 @return 气压高度 英尺
 */
- (double)altPressure2AltFeet:(double)altPressure {
    return (1 - pow(altPressure*10/1013.25, 0.190284)) * 145366.45;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
