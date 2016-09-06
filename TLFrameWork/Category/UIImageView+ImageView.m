//
//  UIImageView+ImageView.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/29.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "UIImageView+ImageView.h"

@implementation UIImageView (ImageView)
+(UIImageView *)imageViewWithFrame:(CGRect)frame image:(NSString *)image
{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = frame;
    imageView.image = [UIImage imageNamed:image];
    
    return imageView;
}
@end
