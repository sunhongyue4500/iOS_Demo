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
    self.myView.layer.cornerRadius = 5;
    self.myUIImageView.layer.cornerRadius = 5;
    self.myUIImageView.layer.masksToBounds = YES;
    self.myLabel.layer.cornerRadius = 5;
    self.myLabel.layer.masksToBounds = YES;
}

- (void)confif2 {

}

@end
