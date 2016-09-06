//
//  TLNotificationController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLNotificationController.h"
#import "TSMessage.h"
#import "TSBlurView.h"
#import "TSMessageView.h"

@interface TLNotificationController()

@end

@implementation TLNotificationController
/*
 隐藏显示tabbar
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
}


-(void)viewDidLoad
{
    self.title = @"Notification";
    self.view.backgroundColor = TLMainBackColor;
    
    //添加信息表现
    NSString *msg = @"Framework7 comes with simple Notifications component that allows you to show some useful messages to user.";
    UILabel *noticeLb1 = [UILabel labelWithFrame:TLRect(15/375, 20/667, 345/375, 80/667) BackgroundColor:TLClearColor text:msg textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft font:TLFont(14/375)];
    noticeLb1.numberOfLines = 0;
    [self.view addSubview:noticeLb1];
    
    //循环添加按钮
    NSArray *arr = @[@"Default Notification",@"Full-layout Notification",@"With custom image",@"Success",@"Error",@"Warning"];
    for (int i = 0; i < 6; i ++)
    {
        UIButton *button = [UIButton buttonWithFrame:TLRect(15/375, (110 + i * 45)/667, 345/375, 25/667) backgroundColor:[UIColor clearColor] title:arr[i] cornerRdius:5 target:self selection:@selector(click:)];
        button.tag = i + 100;
        [self.view addSubview:button];
    }
}

//按钮点击事件，根据tag值来触发不同的事件
-(void)click:(UIButton *)button
{
    if(button.tag == 100)
    {
        [TSMessage showNotificationWithTitle:@"Framework7"
                                    subtitle:@"This is a simple notification message with title and message"
                                        type:TSMessageNotificationTypeMessage];
        
    }else if (button.tag == 101)
    {
        [TSMessage showNotificationInViewController:self
                                              title:@"Update available"
                                           subtitle:@"Please update the app"
                                              image:nil
                                               type:TSMessageNotificationTypeMessage
                                           duration:TSMessageNotificationDurationAutomatic
                                           callback:nil
                                        buttonTitle:@"Update"
                                     buttonCallback:^{
                                         NSLog(@"User tapped the button");
                                     }
                                         atPosition:TSMessageNotificationPositionTop
                               canBeDismissedByUser:YES];
    }else if (button.tag == 102)
    {
        [TSMessage showNotificationInViewController:self
                                              title:NSLocalizedString(@"My Awesome App", nil)
                                           subtitle:NSLocalizedString(@"New message from John Doe\nHello, how are you? Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut posuere erat. Pellentesque id elementum urna, a aliquam ante. Donec vitae volutpat orci. Aliquam sed molestie risus, quis tincidunt dui.", nil)
                                              image:[UIImage imageNamed:@"img_Oval"]
                                               type:TSMessageNotificationTypeMessage
                                           duration:TSMessageNotificationDurationAutomatic
                                           callback:nil
                                        buttonTitle:nil
                                     buttonCallback:nil
                                         atPosition:TSMessageNotificationPositionTop
                               canBeDismissedByUser:YES];
    }else if(button.tag == 103)
    {
        [TSMessage showNotificationWithTitle:NSLocalizedString(@"Framework7 Success", nil)
                                    subtitle:NSLocalizedString(@"Some task was successfully completed!", nil)
                                        type:TSMessageNotificationTypeSuccess];
    }else if(button.tag == 104)
    {
        [TSMessage showNotificationWithTitle:NSLocalizedString(@"Framework7 failed", nil)
                                    subtitle:NSLocalizedString(@"The internet connection seems to be down. Please check that!", nil)
                                        type:TSMessageNotificationTypeError];
    }else if(button.tag == 105)
    {
        [TSMessage showNotificationWithTitle:NSLocalizedString(@"Framework7 warning", nil)
                                    subtitle:NSLocalizedString(@"Look out! Something is happening there!", nil)
                                        type:TSMessageNotificationTypeWarning];
    }
}

@end
