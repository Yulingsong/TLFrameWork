//
//  TLSystemController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/25.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLSystemController.h"

@interface TLSystemController()<UITableViewDelegate,UITableViewDataSource>

/** tableview */
@property (nonatomic,strong) UITableView *systemList;


@end

@implementation TLSystemController

-(UITableView *)systemList
{
    if (!_systemList)
    {
        _systemList = [[UITableView alloc]init];
    }
    return _systemList;
}

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
    self.title = @"System";
    self.view.backgroundColor = TLMainBackColor;
    self.systemList = [[UITableView alloc]initWithFrame:TLRect(0, 50/667, 1, 100/667) style:UITableViewStylePlain];
    self.systemList.backgroundColor = TLMainBackColor;
    self.systemList.delegate = self;
    self.systemList.dataSource = self;
    [self.view addSubview:self.systemList];
    
}

#pragma mark -- UITableViewDateSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"Mac";
    }else
    {
        cell.textLabel.text = @"Windows";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"system" object:cell.textLabel.text];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
