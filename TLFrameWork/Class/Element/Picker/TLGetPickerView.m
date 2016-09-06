//
//  TLGetPickerView.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/31.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLGetPickerView.h"


@interface TLGetPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>
/** view */
@property (nonatomic,strong) UIView *topView;
/** button */
@property (nonatomic,strong) UIButton *doneBtn;
/** pickerView */
@property (nonatomic,strong) UIPickerView *pickerView;
/** srting */
@property (nonatomic,strong) NSString *result;
@property (nonatomic,strong) NSString *result1;

@end


@implementation TLGetPickerView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    
    if (self)
    {
        self.backgroundColor = TLColorAlpha(0, 0, 0, 0.4);
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    self.topView = [[UIView alloc]initWithFrame:TLRect(0, 417/667, 1, 50/667)];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topView];
    
    self.doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.doneBtn setTitle:@"Done" forState:UIControlStateNormal];
    [self.doneBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.doneBtn setFrame:TLRect(320/375, 5/667, 50/375, 40/667)];
    [self.doneBtn addTarget:self action:@selector(quit) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.doneBtn];
    
    UILabel *titlelb = [UILabel labelWithFrame:TLRect(100/375, 0, 175/375, 50/667) BackgroundColor:[UIColor clearColor] text:self.title textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter font:TLFont(18/375)];
    [self.topView addSubview:titlelb];
    
    self.pickerView = [[UIPickerView alloc]init];
    [self.pickerView setFrame:TLRect(0, 467/667, 1, 200/667)];
    [self.pickerView setBackgroundColor:[UIColor whiteColor]];
    [self.pickerView setDelegate:self];
    [self.pickerView setDataSource:self];
    
    [self addSubview:self.pickerView];
    
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


-(void)quit
{
    
    if (!self.result)
    {
        self.result = self.array[0][0];
    }
    if (!self.result1)
    {
        self.result1 = self.array[1][0];
    }
    [self removeFromSuperview];
    NSString *string = [NSString stringWithFormat:@"%@ %@",self.result,self.result1];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"post" object:string];

//    NSLog(@"%@",string);
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.array.count;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.array[component] count];
}

#pragma mark - 代理
// 返回第component列第row行的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.array[component][row];
}

// 选中第component第row的时候调用
// __func__： 返回当前方法在哪个类里面调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        self.result = self.array[component][row];
    }else
    {
        self.result1 = self.array[component][row];
    }
}




@end
