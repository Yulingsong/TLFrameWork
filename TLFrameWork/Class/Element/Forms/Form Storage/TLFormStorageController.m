//
//  TLFormStorageController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/9/1.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLFormStorageController.h"

@interface TLFormStorageController ()<UITextFieldDelegate>
/** scroll */
@property (nonatomic,strong) UIScrollView *scroll;

@end

@implementation TLFormStorageController
#pragma mark ---- 显示以及隐藏tabbar
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Form Stogare";
    self.view.backgroundColor = TLMainBackColor;
    

    [self setSubviews];
}

-(void)setSubviews
{
    NSString *msg = @"With forms storage it is easy to store and parse forms data, especially on Ajax loaded pages. All you need to make it work is to add ""store-data"" class to your <form> and Framework7 will store form data with every input change. And the most awesome part is that when you load this page again Framework7 will parse this data and fill all form fields automatically! Just try to fill the form below and then go to any other page, or even you may close this site, and when you will back here form fields will keep your data.";
    
    UILabel *noticeLb1 = [UILabel labelWithFrame:TLRect(15/375, 25/667, 345/375, 200/667) BackgroundColor:[UIColor clearColor] text:msg textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(14/375)];
    noticeLb1.numberOfLines = 0;
    [self.scroll addSubview:noticeLb1];
    
    UILabel *noticeLb2 = [UILabel labelWithFrame:TLRect(15/375, 225/667, 345/375, 45/667) BackgroundColor:[UIColor clearColor] text:@"PERSONAL DETAILS" textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
    [self.scroll addSubview:noticeLb2];
    
    
    NSArray *array = @[@"Name",@"E-mail",@"URL",@"Password",@"Phone",@"Gender",@"Birth date",@"Switch"];
    NSArray *array1 = @[@"Your Name",@"E-mail",@"URL",@"Password",@"Phone",@"Gender",@"Birth date",@"Switch"];
    
    NSString *str = [[NSUserDefaults standardUserDefaults]objectForKey:@"Name"];
    NSString *str1 = [[NSUserDefaults standardUserDefaults]objectForKey:@"Email"];
    NSString *str2 = [[NSUserDefaults standardUserDefaults]objectForKey:@"URL"];
    NSString *str3 = [[NSUserDefaults standardUserDefaults]objectForKey:@"Password"];
    NSString *str4 = [[NSUserDefaults standardUserDefaults]objectForKey:@"Phone"];
    NSString *str5 = [[NSUserDefaults standardUserDefaults]objectForKey:@"Gender"];
    NSString *str6 = [[NSUserDefaults standardUserDefaults]objectForKey:@"BirthDate"];    
    NSString *str7 = [[NSUserDefaults standardUserDefaults]objectForKey:@"switch"];
    
    for (int i = 0; i < array.count; i++)
    {
        UIView *view = [[UIView alloc]initWithFrame:TLRect(0, (270 + i * 50)/667, 1, 50/667)];
        view.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:TLRect(15/375, 10/667, 30/375, 30/667)];
        imageView.image = [UIImage imageNamed:@"third_selected"];
        [view addSubview:imageView];
        
        UILabel *nameLabel = [UILabel labelWithFrame:TLRect(60/375, 0, 100/275, 49/667) BackgroundColor:[UIColor clearColor] text:array[i] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
        [view addSubview:nameLabel];
        
        UIView *line = [UIView viewWithFrame: TLRect(60/375, 49.5/667, 315/375, 0.5/667)];
        [view addSubview:line];
        
        if (i < 7)
        {
            UITextField *text = [[UITextField alloc]initWithFrame:TLRect(160/375, 0, 200/375, 49/667)];
            text.delegate = self;
            text.placeholder = array1[i];
            text.tag = i + 100;
            [view addSubview:text];
            
            if (text.tag == 100)
            {
                if (str)
                {
                    text.text = str;
                }
            }
            if (text.tag == 101)
            {
                if (str1)
                {
                    text.text = str1;
                }
            }
            if (text.tag == 102)
            {
                if (str2)
                {
                    text.text = str2;
                }
            }
            if (text.tag == 103)
            {
                if (str3)
                {
                    text.text = str3;
                }
            }
            if (text.tag == 104)
            {
                if (str4)
                {
                    text.text = str4;
                }
            }
            if (text.tag == 105)
            {
                if (str5)
                {
                    text.text = str5;
                }
            }
            if (text.tag == 106)
            {
                if (str6)
                {
                    text.text = str6;
                }
            }
            
        }else
        {
            UISwitch *switch1 = [[UISwitch alloc]initWithFrame:TLRect(160/375, 10/667, 40/375, 30/667)];
            if (!str7)
            {
                str7 = nil;
            }
            [switch1 setOn:str7];
            [switch1 addTarget:self action:@selector(changeVlaue:) forControlEvents:UIControlEventValueChanged];
            [view addSubview:switch1];
        }
        
        
        [self.scroll addSubview:view];
    }
    

}

-(void)changeVlaue:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"switch"];
    }else {
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"switch"];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"1111");
    [self.view endEditing:YES];
    [self.scroll endEditing:YES];
    [self.view resignFirstResponder];
    [self.scroll resignFirstResponder];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag == 100)
    {
        [[NSUserDefaults standardUserDefaults]setObject:textField.text forKey:@"Name"];
    }else if (textField.tag == 101)
    {
        [[NSUserDefaults standardUserDefaults]setObject:textField.text forKey:@"Email"];
    }else if (textField.tag == 102)
    {
        [[NSUserDefaults standardUserDefaults]setObject:textField.text forKey:@"URL"];
    }else if (textField.tag == 103)
    {
        [[NSUserDefaults standardUserDefaults]setObject:textField.text forKey:@"Password"];
    }else if (textField.tag == 104)
    {
        [[NSUserDefaults standardUserDefaults]setObject:textField.text forKey:@"Phone"];
    }else if (textField.tag == 105)
    {
        [[NSUserDefaults standardUserDefaults]setObject:textField.text forKey:@"Gender"];
    }else if (textField.tag == 106)
    {
        [[NSUserDefaults standardUserDefaults]setObject:textField.text forKey:@"BirthDate"];
    }
    
    return YES;
}










@end
