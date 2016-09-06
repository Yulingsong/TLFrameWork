//
//  UIButton+button.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "UIButton+button.h"

@implementation UIButton (button)
/*
 *
 */
+(UIButton *)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor title:(NSString *)title target:(id)target selection:(SEL)selection
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setBackgroundColor:bgColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selection forControlEvents:UIControlEventTouchUpInside];
    return button;
}

/*
 *
 */
+(UIButton *)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor title:(NSString *)title cornerRdius:(CGFloat)cornerRdius
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setBackgroundColor:bgColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:cornerRdius];
    [button.layer setBorderWidth:1];
    [button.layer setBorderColor:TLColor(0, 122, 255).CGColor];
    return button;
}

/*
 *
 */
+(UIButton *)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor title:(NSString *)title cornerRdius:(CGFloat)cornerRdius target:(id)target selection:(SEL)selection
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setBackgroundColor:bgColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:cornerRdius];
    [button.titleLabel setFont:TLFont(15/375)];
    [button.layer setBorderWidth:1];
    [button.layer setBorderColor:TLColor(0, 122, 255).CGColor];
    [button setTitleColor:TLBlueColor forState:UIControlStateNormal];
    [button addTarget:target action:selection forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
