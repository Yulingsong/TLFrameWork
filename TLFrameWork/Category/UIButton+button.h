//
//  UIButton+button.h
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (button)

/*
 * 普通按钮
 */
+(UIButton *)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor title:(NSString *)title target:(id)target selection:(SEL)selection;

/*
 * 可设置圆角按钮
 */
+(UIButton *)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor title:(NSString *)title cornerRdius:(CGFloat)cornerRdius;

/*
 * 蓝色边框蓝色文字可点击按钮
 */
+(UIButton *)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor title:(NSString *)title cornerRdius:(CGFloat)cornerRdius target:(id)target selection:(SEL)selection;
@end
