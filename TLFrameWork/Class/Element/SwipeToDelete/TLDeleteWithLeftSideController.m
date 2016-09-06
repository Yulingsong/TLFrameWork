//
//  TLDeleteWithLeftSideController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/29.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLDeleteWithLeftSideController.h"
#import "SWTableViewCell.h"


@interface TLDeleteWithLeftSideController()<UITableViewDelegate,UITableViewDataSource,SWTableViewCellDelegate>
/** tablevieew */
@property (nonatomic,strong) UITableView *tableview;
/** array */
@property (nonatomic,strong) NSMutableArray *contentArr;

@end

@implementation TLDeleteWithLeftSideController

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
    self.title = @"DWL";
    self.view.backgroundColor = TLMainBackColor;
    
    
    UILabel *lb = [UILabel labelWithFrame:TLRect(15/375, 29/667, 345/375, 60/667) BackgroundColor:TLClearColor text:@"With actions on left side (swipe to ri" textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
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
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    cell.textLabel.text = self.contentArr[indexPath.row];
//    return cell;
    static NSString *cellIdentifier = @"Cell";
    
    SWTableViewCell *cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.leftUtilityButtons = [self leftButtons];
        cell.delegate = self;
    }
    
    NSDate *dateObject = self.contentArr[indexPath.row];
    cell.textLabel.text = [dateObject description];
    cell.detailTextLabel.text = @"Some detail text";
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TLHeight(48/667);
}

- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:TLColor(76, 217, 100) title:@"Reply"];
    [leftUtilityButtons sw_addUtilityButtonWithColor:TLColor(0, 122, 255) title:@"Forward"];

    
    return leftUtilityButtons;
}
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index
{
    if (index == 0)
    {
        TLAlert(@"Reply");
    }else
    {
        TLAlert(@"Forward");
    }
}

@end
