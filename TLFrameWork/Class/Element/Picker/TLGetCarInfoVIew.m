//
//  TLGetCarInfoVIew.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/31.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLGetCarInfoVIew.h"

@interface TLGetCarInfoVIew()<UIPickerViewDelegate,UIPickerViewDataSource>
/** view */
@property (nonatomic,strong) UIView *topView;
/** button */
@property (nonatomic,strong) UIButton *doneBtn;
/** pickerView */
@property (nonatomic,strong) UIPickerView *pickerView;
/** dict */
@property (nonatomic,strong) NSDictionary *dict;
/** array */
@property (nonatomic,strong) NSArray *cityArr;
/** array */
@property (nonatomic,strong) NSArray *carArr;

/** string */
@property (nonatomic,strong) NSString *result;
/** string */
@property (nonatomic,strong) NSString *result1;



@end

@implementation TLGetCarInfoVIew

-(NSDictionary *)dict
{
    if (!_dict)
    {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"Cars.plist" ofType:nil];
        _dict = [[NSDictionary alloc]initWithContentsOfFile:path];
    }
    return _dict;
}
-(NSArray *)cityArr
{
    if (!_cityArr)
    {
        _cityArr = [self.dict allKeys];
    }
    return _cityArr;
}
-(NSArray *)carArr
{
    if (!_carArr)
    {
        _carArr = [self.dict objectForKey:[self.cityArr objectAtIndex:0]];
    }
    return _carArr;
}




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
//    self.pickerView
    [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
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
    
//    NSInteger row1 = [self.pickerView selectedRowInComponent:0];
    NSInteger row2 = [self.pickerView selectedRowInComponent:1];
//    NSString *selected1 = [self.cityArr objectAtIndex:row1];
    NSString *selected2 = [self.carArr objectAtIndex:row2];
    
    NSString *title = [[NSString alloc] initWithFormat:@"%@",selected2];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"post1" object:title];

    [self removeFromSuperview];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return self.cityArr.count;
    }else
    {
        return self.carArr.count;
    }
}

#pragma mark - 代理
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return [self.cityArr objectAtIndex:row];
    }else
    {
        return [self.carArr objectAtIndex:row];
    }
}

// 选中第component第row的时候调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        NSString *selectCity = [self.cityArr objectAtIndex:row];
        NSArray *array = [self.dict objectForKey:selectCity];
        self.carArr = array;
        [self.pickerView reloadComponent:1];
        self.result = self.cityArr[row];
    }else
    {
        self.result1 = self.carArr[row];
    }
}


@end
