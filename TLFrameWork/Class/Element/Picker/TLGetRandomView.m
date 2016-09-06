//
//  TLGetRandomView.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/31.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLGetRandomView.h"

@interface TLGetRandomView ()<UIPickerViewDelegate,UIPickerViewDataSource>
/** view */
@property (nonatomic,strong) UIView *topView;
/** button */
@property (nonatomic,strong) UIButton *doneBtn;
/** button */
@property (nonatomic,strong) UIButton *ranBtn;
/** pickerView */
@property (nonatomic,strong) UIPickerView *pickerView;

/** string */
@property (nonatomic,strong) NSString *result;
/** string */
@property (nonatomic,strong) NSString *result1;
/** string */
@property (nonatomic,strong) NSString *result2;
/** array */
@property (nonatomic,strong) NSArray *people;


@end

@implementation TLGetRandomView

-(NSArray *)people
{
    if (!_people)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Random.plist" ofType:nil];
        _people = [NSArray arrayWithContentsOfFile:path];
    }
    return _people;
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
    
    if (!self.result)
    {
        self.result = self.people[0][0];
    }
    if (!self.result1)
    {
        self.result1 = self.people[1][0];
    }
    if (!self.result2)
    {
        self.result2 = self.people[2][0];
    }
    self.topView = [[UIView alloc]initWithFrame:TLRect(0, 417/667, 1, 50/667)];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topView];
    
    self.doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.doneBtn setTitle:@"That's me" forState:UIControlStateNormal];
    [self.doneBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.doneBtn setFrame:TLRect(270/375, 5/667, 100/375, 40/667)];
    [self.doneBtn addTarget:self action:@selector(quit) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.doneBtn];
    
    self.ranBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.ranBtn setTitle:@"Randomize" forState:UIControlStateNormal];
    [self.ranBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.ranBtn setFrame:TLRect(5/375, 5/667, 130/375, 40/667)];
    [self.ranBtn addTarget:self action:@selector(random:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.ranBtn];
    
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
    NSString *content = [NSString stringWithFormat:@"%@ %@ %@",self.result,self.result1,self.result2];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"post2" object:content];

    [self removeFromSuperview];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.people.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.people[component] count];
}

#pragma mark - 代理
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.people[component][row];
}

// 选中第component第row的时候调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        self.result = self.people[component][row];
    }else if(component == 1)
    {
        self.result1 = self.people[component][row];
    }else
    {
        self.result2 = self.people[component][row];
    }
   
//    NSLog(@"22222%@-----%@---%@",self.result,self.result1,self.result2);
}
-(void)random:(UIPickerView *)picker
{
    for (int i = 0; i < 3; i++)
    {
        // 假设让第0列随机选中一行
        // 取出第0列的行数
        NSInteger count = [self.people[i] count];
        int random = arc4random_uniform((u_int32_t)count);
        //不会触发代理的选中方法
        [self.pickerView selectRow:random inComponent:i animated:YES];
        //label数据刷新
        [self pickerView:picker didSelectRow:random inComponent:i];
    }
}

@end
