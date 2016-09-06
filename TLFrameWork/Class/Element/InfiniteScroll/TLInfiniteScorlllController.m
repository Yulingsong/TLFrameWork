//
//  TLInfiniteScorlllController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLInfiniteScorlllController.h"
#import "MJRefresh.h"

@interface TLInfiniteScorlllController ()<UITableViewDelegate,UITableViewDataSource>
/** infinite TableView */
@property (nonatomic,strong) UITableView *infiniteTable;
/** array */
@property (nonatomic,strong) NSArray *array;


@end

@implementation TLInfiniteScorlllController

#pragma mark ---- 显示以及隐藏tabbar
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
    [super viewWillDisappear:animated];
}


-(UITableView *)infiniteTable
{
    if (!_infiniteTable)
    {
        _infiniteTable = [[UITableView alloc]init];
    }
    return _infiniteTable;
}



-(void)viewDidLoad
{
    self.title = @"Infinite Scroll";
   
    self.array = @[@"SCROLL BOTTOM",@"Infinite Scroll 1",@"Infinite Scroll 2",@"Infinite Scroll 3",@"Infinite Scroll 4",@"Infinite Scroll 5",@"Infinite Scroll 6",@"Infinite Scroll 6",@"Infinite Scroll 7",@"Infinite Scroll 8",@"Infinite Scroll 9",@"Infinite Scroll 10",@"Infinite Scroll 11",@"Infinite Scroll 12",@"Infinite Scroll 13",@"Infinite Scroll 14",@"Infinite Scroll 15",@"Infinite Scroll 16",@"Infinite Scroll 17",@"Infinite Scroll 18",@"Infinite Scroll 19",@"Infinite Scroll 20",@"Infinite Scroll 21",@"Infinite Scroll 22",@"Infinite Scroll 23",@"Infinite Scroll 24",@"Infinite Scroll 25",@"Infinite Scroll 26",@"Infinite Scroll 27",@"Infinite Scroll 28",@"Infinite Scroll 29",@"Infinite Scroll 30"];
    
    self.infiniteTable = [[UITableView alloc]initWithFrame:TLRect(0, 0, 1, 603/667) style:UITableViewStylePlain];
    self.infiniteTable.delegate = self;
    self.infiniteTable.dataSource = self;
    [self.view addSubview:self.infiniteTable];
    self.view.backgroundColor = TLColor(240, 239, 245);
    self.infiniteTable.backgroundColor = TLColor(240, 239, 245);
    
    __weak __typeof(self) weakSelf = self;

    self.infiniteTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf updateData];
    }];
    self.infiniteTable.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
}

- (void)updateData
{
    [self.infiniteTable.mj_header endRefreshing];
}
//上拉加载
-(void)loadMoreData
{
    [self.infiniteTable reloadData];
    [self.infiniteTable.mj_footer endRefreshing];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.array[indexPath.row];
    if (indexPath.row == 0)
    {
        cell.backgroundColor = TLColor(240, 239, 245);
    }else{
        
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return TLHeight(64/667);
    }else{
        return TLHeight(48/667);
    }
}

@end
