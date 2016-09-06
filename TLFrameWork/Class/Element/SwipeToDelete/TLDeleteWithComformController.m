//
//  TLDeleteWithComformController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/29.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLDeleteWithComformController.h"
@interface TLDeleteWithComformController()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
/** tablevieew */
@property (nonatomic,strong) UITableView *tableview;
/** array */
@property (nonatomic,strong) NSMutableArray *contentArr;
/** index */
@property (nonatomic,assign) NSInteger index;
/** indexpayj */
@property (nonatomic,strong) NSIndexPath *indexPath;

@end

@implementation TLDeleteWithComformController

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
-(NSMutableArray *)contentArr
{
    if (!_contentArr)
    {
        _contentArr = [NSMutableArray arrayWithObjects:@"Swipe left 1",@"Swipe left 2",@"Swipe left 3",@"Swipe left 4",@"Swipe left 5",@"Swipe left 6", nil];
    }
    return _contentArr;
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
    self.title = @"DWC";
    self.view.backgroundColor = TLMainBackColor;
    
    UILabel *lb = [UILabel labelWithFrame:TLRect(15/375, 29/667, 345/375, 60/667) BackgroundColor:TLClearColor text:@"Swipe to delete with confirm modal" textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
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
    cell.imageView.image = [UIImage imageNamed:@"infinite-scroll"];
    UIView *line = [UIView viewWithFrame:TLRect(50/375, 47.5/667, 325/375, 0.5/667)];
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
        
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"Framework7" message:@"Are you sure you want to delete this item?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [alertV show];
        self.indexPath = indexPath;
        self.index = indexPath.row;
        
        NSLog(@"%@",indexPath);
//        [self.contentArr removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else
    {
        [self.contentArr addObject:@100];
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.contentArr.count - 1 inSection:0];
        [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

//删除弹出框确认
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ( 1 == buttonIndex)
    {
        [self deleteTableview:self.tableview];
    }
}


-(void)deleteTableview:(UITableView *)tableview{
    
    [self.contentArr removeObjectAtIndex:self.index];
//    [self.tableview reloadData];
    [tableview deleteRowsAtIndexPaths:@[self.indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

}


//当滚动视图发生位移，就会进入下方代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:1000];
    
    CGPoint point = scrollView.contentOffset;
    
    NSInteger index = round(point.x/scrollView.frame.size.width);
    
    pageControl.currentPage = index;
}

@end
