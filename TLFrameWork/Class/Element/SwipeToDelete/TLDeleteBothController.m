//
//  TLDeleteBothController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/29.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLDeleteBothController.h"
#import "SWTableViewCell.h"

@interface TLDeleteBothController()<UITableViewDelegate,UITableViewDataSource,SWTableViewCellDelegate,UIActionSheetDelegate>
/** tablevieew */
@property (nonatomic,strong) UITableView *tableview;
/** array */
@property (nonatomic,strong) NSMutableArray *contentArr;
/** index */
@property (nonatomic,assign) NSInteger index;
/** indexpayj */
@property (nonatomic,strong) NSIndexPath *indexPath;
@end

@implementation TLDeleteBothController

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
    self.title = @"DB";
    self.view.backgroundColor = TLMainBackColor;
    
    UILabel *lb = [UILabel labelWithFrame:TLRect(15/375, 29/667, 345/375, 60/667) BackgroundColor:TLClearColor text:@"On both sides with overswipes" textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
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
    static NSString *cellIdentifier = @"Cell";
    
    SWTableViewCell *cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.leftUtilityButtons = [self leftButtons];
        cell.rightUtilityButtons = [self rightButtons];
        cell.delegate = self;
    }
    
    NSDate *dateObject = self.contentArr[indexPath.row];
    cell.textLabel.text = [dateObject description];
    cell.detailTextLabel.text = @"Some detail text";
//    self.indexPath = indexPath;
//    self.index = indexPath.row;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TLHeight(48/667);
}

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     TLColor(199, 199, 204)
                                                title:@"More"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     TLColor(255, 149, 0)
                                                title:@"Mark"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     TLColor(255, 59, 48)
                                                title:@"Delete"];
    
    return rightUtilityButtons;
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

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    if (index == 0)
    {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Here comes some optional description or warning for actions below" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Nice Red Button" otherButtonTitles:@"Alert", nil];
        [actionSheet showInView:self.view];
    }else if(index == 1)
    {
        TLAlert(@"Mark");
    }else
    {
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"Framework7" message:@"Are you sure you want to delete this item?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [alertV show];
        
        for (int i = 0; i < self.contentArr.count; i++)
        {
            if ([cell.textLabel.text isEqualToString:self.contentArr[i]])
            {
                self.index = i;
//                self.indexPath = [NSIndexPath indexPathWithIndex:self.index];
            }
        }
        NSLog(@"%@",cell);
        
        NSLog(@"%ld",(long)self.index);
        NSLog(@"%@",self.indexPath);
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        NSLog(@"nice red button");
        TLAlert(@"You have clicked red button!");
    }else if(buttonIndex == 1)
    {
        NSLog(@"alert");
        TLAlert(@"He Hoou!");
    }else if(buttonIndex == 2)
    {
        NSLog(@"Cancel");
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


-(void)deleteTableview:(UITableView *)tableview
{
    [self.contentArr removeObjectAtIndex:self.index];
    [tableview reloadData];
}

@end
