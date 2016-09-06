//
//  TLDeleteForActionController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/29.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLDeleteForActionController.h"

@interface TLDeleteForActionController()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>
/** tablevieew */
@property (nonatomic,strong) UITableView *tableview;
/** array */
@property (nonatomic,strong) NSMutableArray *contentArr;

@end

@implementation TLDeleteForActionController
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
    self.title = @"DFA";
    self.view.backgroundColor = TLMainBackColor;
    UILabel *lb = [UILabel labelWithFrame:TLRect(15/375, 29/667, 345/375, 60/667) BackgroundColor:TLClearColor text:@"Swipe for actions" textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
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
    cell.imageView.image = [UIImage imageNamed:@"picker"];
    cell.textLabel.text = self.contentArr[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TLHeight(48/667);
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return true;
}

-(nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"more" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Here comes some optional description or warning for actions below" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Nice Red Button" otherButtonTitles:@"Alert", nil];
        [actionSheet showInView:self.view];
    }];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.contentArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    return @[action2,action];

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

@end
