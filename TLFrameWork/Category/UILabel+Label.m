//
//  UILabel+Label.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "UILabel+Label.h"

@implementation UILabel (Label)
+(UILabel *)labelWithFrame:(CGRect)frame BackgroundColor:(UIColor *)bgColor text:(NSString *)text textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc]init];
    [label setFrame:frame];
    [label setBackgroundColor:bgColor];
    [label setText:text];
    [label setTextColor:textColor];
    [label setTextAlignment:textAlignment];
    [label setFont:font];
    return label;
}
@end
