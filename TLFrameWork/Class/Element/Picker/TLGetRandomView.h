//
//  TLGetRandomView.h
//  TLFrameWork
//
//  Created by yulingsong on 16/8/31.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLGetRandomView : UIView

/** array */
@property (nonatomic,strong) NSString *title;;

/**
 *  快速创建
 */
+(instancetype)touchIDView;

/**
 *  弹出
 */
-(void)show;
-(void)showInView:(UIView *)view;
@end
