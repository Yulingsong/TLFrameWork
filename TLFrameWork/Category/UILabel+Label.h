//
//  UILabel+Label.h
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Label)

+(UILabel *)labelWithFrame:(CGRect)frame BackgroundColor:(UIColor *)bgColor text:(NSString *)text textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)TextAlignment font:(UIFont *)font;

@end
