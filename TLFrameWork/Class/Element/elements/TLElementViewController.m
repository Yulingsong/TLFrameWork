//
//  TLElementViewController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLElementViewController.h"


@interface TLElementViewController ()<UITableViewDelegate,UITableViewDataSource>
/** tableView */
@property (nonatomic,strong) UITableView *listView;

/** array */
@property (nonatomic,strong) NSArray *array1;
/** array */
@property (nonatomic,strong) NSArray *array2;


@end

@implementation TLElementViewController
-(UITableView *)listView
{
    if (!_listView)
    {
        _listView = [[UITableView alloc]init];
    }
    return _listView;
}

-(id)init
{
    if (self = [super init])
    {
        //设置题目
        self.title = @"组件";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = TLColor(240, 239, 245);

    [self setSubviews];
}

-(void)setSubviews
{
    self.array1 = @[@"Calendar/Datepicker",@"Forms",@"Infinite Scroll",@"List View",@"Modals",@"Tabs",@"Picker",@"Search Bar",@"Swipe To Delete",@"Notifications"];
    self.array2 = @[@"calendar",@"forms",@"infinite-scroll",@"list-view",@"modals",@"tabs",@"picker",@"search-bar",@"swipe-to-delete",@"notifications"];
    
    self.listView = [[UITableView alloc]init];
    [self.listView setFrame:TLRect(0, 17/667, 1, 480/667)];
    [self.listView setDelegate:self];
    [self.listView setDataSource:self];
    self.listView.scrollEnabled = NO;
    [self.listView setBackgroundColor:TLColor(240, 239, 245)];
//    [self.listView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.listView];
}

#pragma mark UITableViewDataSources
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array1.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.array1[indexPath.row];
    cell.textLabel.font = TLFont(15/375);
    cell.imageView.image = [UIImage imageNamed:self.array2[indexPath.row]];
    
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
        TLCalendarController *calendar = [[TLCalendarController alloc]init];
        [self.navigationController pushViewController:calendar animated:YES];
    }else if (indexPath.row == 1)
    {
        TLFormsController *forms = [[TLFormsController alloc]init];
        
        [self.navigationController pushViewController:forms animated:YES];
        [forms setHidesBottomBarWhenPushed:YES];
    }else if (indexPath.row == 2)
    {
        TLInfiniteScorlllController *infiniteScroll = [[TLInfiniteScorlllController alloc]init];
        [self.navigationController pushViewController:infiniteScroll animated:YES];
    }else if (indexPath.row == 3)
    {
        TLListViewController *list = [[TLListViewController alloc]init];
        [self.navigationController pushViewController:list animated:YES];
    }else if (indexPath.row == 4)
    {
        TLModalsController *modals = [[TLModalsController alloc]init];
        [self.navigationController pushViewController:modals animated:YES];
    }else if (indexPath.row == 5)
    {
        TLTabsController *tabs = [[TLTabsController alloc]init];
        [self.navigationController pushViewController:tabs animated:YES];
    }else if (indexPath.row == 6)
    {
        TLPikcerController *picker = [[TLPikcerController alloc]init];
        [self.navigationController pushViewController:picker animated:YES];
    }else if (indexPath.row == 7)
    {
        TLSearchBarController *searchBar = [[TLSearchBarController alloc]init];
        [self.navigationController pushViewController:searchBar animated:YES];
    }else if (indexPath.row == 8)
    {
        TLSwipeToDeleteController *swipeToDelete = [[TLSwipeToDeleteController alloc]init];
        [self.navigationController pushViewController:swipeToDelete animated:YES];
    }else if (indexPath.row == 9)
    {
        TLNotificationController *notification = [[TLNotificationController alloc]init];
        [self.navigationController pushViewController:notification animated:YES];
    }
}


@end
