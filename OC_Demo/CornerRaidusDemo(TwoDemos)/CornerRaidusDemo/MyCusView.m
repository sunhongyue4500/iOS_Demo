//
//  MyCusView.m
//  CornerRaidusDemo
//
//  Created by Sunhy on 2017/9/7.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "MyCusView.h"

@implementation MyCusView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/** 不推荐这种方式1.耗内存 2.离屏渲染*/ 
//- (void)drawRect:(CGRect)rect {
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(5, 5)];
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    maskLayer.frame = self.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.layer.mask = maskLayer;
//}


@end
