//
//  TLPikcerController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLPikcerController.h"
#import "MMPickerView.h"
#import "zySheetPickerView.h"
#import "TLGetPickerView.h"
#import "TLGetCarInfoVIew.h"
#import "TLGetRandomView.h"

@interface TLPikcerController()<UITextFieldDelegate>
/** scroll */
@property (nonatomic,strong) UIScrollView *scroll;

/** text */
@property (nonatomic,strong) UITextField *text1;
/** text */
@property (nonatomic,strong) UITextField *text2;
/** text */
@property (nonatomic,strong) UITextField *text3;
/** text */
@property (nonatomic,strong) UITextField *text4;
/** text */
@property (nonatomic,strong) UITextField *text5;
/** array */
@property (nonatomic,strong) NSArray *personArr;;
/** string */
@property (nonatomic,strong) NSString *string1;

@end
@implementation TLPikcerController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
}

-(NSArray *)personArr
{
    if (!_personArr)
    {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"People.plist" ofType:nil];
        _personArr = [NSArray arrayWithContentsOfFile:path];
    }
    return _personArr;
}

-(UIScrollView *)scroll
{
    if (!_scroll)
    {
        _scroll = [[UIScrollView alloc]initWithFrame:TLRect(0, 0, 1, 603/667)];
        _scroll.backgroundColor = TLMainBackColor;
        _scroll.contentSize = TLSizeMake(1, 870/667);
        [self.view addSubview:_scroll];
    }
    return _scroll;
}

-(void)viewDidLoad
{
    self.title = @"Pikcer";
    self.view.backgroundColor = TLMainBackColor;

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getresult:) name:@"post" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getresult1:) name:@"post1" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getresult2:) name:@"post2" object:nil];
    [self setSubviews];

}
-(void)getresult:(NSNotification* )notification
{
    self.text2.text = notification.object;
}

-(void)getresult1:(NSNotification* )notification
{
    self.text3.text = notification.object;
}
-(void)getresult2:(NSNotification* )notification
{
    self.text4.text = notification.object;
}

-(void)setSubviews
{
    NSString *msg = @"Picker is a powerful component that allows you to create custom overlay pickers which looks like iOS native picker.\n\nPicker could be used as inline component or as overlay. Overlay Picker will be automatically converted to Popover on tablets (iPad).";
    UILabel *noticeLb1 = [UILabel labelWithFrame:TLRect(15/375, 25/667, 345/375, 150/667) BackgroundColor:[UIColor clearColor] text:msg textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(14/375)];
    noticeLb1.numberOfLines = 0;
    [self.scroll addSubview:noticeLb1];
    
    NSArray *msgArr = @[@"PICKER WITH SINGLE VALUE",@"2 VALUES AND 3D-ROTATE EFFECT",@"DEPENDENT VALUESs",@"CUSTOM TOOLBAR",@"INLINE PICKER/DATE-TIME"];
    NSArray *placeholderArr = @[@"Your iOS device",@"Describe yourself",@"Your car",@"Describe yourself",@"111"];
    
    for (int i = 0; i < 5; i++)
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
        }else if (text.tag == 103)
        {
            self.text4 = text;
        }else if (text.tag == 104)
        {
            self.text5 = text;
        }
    }
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy - MM - dd     HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    self.text5.text = dateString;
//    NSLog(@"dateString:%@",dateString);

    UIDatePicker *picker = [[UIDatePicker alloc]init];
    [picker setFrame:TLRect(0, 650/667, 1, 220/667)];
    picker.backgroundColor = [UIColor whiteColor];
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    picker.datePickerMode = UIDatePickerModeDateAndTime;
    [self.scroll addSubview:picker];
    [picker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)dateChange:(UIDatePicker *)datePicker
{
    NSLog(@"%@",datePicker.date);
    // 日期转换字符串
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    fmt.dateFormat = @"yyyy - MM - dd     HH:mm";
    
    NSString *dateStr = [fmt stringFromDate:datePicker.date];
    
    self.text5.text = dateStr;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag == 100)
    {
        NSArray * str  = @[@"iPhone4",@"iPhone4S",@"iPhone5",@"iPhone5S",@"iPhone5C",@"iPhone6",@"iPhone6Plus",@"iPhone6S",@"iPhone6SPlus"];
        zySheetPickerView *pickerView = [zySheetPickerView ZYSheetStringPickerWithTitle:str andHeadTitle:@"Device" Andcall:^(zySheetPickerView *pickerView, NSString *choiceString) {
            self.text1.text = choiceString;
            [pickerView dismissPicker];
        }];
        [pickerView show];
        
    }else if (textField.tag == 101)
    {
        TLGetPickerView *picker = [[TLGetPickerView alloc]init];
        picker.array = self.personArr;
       picker.title = @"Describe yourself";
        [picker show];

    }else if (textField.tag == 102)
    {
        TLGetCarInfoVIew *picker = [[TLGetCarInfoVIew alloc]init];
        picker.title = @"Your car";
        [picker show];
    }else
    {
        TLGetRandomView *picker = [[TLGetRandomView alloc]init];
        picker.title = nil;
        [picker show];
    }
    return NO;
}






@end
