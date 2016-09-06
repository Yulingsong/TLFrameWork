//
//  TLPopupController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/26.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLPopupController.h"

@interface TLPopupController()<UIScrollViewDelegate>

@end

@implementation TLPopupController
//进入页面的时候隐藏tabbar
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

-(void)viewDidLoad
{
    self.title = @"Modals";
    self.view.backgroundColor = TLMainBackColor;
    //调用设置子控件的方法
    [self setSubViews];
}

/**
 *  设置子控件
 */
-(void)setSubViews
{
    //子控件
    UIView *topView = [[UIView alloc]initWithFrame:TLRect(0, 0/667, 1, 64/667)];
    [topView setBackgroundColor:TLColor(247, 247, 248)];
    [self.view addSubview:topView];
    
    UILabel *titleLb = [UILabel labelWithFrame:TLRect(0, 20/667, 1, 44/667) BackgroundColor:[UIColor clearColor] text:@"Popup Title" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter font:TLFont(18/375)];
    [topView addSubview:titleLb];
    
    UIButton *button = [UIButton buttonWithFrame:TLRect(310/375, 20/667, 55/375, 44/667) backgroundColor:[UIColor clearColor] title:@"Done" target:self selection:@selector(clickToPop)];
    [button setTitleColor:TLColor(0, 122, 255) forState:UIControlStateNormal];
    [topView addSubview:button];
    
    /**
     用于滑动的scrollview
     */
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:TLRect(0, 64/667, 1, 603/667)];
    scroll.backgroundColor = TLMainBackColor;
    scroll.contentSize = TLSizeMake(1, 900/667);
    scroll.delegate = self;
    [self.view addSubview:scroll];
    
    /**
     *  显示文字的标签
     */
    NSString *content = @"Here comes popup. You can put here anything, even independent view with its own navigation. Also not, that by default popup looks a bit different on iPhone/iPod and iPad, on iPhone it is fullscreen.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse faucibus mauris leo, eu bibendum neque congue non. Ut leo mauris, eleifend eu commodo a, egestas ac urna. Maecenas in lacus faucibus, viverra ipsum pulvinar, molestie arcu. Etiam lacinia venenatis dignissim. Suspendisse non nisl semper tellus malesuada suscipit eu et eros. Nulla eu enim quis quam elementum vulputate. Mauris ornare consequat nunc viverra pellentesque. Aenean semper eu massa sit amet aliquam. Integer et neque sed libero mollis elementum at vitae ligula. Vestibulum pharetra sed libero sed porttitor. Suspendisse a faucibus lectus.\n\nDuis ut mauris sollicitudin, venenatis nisi sed, luctus ligula. Phasellus blandit nisl ut lorem semper pharetra. Nullam tortor nibh, suscipit in consequat vel, feugiat sed quam. Nam risus libero, auctor vel tristique ac, malesuada ut ante. Sed molestie, est in eleifend sagittis, leo tortor ullamcorper erat, at vulputate eros sapien nec libero. Mauris dapibus laoreet nibh quis bibendum. Fusce dolor sem, suscipit in iaculis id, pharetra at urna. Pellentesque tempor congue massa quis faucibus. Vestibulum nunc eros, convallis blandit dui sit amet, gravida adipiscing libero.\n\nMorbi posuere ipsum nisl, accumsan tincidunt nibh lobortis sit amet. Proin felis lorem, dictum vel nulla quis, lobortis dignissim nunc. Pellentesque dapibus urna ut imperdiet mattis. Proin purus diam, accumsan ut mollis ac, vulputate nec metus. Etiam at risus neque. Fusce tincidunt, risus in faucibus lobortis, diam mi blandit nunc, quis molestie dolor tellus ac enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum turpis a velit vestibulum pharetra. Vivamus blandit dapibus cursus. Aenean lorem augue, vehicula in eleifend ut, imperdiet quis felis.\n\nDuis non erat vel lacus consectetur ultricies. Sed non velit dolor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel varius mi, a tristique ante. Vivamus eget nibh ac elit tempor bibendum sit amet vitae velit. Proin sit amet dapibus nunc, non porta tellus. Fusce interdum vulputate imperdiet. Sed faucibus metus at pharetra fringilla. Fusce mattis orci et massa congue, eget dapibus ante rhoncus. Morbi semper sed tellus vel dignissim. Cras vestibulum, sapien in suscipit tincidunt, lectus mi sodales purus, at egestas ligula dui vel erat. Etiam cursus neque eu lectus eleifend accumsan vitae non leo. Aliquam scelerisque nisl sed lacus suscipit, ac consectetur sapien volutpat. Etiam nulla diam, accumsan ut enim vel, hendrerit venenatis sem. Vestibulum convallis justo vitae pharetra consequat. Mauris sollicitudin ac quam non congue.";
    
    UILabel *textLb = [UILabel labelWithFrame:TLRect(20/375, 40/667, 335/375, 800/667) BackgroundColor:[UIColor clearColor] text:content textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
    textLb.numberOfLines = 0;
    [scroll addSubview:textLb];
}

#pragma mark --- UIScrollViewDelegate
//只要滚动了就会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{}
//开始拖拽视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{}

//完成拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
{}

//将开始降速时
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;
{}

//减速停止了时执行，手触摸时执行执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{}

//滚动动画停止时执行,代码改变时出发,也就是setContentOffset改变时
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
{}

//滚动视图完成滚动时,将会发送此消息的内容(如果顶部的内容已经显示)
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;
{}

//点击退出该页面
-(void)clickToPop
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
