//
//  TLAboutViewController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLAboutViewController.h"

@interface TLAboutViewController ()<UITableViewDelegate,UITableViewDataSource>
/** InfoList */
@property (nonatomic,strong) UITableView *InfoList;

@end

@implementation TLAboutViewController

-(UITableView *)InfoList
{
    if (!_InfoList)
    {
        _InfoList = [[UITableView alloc]init];
    }
    return _InfoList;
}

-(id)init
{
    if (self = [super init])
    {
        //设置题目
        self.title = @"关于";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:TLColor(240, 239, 245)];
    
    [self setSubViews];
    
}

-(void)setSubViews
{
    self.InfoList = [[UITableView alloc]init];
    [self.InfoList setFrame:TLRect(0, 8/667, 1, 1)];
    [self.InfoList setBackgroundColor:TLColor(240, 239, 245)];
    [self.InfoList setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.InfoList setDelegate:self];
    [self.InfoList setDataSource:self];
    [self.view addSubview:self.InfoList];
}

#pragma mark -- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    UIView *line = [[UIView alloc]init];
    [line setBackgroundColor:TLColor(228, 228, 228)];
    [cell addSubview:line];
    
    if (indexPath.row == 0)
    {
        [line setFrame:TLRect(0, 143.5/667, 1, 0.5/667)];
        UIButton *iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [iconBtn setFrame:TLRect(158/375, 31/667, 60/375, 60/667)];
        [iconBtn setBackgroundColor:[UIColor lightGrayColor]];
        [iconBtn setTitle:@"logo" forState:UIControlStateNormal];
        [iconBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [iconBtn.layer setCornerRadius:TLSize(30/375)];
        [iconBtn.titleLabel setFont:TLFont(15/375)];
        [cell addSubview:iconBtn];
        
    }else if(indexPath.row == 1)
    {
        [cell setBackgroundColor:TLColor(240, 239, 245)];
    }else if (indexPath.row == 2)
    {
        [line setFrame:TLRect(0, 47.5/667, 1, 0.5/667)];
        cell.textLabel.text = @"当前版本";
        cell.textLabel.font = TLFont(15/375);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else
    {
        [line setFrame:TLRect(0, 47.5/667, 1, 0.5/667)];
        cell.textLabel.text = @"当前版本";
        cell.textLabel.font = TLFont(15/375);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return TLHeight(144/667);
            break;
        case 1:
            return TLHeight(8/667);
            break;
        case 2:
            return TLHeight(48/667);
            break;
        case 3:
            return TLHeight(48/667);
            break;
        default:
            return TLHeight(48/667);
            break;
    }
}


@end
