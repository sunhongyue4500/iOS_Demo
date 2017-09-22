//
//  JPViewController.m
//  JSPatch
//
//  Created by bang on 15/5/2.
//  Copyright (c) 2015年 bang. All rights reserved.
//

#import "JPViewController.h"
#import "JPEngine.h"

@implementation JPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn setTitle:@"Push JPTableViewController" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
    
    // 请求下发按钮
    UIButton *btnRequesJS = [[UIButton alloc] initWithFrame:CGRectMake(0, 400, [UIScreen mainScreen].bounds.size.width, 50)];
    [btnRequesJS setTitle:@"请求JS并执行" forState:UIControlStateNormal];
    [btnRequesJS addTarget:self action:@selector(handleBtnJS:) forControlEvents:UIControlEventTouchUpInside];
    [btnRequesJS setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btnRequesJS];
}

- (void)handleBtn:(id)sender
{
    // 有bug代码
}

- (void)handleBtnJS:(id)sender
{
    // 模拟JS文件下发
    NSString *jsFileRemotePath = @"http://7xr7dp.com1.z0.glb.clouddn.com/test1.js";
    NSURL *url = [NSURL URLWithString:jsFileRemotePath];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
        if (res.statusCode == 200) {
            NSString *script =  [NSString stringWithContentsOfURL:location encoding:NSUTF8StringEncoding error:nil];
            [JPEngine evaluateScript:script];
        }
    }];
    [task resume];
}

@end


