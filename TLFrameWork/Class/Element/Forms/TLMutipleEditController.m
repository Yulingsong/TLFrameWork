//
//  TLMutipleEditController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/25.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLMutipleEditController.h"

@interface TLMutipleEditController()<UITableViewDelegate,UITableViewDataSource>
/** editbutton */
@property (nonatomic,strong) UIButton *editBtn;

/** mutiple */
@property (nonatomic,strong) UITableView *mutipleList;
/** array */
@property (nonatomic,strong) NSArray *array;

@end

@implementation TLMutipleEditController
-(UITableView *)mutipleList
{
    if (!_mutipleList)
    {
        _mutipleList = [[UITableView alloc]init];
    }
    return _mutipleList;
}
-(UIButton *)editBtn
{
    if (!_editBtn)
    {
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _editBtn;
}

#pragma mark ---- 显示以及隐藏tabbar
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
    self.title = @"多选编辑模式";
    self.view.backgroundColor = TLMainBackColor;
    self.editBtn = [UIButton buttonWithFrame:TLRect(100/375, 35/667, 175/375, 30/667) backgroundColor:[UIColor lightGrayColor] title:@"多选编辑模式" target:self selection:@selector(clickToEdit)];
    [self.editBtn.layer setCornerRadius:4];
    self.editBtn.titleLabel.textColor = [UIColor blueColor];
    self.editBtn.titleLabel.font = TLFont(15/375);
    [self.view addSubview:self.editBtn];
   
    self.array = [NSArray arrayWithObjects:
                   @"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",nil];   ;
    
    self.mutipleList = [[UITableView alloc]initWithFrame:TLRect(0, 100/667, 1, 440/667) style:UITableViewStylePlain];
    self.mutipleList.delegate = self;
    self.mutipleList.dataSource = self;
    self.mutipleList.allowsMultipleSelectionDuringEditing = YES;
    [self.mutipleList setBackgroundColor:TLMainBackColor];
    [self.view addSubview:self.mutipleList];
}



-(void)clickToEdit
{
    [self.mutipleList setEditing:!self.mutipleList.editing animated:YES];
}

#pragma mark ---- UITableViewDateSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mutiple"];
    cell.textLabel.text = [NSString stringWithFormat:@"Item  %@",self.array[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return TLHeight(55/667);
}

#pragma mark -- UITableViewDelegeta
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end

