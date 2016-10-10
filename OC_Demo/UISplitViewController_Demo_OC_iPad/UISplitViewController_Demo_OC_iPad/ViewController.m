//
//  ViewController.m
//  UISplitViewController_Demo_OC_iPad
//
//  Created by Sunhy on 16/10/8.
//  Copyright © 2016年 Sunhy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // The primary and secondary view controllers are displayed side-by-side onscreen.  左右视图总是显示
    [self setPreferredDisplayMode:UISplitViewControllerDisplayModeAllVisible];
    // 限制横屏、竖屏下宽度都是320
    [self setMinimumPrimaryColumnWidth:320.0];
    [self setMaximumPrimaryColumnWidth:320.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
