//
//  UIView+AddCorner.m
//  CornerRaidusDemo
//
//  Created by Sunhy on 2017/9/7.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "UIView+AddCorner.h"

@implementation UIView (AddCorner)

/** func kt_drawRectWithRoundedCorner(radius radius: CGFloat,
 borderWidth: CGFloat,
 backgroundColor: UIColor,
 borderColor: UIColor) -> UIImage {
 UIGraphicsBeginImageContextWithOptions(sizeToFit, false, UIScreen.mainScreen().scale)
 let context = UIGraphicsGetCurrentContext()
 
 CGContextMoveToPoint(context, 开始位置);  // 开始坐标右边开始
 CGContextAddArcToPoint(context, x1, y1, x2, y2, radius);  // 这种类型的代码重复四次
 
 CGContextDrawPath(UIGraphicsGetCurrentContext(), .FillStroke)
 let output = UIGraphicsGetImageFromCurrentImageContext();
 UIGraphicsEndImageContext();
 return output
 }
 
 作者：bestswifter
 链接：http://www.jianshu.com/p/f970872fdc22
 來源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。*/

//- (UIImage *)HY_drawRectWithRoundedCorner:(CGFloat)radius borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)color borderColor:(UIColor *)color  {
//    
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.bounds.size.width, self.bounds.size.width), NO, [UIScreen mainScreen].scale);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//}


/** func kt_addCorner(radius radius: CGFloat,
 borderWidth: CGFloat,
 backgroundColor: UIColor,
 borderColor: UIColor) {
 let imageView = UIImageView(image: kt_drawRectWithRoundedCorner(radius: radius,
 borderWidth: borderWidth,
 backgroundColor: backgroundColor,
 borderColor: borderColor))
 self.insertSubview(imageView, atIndex: 0)
 }
 
 作者：bestswifter
 链接：http://www.jianshu.com/p/f970872fdc22
 來源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。*/


- (void)HY_addCorner:(CGFloat)radius borderWith:(CGFloat)borderWidth backgroundColor:(UIColor *)color borderColor:(UIColor *)color {
    
}

@end
