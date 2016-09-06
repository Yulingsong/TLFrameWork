//
//  TLDeleteWithCallbackController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/29.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLDeleteWithCallbackController.h"

@interface TLDeleteWithCallbackController()<UITableViewDelegate,UITableViewDataSource>
/** tablevieew */
@property (nonatomic,strong) UITableView *tableview;
/** array */
@property (nonatomic,strong) NSMutableArray *contentArr;

@end

@implementation TLDeleteWithCallbackController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
}

-(UITableView *)tableview
{
    if (!_tableview)
    {
        _tableview = [[UITableView alloc]initWithFrame:TLRect(0, 90/667, 1, 288/667) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.scrollEnabled = NO;
    }
    return _tableview;
}
-(NSArray *)contentArr
{
    if (!_contentArr)
    {
        _contentArr = [NSMutableArray arrayWithObjects:@"Swipe left 1",@"Swipe left 2",@"Swipe left 3",@"Swipe left 4",@"Swipe left 5",@"Swipe left 6", nil];
    }
    return _contentArr;
}

-(void)viewDidLoad
{
    self.title = @"DWC";
    self.view.backgroundColor = TLMainBackColor;
    
    UILabel *lb = [UILabel labelWithFrame:TLRect(15/375, 29/667, 345/375, 60/667) BackgroundColor:TLClearColor text:@"With callback on remove" textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
    [self.view addSubview:lb];
    
    self.tableview.backgroundColor = TLMainBackColor;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableview];
}


#pragma mark -- UITableViewDateSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contentArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView *line = [UIView viewWithFrame:TLRect(20/375, 47.5/667, 355/375, 0.5/667)];
    [cell addSubview:line];
    cell.textLabel.text = self.contentArr[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TLHeight(48/667);
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.contentArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        TLAlert(@"Thanks, item removed!");
    }
    else
    {
        [self.contentArr addObject:@100];
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.contentArr.count - 1 inSection:0];
        [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

//当滚动视图发生位移，就会进入下方代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:1000];
    
    CGPoint point = scrollView.contentOffset;
    
    NSInteger index = round(point.x/scrollView.frame.size.width);
    
    pageControl.currentPage = index;
}
@end
