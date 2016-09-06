//
//  TLCalendarController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLCalendarController.h"
#import "WHUCalendarPopView.h"
#import "WHUCalendarView.h"

@interface TLCalendarController()<UITextFieldDelegate>
{
    //弹出日历
    WHUCalendarPopView* _pop;
    WHUCalendarPopView* _pop1;
}
/** scroll */
@property (nonatomic,strong) UIScrollView *scroll;

/** text */
@property (nonatomic,strong) UITextField *text1;
/** text */
@property (nonatomic,strong) UITextField *text2;
/** text */
@property (nonatomic,strong) UITextField *text3;

/** calendar */
@property (nonatomic,strong) WHUCalendarView *calview;


@end
@implementation TLCalendarController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
}
//懒加载
-(UIScrollView *)scroll
{
    if (!_scroll)
    {
        _scroll = [[UIScrollView alloc]initWithFrame:TLRect(0, 0, 1, 603/667)];
        _scroll.backgroundColor = TLMainBackColor;
        _scroll.contentSize = TLSizeMake(1, 850/667);
        [self.view addSubview:_scroll];
    }
    return _scroll;
}

-(void)viewDidLoad
{
    self.title = @"Calendar";
    self.view.backgroundColor = TLMainBackColor;
    
    [self setSubviews];
    [self setCanlendars];
}

//页面设置控件
-(void)setSubviews
{
    //label
    NSString *msg = @"Calendar is a touch optimized component that provides an easy way to handle dates.\n\nCalendar could be used as inline component or as overlay. Overlay Calendar will be automatically converted to Popover on tablets (iPad).";
    UILabel *noticeLb1 = [UILabel labelWithFrame:TLRect(15/375, 25/667, 345/375, 150/667) BackgroundColor:[UIColor clearColor] text:msg textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(14/375)];
    noticeLb1.numberOfLines = 0;
    [self.scroll addSubview:noticeLb1];
    
    NSArray *msgArr = @[@"Default setup",@"Custom date format",@"Inline with custom toolbar"];
    NSArray *placeholderArr = @[@"Your birth date",@"Select date",@"Select date on view"];;
    
    //循环添加view和textfield
    for (int i = 0; i < 3; i++)
    {
        UILabel *label = [UILabel labelWithFrame:TLRect(15/375, (175 + i * 100)/667, 345/375, 20/667) BackgroundColor:[UIColor clearColor] text:msgArr[i] textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
        [self.scroll addSubview:label];
        
        UIView *view = [[UIView alloc]initWithFrame:TLRect(0, (200 + 100 * i)/667, 1, 50/667)];
        view.backgroundColor = [UIColor whiteColor];
        [self.scroll addSubview:view];
        
        UIView *line11 = [UIView viewWithFrame:TLRect(0, 0, 1, 0.5/667)];
        [view addSubview:line11];
        UIView *line12 = [UIView viewWithFrame:TLRect(0, 49.5/667, 1, 0.5/667)];
        [view addSubview:line12];
        
        UITextField *text = [UITextField textFieldWithFrame:TLRect(15/375, 1/667, 345/375, 48/667) placehodler:placeholderArr[i]];
        text.delegate = self;
        text.tag = 100 + i;
        [view addSubview:text];
        if (text.tag == 100)
        {
            self.text1 = text;
        }else if (text.tag == 101)
        {
            self.text2 = text;
        }else if (text.tag == 102)
        {
            self.text3 = text;
        }
    }
    
    //页面日历设置
    __weak typeof(self) weakSelf1 = self;
    self.calview = [[WHUCalendarView alloc]init];
    [self.calview setFrame:TLRect(0, 450/667, 1, 400/667)];
    self.calview.tagStringOfDate=^NSString*(NSArray* calm,NSArray* itemDateArray){
        NSLog(@"%@",calm);
        //如果当前日期中的天数,可以被5整除,显示 预约
        if([itemDateArray[2] integerValue]%5==0){
            return nil;
        }
        else{
            return nil;
        }
    };
    
    self.calview.onDateSelectBlk=^(NSDate* date){
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        NSString *dateString = [format stringFromDate:date];
        NSLog(@"calview:%@",dateString);
        weakSelf1.text3.text = dateString;
    };
    [self.scroll addSubview:self.calview];
}

//设置弹出日历
-(void)setCanlendars
{
    __weak typeof(self) weakSelf = self;
    _pop=[[WHUCalendarPopView alloc] init];
    _pop.onDateSelectBlk=^(NSDate* date){
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        NSString *dateString = [format stringFromDate:date];
        NSLog(@"%@",dateString);
        weakSelf.text1.text = dateString;
    };
    _pop1=[[WHUCalendarPopView alloc] init];
    _pop1.onDateSelectBlk=^(NSDate* date){
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"MMMM，EEEE dd , yyyy"];
        NSString *dateString = [format stringFromDate:date];
        NSLog(@"%@",dateString);
        weakSelf.text2.text = dateString;
    };

}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag == 100)
    {
        [_pop show];
        
    }else if (textField.tag == 101)
    {
        [_pop1 show];
    }
    return NO;
}


@end
