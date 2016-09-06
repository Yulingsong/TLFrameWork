//
//  UIView+view.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/25.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "UIView+view.h"

@implementation UIView (view)

+(UIView *)viewWithFrame:(CGRect)frame
{
    UIView *line = [[UIView alloc]init];
    [line setFrame:frame];
    [line setBackgroundColor:[UIColor lightGrayColor]];
    return line;
}


@end
