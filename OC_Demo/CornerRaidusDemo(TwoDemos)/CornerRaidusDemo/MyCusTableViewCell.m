//
//  MyCusTableViewCell.m
//  CornerRaidusDemo
//
//  Created by Sunhy on 2017/9/7.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "MyCusTableViewCell.h"

@interface MyCusTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myUIImageView;
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation MyCusTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)config1 {
    
    //self.myView.layer.cornerRadius = self.myView.bounds.size.width / 2;
    self.myUIImageView.layer.cornerRadius = 5;
    self.myUIImageView.layer.masksToBounds = YES;
    self.myLabel.layer.cornerRadius = self.myLabel.bounds.size.width / 2;
    self.myLabel.layer.masksToBounds = YES;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.myView.bounds byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(20, 5)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.myView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.myView.layer.mask = maskLayer;
}


- (void)confif2 {

}

@end
