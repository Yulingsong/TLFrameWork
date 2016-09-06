
//
//  TLSwipeToDeleteController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLSwipeToDeleteController.h"
#import "TLDeleteWithComformController.h"
#import "TLDeleteNOComformController.h"
#import "TLDeleteForActionController.h"
#import "TLDeleteWithCallbackController.h"
#import "TLDeleteWithLeftSideController.h"
#import "TLDeleteBothController.h"

@interface TLSwipeToDeleteController()<UITableViewDelegate,UITableViewDataSource>

/** array */
@property (nonatomic,strong) NSArray *array;

@end

@implementation TLSwipeToDeleteController

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
    self.title = @"Swipe To Delete";
    self.view.backgroundColor = TLMainBackColor;
    self.array = @[@"Swipe to delete with confirm modal",@"Swipe to delete without confirm",@"Swipe for actions",@"With callback on remove",@"With actions on left side (swipe to ri",@"On both sides with overswipes",@"On both sides with overswipes"];
    
    [self setSubviews];
}

-(void)setSubviews
{
    NSString *msg = @"Swipe out actions on list elements is one of the most awesome F7 features. It allows you to call hidden menu for each list element where you can put default ready-to use delete button or any other buttons for some required actions. ";
    UILabel *lb = [UILabel labelWithFrame:TLRect(15/375, 25/667, 345/375, 100/667) BackgroundColor:TLClearColor text:msg textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft font:TLFont(14/375)];
    lb.numberOfLines = 0;
    [self.view addSubview:lb];
    
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:TLRect(0, 130/667, 1, 288/667) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.scrollEnabled = NO;
    [self.view addSubview:tableview];
}

#pragma mark -- UITableViewDateSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.array[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"calendar"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TLHeight(48/667);
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        TLDeleteWithComformController *vc1 = [TLDeleteWithComformController new];
        [self.navigationController pushViewController:vc1 animated:YES];
    }else if (indexPath.row == 1)
    {
        TLDeleteNOComformController *vc2 = [TLDeleteNOComformController new];
        [self.navigationController pushViewController:vc2 animated:YES];
    }else if (indexPath.row == 2)
    {
        TLDeleteForActionController *vc3 = [TLDeleteForActionController new];
        [self.navigationController pushViewController:vc3 animated:YES];
    }else if (indexPath.row == 3)
    {
        TLDeleteWithCallbackController *vc4 = [TLDeleteWithCallbackController new];
        [self.navigationController pushViewController:vc4 animated:YES];
    }else if (indexPath.row == 4)
    {
        TLDeleteWithLeftSideController *vc5 = [TLDeleteWithLeftSideController new];
        [self.navigationController pushViewController:vc5 animated:YES];
    }else if (indexPath.row == 5)
    {
        TLDeleteBothController *vc5 = [TLDeleteBothController new];
        [self.navigationController pushViewController:vc5 animated:YES];
    }
}

@end
