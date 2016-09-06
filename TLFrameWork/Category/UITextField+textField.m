//
//  UITextField+textField.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/25.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "UITextField+textField.h"

@implementation UITextField (textField)

+(UITextField *)textFieldWithFrame:(CGRect)frame placehodler:(NSString *)placeholder
{
    UITextField *text = [[UITextField alloc]init];
    [text setFrame:frame];
    [text setPlaceholder:placeholder];
    
    
    return text;
}

@end
