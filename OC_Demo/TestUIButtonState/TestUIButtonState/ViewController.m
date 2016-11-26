//
//  ViewController.m
//  TestUIButtonState
//
//  Created by Sunhy on 16/11/25.
//  Copyright © 2016年 Sunhy. All rights reserved.
//  http://rickytan.cn/blog/2015/07/06/uibutton-state/

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIButton *button6;
@property (strong, nonatomic) UIButton *button6_2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGPoint center = CGPointMake(CGRectGetWidth(self.view.frame) / 2, 60.f);
    UIButton *btn0 = [self getButton];
    btn0.center = center;
    btn0.enabled = YES;
    
    [btn0 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn0 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//    [btn0 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
//    [btn0 setTitleColor:[UIColor redColor] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    
    
    center.y += 60.f;
    UIButton *btn1 = [self getButton];
    btn1.center = center;
    btn1.highlighted = YES;
    
    center.y += 60.f;
    UIButton *btn2 = [self getButton];
    btn2.center = center;
    btn2.selected = YES;
    
    center.y += 60.f;
    UIButton *btn3 = [self getButton];
    btn3.center = center;
    
    center.y += 60.f;
    UIButton *btn4 = [self getButton];
    btn4.center = center;
    btn4.selected = YES;
    btn4.highlighted = YES;
    
    center.y += 60.f;
    UIButton *btn5 = [self getButton];
    btn5.center = center;
    btn5.enabled = NO;

    /** 状态同步按钮*/
    center.y += 60.f;
    self.button6 = [self getButton];
    [self.button6 setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [self.button6 setBackgroundImage:[self imageWithColor:[UIColor redColor]] forState:UIControlStateSelected];
    [self.button6 setBackgroundImage:[self imageWithColor:[UIColor redColor]] forState:UIControlStateSelected | UIControlStateHighlighted];
    self.button6.center = center;
    self.button6.selected = NO;
    
    center.x += 360.f;
    self.button6_2 = [self getButton];
    [self.button6_2 setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [self.button6_2 setBackgroundImage:[self imageWithColor:[UIColor yellowColor]] forState:UIControlStateSelected];
    // 如果没有设置UIControlStateSelected | UIControlStateHighlighted的颜色，默认是灰色的
    [self.button6_2 setBackgroundImage:[self imageWithColor:[UIColor blueColor]] forState:UIControlStateSelected | UIControlStateHighlighted];
    self.button6_2.center = center;
    self.button6_2.selected = NO;
    
    [self.button6 addTarget:self action:@selector(buttonTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self.button6 addTarget:self action:@selector(buttonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.button6_2 addTarget:self action:@selector(buttonTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self.button6_2 addTarget:self action:@selector(buttonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    self.button6.tag = 1;
    self.button6_2.tag = 2;
//
//    center.y += 60.f;
//    UIButton *btn7 = [self getButton];
//    btn7.center = center;
//    btn7.highlighted = YES;
//    btn7.selected = YES;
    
    [self.view addSubview:btn0];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    [self.view addSubview:btn4];
    [self.view addSubview:btn5];
    
    [self.view addSubview:self.button6];
    [self.view addSubview:self.button6_2];
//    [self.view addSubview:btn6];
//    [self.view addSubview:btn7];
}

- (UIButton *)getButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"Normal" forState:UIControlStateNormal];
    [btn setTitle:@"Selected" forState:UIControlStateSelected];
    [btn setTitle:@"Highlighted" forState:UIControlStateHighlighted];
    [btn setTitle:@"Normal & Selected" forState:UIControlStateNormal | UIControlStateSelected];
    [btn setTitle:@"Normal & Highlighted" forState:UIControlStateNormal | UIControlStateHighlighted];
    [btn setTitle:@"Selected & Highlighted" forState:UIControlStateSelected | UIControlStateHighlighted];
    [btn setTitle:@"Normal & Selected & Highlighted" forState:UIControlStateNormal | UIControlStateSelected | UIControlStateHighlighted];
    
    
    [btn setTitle:@"Highlighted & Disabled" forState:UIControlStateHighlighted | UIControlStateDisabled];
    [btn setTitle:@"Disabled" forState:UIControlStateDisabled];
    [btn setTitle:@"Selected & Disabled" forState:UIControlStateSelected | UIControlStateDisabled];
    [btn setTitle:@"Selected & Highlighted & Disabled" forState:UIControlStateSelected | UIControlStateHighlighted | UIControlStateDisabled];
    [btn setTitle:@"Selected & Highlighted" forState:UIControlStateSelected | UIControlStateHighlighted];
    
    btn.bounds = CGRectMake(0, 0, 240, 30);
    
    return btn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonTouchDown:(UIButton *)sender{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    //NSLog(@"%d", sender.state);
    sender.selected = !sender.selected;
    if (sender.tag == 1) {
        self.button6_2.selected = sender.selected;
    } else {
        self.button6.selected = sender.selected;
    }
}

-(void)buttonTouchUp:(UIButton *)sender{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    //sender.selected = !sender.selected;
    //NSLog(@"%d", sender.state);
    sender.selected = !sender.selected;
    if (sender.tag == 1) {
        self.button6_2.selected = sender.selected;
    } else {
        self.button6.selected = sender.selected;
    }
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/** 
 selected 设置后会一直保留
 highlighted 设置后，点击按钮后不会保留，selected设置后会保留
 如果设置了highlighted而没有设置selected， highlighted和Disabled同时存在
 如果没有设置UIControlStateSelected | UIControlStateHighlighted的颜色，默认是灰色的
 
 */



@end
