//
//  TLHomeViewController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLHomeViewController.h"
//#import "bViewController.h"

@interface TLHomeViewController ()
/** Welcome */
@property (nonatomic,strong) UILabel *welcome;
/** start */
@property (nonatomic,strong) UIButton *startBtn;


@end

@implementation TLHomeViewController
-(UILabel *)welcome
{
    if (!_welcome)
    {
        _welcome = [[UILabel alloc]init];
    }
    return _welcome;
}
-(UIButton *)startBtn
{
    if (!_startBtn)
    {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _startBtn;
}

-(id)init
{
    if (self = [super init])
    {
        //设置题目
        self.title = @"首页";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSubViews];
}

-(void)setSubViews
{
    
    self.welcome = [UILabel labelWithFrame:TLRect(107/375, 136/667, 161/375, 38/667) BackgroundColor:[UIColor clearColor] text:@"Welcome" textColor:TLColor(239, 38, 38) textAlignment:NSTextAlignmentCenter font:TLFont(30/375)];
    [self.view addSubview:self.welcome];
    
    self.startBtn = [UIButton buttonWithFrame:TLRect(114/375, 282/667, 147/375, 39/667) backgroundColor:TLColor(255, 61, 61) title:@"立即开始" target:self selection:@selector(clickStart)];
    [self.startBtn.layer setCornerRadius:TLSize(10/375)];
    [self.view addSubview:self.startBtn];
}

-(void)clickStart
{
    NSLog(@"11");
//    RDVTabBarController *tabsController = [[RDVTabBarController alloc]init];
//    tabsController.selectedIndex = 2;
    [[self rdv_tabBarController] setSelectedIndex:1];
}

@end
