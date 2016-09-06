//
//  TLCheckboxesAndRadiosController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLCheckboxesAndRadiosController.h"
#import "TLMutipleEditController.h"
#import "TLSingleEditController.h"

@interface TLCheckboxesAndRadiosController ()<UITableViewDelegate,UITableViewDataSource>
/** checkbox */
@property (nonatomic,strong) UITableView *checkboxList;

@end


@implementation TLCheckboxesAndRadiosController
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
    self.title = @"Checkboxes And Radios";

    [self.view setBackgroundColor:TLMainBackColor];
    self.checkboxList = [[UITableView alloc]initWithFrame:TLRect(0, 50/667, 1, 96/667) style:UITableViewStylePlain];
    self.checkboxList.delegate = self;
    self.checkboxList.dataSource = self;
    [self.checkboxList setShowsVerticalScrollIndicator:NO];
    self.checkboxList.scrollEnabled = NO;
    [self.checkboxList setBackgroundColor:TLMainBackColor];
    [self.view addSubview:self.checkboxList];
}


#pragma mark ---- UITableViewDateSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"checklist"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"多选编辑模式";
    }else
    {
        cell.textLabel.text = @"单选编辑模式";
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TLHeight(50/667);
    
}

#pragma mark ---- UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        TLMutipleEditController *mutiple = [[TLMutipleEditController alloc]init];
        [self.navigationController pushViewController:mutiple animated:YES];
        
    }else
    {
        TLSingleEditController *single = [[TLSingleEditController alloc]init];
        [self.navigationController pushViewController:single animated:YES];
    }
}




@end
