//
//  TLConfig.h
//  TLFrameWork
//
//  Created by yulingsong on 16/8/23.
//  Copyright © 2016年 yulingsong. All rights reserved.
//
/**
 *  用于编写全局配置参数
 */
#ifndef TLConfig_h
#define TLConfig_h


#import <Availability.h>

#ifndef __IPHONE_6_0
#warning "This project uses features only available in iOS SDK 6.0 and later."
#endif

#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#endif


#define APPNAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define SCREEN_WIDTH     [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define RECTSTATUS_HEIGHT    [[UIApplication sharedApplication] statusBarFrame].size.height
#define RECTNAV_HEIGHT      self.navigationController.navigationBar.frame.size.height
#define ImageWithName(name)\[UIImage imageNamed:name]

#define TLRect(x, y, w, h)  CGRectMake([UIScreen mainScreen].bounds.size.width * x, [UIScreen mainScreen].bounds.size.height * y, [UIScreen mainScreen].bounds.size.width * w,  [UIScreen mainScreen].bounds.size.height * h)
#define TLSizeMake(w, h)  CGSizeMake([UIScreen mainScreen].bounds.size.width * w, [UIScreen mainScreen].bounds.size.height * h)
#define TLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define TLColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define TLMainBackColor [UIColor colorWithRed:240/255.0 green:239/255.0 blue:245/255.0 alpha:1]
#define TLBlueColor [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1]
#define TLClearColor [UIColor clearColor]

#define TLFont(f) [UIFont systemFontOfSize:[UIScreen mainScreen].bounds.size.width * f]
#define TLSize(s) [UIScreen mainScreen].bounds.size.width * s
#define TLHeight(h) [UIScreen mainScreen].bounds.size.height * h

#define TLNotificationCenter [NSNotificationCenter defaultCenter]
#define TLUserDefault [NSUserDefaults standardUserDefaults]

#define hiddentabbar [[self rdv_tabBarController] setTabBarHidden:YES animated:YES]

#define TLAlert(tipMsg)    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Framework7" message:\
tipMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];\
[alertView show];

#define TLAlertTitlt @"Framework7"



//以及各种第三方服务商的appId或者App key

#endif /* TLConfig_h */
