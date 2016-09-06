//
//  TLPopModalView.h
//  TLFrameWork
//
//  Created by yulingsong on 16/8/26.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLPopModalView : UIView

/**
 *  快速创建
 */
+(instancetype)touchIDView;

/**
 *  弹出
 */
-(void)show;
-(void)showInView:(UIView *)view;
//移除
-(void)remove;
@end
