
//
//  TLPopModalView.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/26.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLPopModalView.h"

@interface TLPopModalView()

/** topView */
@property (nonatomic,strong) UIView *topView;
/** DoneBtn */
@property (nonatomic,strong) UIButton *DoneBtn;
/** contentLb */
@property (nonatomic,strong) UILabel *contentLb;

@end

@implementation TLPopModalView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:TLRect(0, 442/667, 1, 225/667)];
    
    if (self)
    {
        self.backgroundColor = TLMainBackColor;
    }
    
    return self;
}

/**
 *  设置子控件
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    UIView *line1 = [UIView viewWithFrame:TLRect(0, 0, 1, 0.5/667)];
    [self addSubview:line1];
    
    self.topView = [[UIView alloc]initWithFrame:TLRect(0, 0.5/667, 1, 44/667)];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topView];
    
    self.DoneBtn = [UIButton buttonWithFrame:TLRect(310/375, 0.5/667, 55/375, 44/667) backgroundColor:[UIColor whiteColor] title:@"Done" target:self selection:@selector(clickToHide)];
    [self.DoneBtn setTitleColor:TLColor(0, 122, 255) forState:UIControlStateNormal];
    [self.topView addSubview:self.DoneBtn];
    
    UIView *line2 = [UIView viewWithFrame:TLRect(0, 44.5/667, 1, 0.5/667)];
    [self addSubview:line2];
    
    NSString *content = @"Integer mollis nulla id nibh elementum finibus. Maecenas eget fermentum ipsum. Sed sagittis condimentum nisl at tempus. Duis lacus libero, laoreet vitae ligula a, aliquet eleifend sapien. Nullam sodales viverra sodales. Nulla hendrerit condimentum dolor facilisis tempor. Donec at est malesuada, sagittis nisi et, accumsan enim.";
    self.contentLb = [UILabel labelWithFrame:TLRect(20/375, 57/667, 335/375, 150/667) BackgroundColor:[UIColor clearColor] text:content textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
    _contentLb.numberOfLines = 0;
    [self addSubview:self.contentLb];

}

/**
 *  快速创建
 */
+ (instancetype)touchIDView
{
    return [[self alloc]init];
}
/** 弹出 */
- (void)show
{
    [self showInView:[UIApplication sharedApplication].keyWindow];
}
- (void)showInView:(UIView *)view
{
    // 浮现
    [view addSubview:self];
}

-(void)remove
{
    [self removeFromSuperview];
}
//收起弹出view
-(void)clickToHide
{
    [self removeFromSuperview];
}
@end
