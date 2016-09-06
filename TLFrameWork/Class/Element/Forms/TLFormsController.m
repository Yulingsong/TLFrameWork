//
//  TLFormsController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLFormsController.h"
#import "TLFormElementsController.h"
#import "TLCheckboxesAndRadiosController.h"
#import "TLSmartSelectsController.h"
#import "TLButtonsFromsController.h"
#import "TLFormStorageController.h"

@interface TLFormsController()<UITableViewDelegate,UITableViewDataSource>
/** noticeLabel */
@property (nonatomic,strong) UILabel *noticeLabel;
/** tableView */
@property (nonatomic,strong) UITableView *formList;


@end

@implementation TLFormsController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
}
//懒加载tableview
-(UITableView *)formList
{
    if (!_formList)
    {
        _formList = [[UITableView alloc]init];
    }
    return _formList;
}

-(void)viewDidLoad
{
    self.title = @"Forms";
    [self.view setBackgroundColor:TLMainBackColor];
    [self setSubViews];
}

//设置提示信息和tableview
-(void)setSubViews
{
    self.noticeLabel = [UILabel labelWithFrame:TLRect(21/375, 0, 333/375, 150/667) BackgroundColor:TLClearColor text:@"Framework7 provides very flexible forms layout, you can use it with/out icons, with/out labels, or mixed layouts." textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(14/375)];
    self.noticeLabel.numberOfLines = 0;
    [self.view addSubview:self.noticeLabel];
    
    self.formList = [[UITableView alloc]initWithFrame:TLRect(0, 150/667, 1, 240/667) style:UITableViewStylePlain];
    [self.formList setDelegate:self];
    [self.formList setDataSource:self];
    self.formList.scrollEnabled = NO;
    [self.view addSubview:self.formList];
}

#pragma mark --- UITableViewDataSources
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"forms"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"forms"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:@"list-view"];
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"Form Element";
            break;
        case 1:
            cell.textLabel.text = @"Checkboxes And Radios";
            break;
        case 2:
            cell.textLabel.text = @"Smart Selects";
            break;
        case 3:
            cell.textLabel.text = @"Buttons";
            break;
        case 4:
            cell.textLabel.text = @"Form Storage";
            break;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TLHeight(48/667);
}

#pragma mark --- UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        TLFormElementsController *formElements = [[TLFormElementsController alloc]init];
        [self.navigationController pushViewController:formElements animated:YES];
    }else if (indexPath.row == 1)
    {
        TLCheckboxesAndRadiosController *chexkboxes = [[TLCheckboxesAndRadiosController alloc]init];
        [self.navigationController pushViewController:chexkboxes animated:YES];
    }else if (indexPath.row == 2)
    {
        TLSmartSelectsController *smartSelects = [[TLSmartSelectsController alloc]init];
        [self.navigationController pushViewController:smartSelects animated:YES];
    }else if (indexPath.row == 3)
    {
        TLButtonsFromsController *buttonsForm = [[TLButtonsFromsController alloc]init];
        [self.navigationController pushViewController:buttonsForm animated:YES];
    }else
    {
        TLFormStorageController *formStograe = [[TLFormStorageController alloc]init];
        [self.navigationController pushViewController:formStograe animated:YES];
    }
}




@end
