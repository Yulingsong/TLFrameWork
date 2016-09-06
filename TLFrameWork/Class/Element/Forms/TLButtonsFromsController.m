//
//  TLButtonsFromsController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLButtonsFromsController.h"

@interface TLButtonsFromsController()<UITableViewDataSource,UITableViewDelegate>
/** scrollview */
@property (nonatomic,strong) UITableView *btnTableView;

/** Active */
@property (nonatomic,strong) UIButton *Active1Btn;



@end

@implementation TLButtonsFromsController

-(UITableView *)btnTableView
{
    if (!_btnTableView)
    {
        _btnTableView = [[UITableView alloc]init];
    }
    return _btnTableView;
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
    self.title = @"Buttons";
    self.view.backgroundColor = TLMainBackColor;
    
    self.btnTableView = [[UITableView alloc]initWithFrame:TLRect(0, 30/667, 1, 573/667) style:UITableViewStylePlain];
    self.btnTableView.backgroundColor = TLMainBackColor;
    self.btnTableView.tag = 100;
    self.btnTableView.delegate = self;
    self.btnTableView.dataSource = self;
    [self.btnTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.btnTableView];
    
}

#pragma mark -- UITableViewDateSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = TLMainBackColor;
    if (indexPath.row == 0)
    {
        UILabel *la1 = [UILabel labelWithFrame:TLRect(21/375, 0, 200/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"USUAL BUTTONS" textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
        [cell addSubview:la1];
        
        UIButton *bt1 = [UIButton buttonWithFrame:TLRect(21/375, 30/667, 97/375, 25/667) backgroundColor:TLBlueColor title:@"Active" cornerRdius:3];
        [cell addSubview:bt1];
        
        UIButton *bt2 = [UIButton buttonWithFrame:TLRect(139/375, 30/667, 97/375, 25/667) backgroundColor:TLMainBackColor title:@"Button" cornerRdius:3];
        [bt2 setTitleColor:TLBlueColor forState:UIControlStateNormal];
        [cell addSubview:bt2];
        
        UIButton *bt3 = [UIButton buttonWithFrame:TLRect(257/375, 30/667, 97/375, 25/667) backgroundColor:TLMainBackColor title:@"Round" cornerRdius:10];
        [bt3 setTitleColor:TLBlueColor forState:UIControlStateNormal];
        [cell addSubview:bt3];
    }else if (indexPath.row == 1)
    {
        UIButton *bt11 = [UIButton buttonWithFrame:TLRect(21/375, 30/667, 156/375, 25/667) backgroundColor:TLBlueColor title:@"Active" cornerRdius:3];
        [cell addSubview:bt11];
        
        UIButton *bt12 = [UIButton buttonWithFrame:TLRect(198/375, 30/667, 156/375, 25/667) backgroundColor:TLMainBackColor title:@"Button" cornerRdius:3];
        [bt12 setTitleColor:TLBlueColor forState:UIControlStateNormal];
        [cell addSubview:bt12];
    }else if (indexPath.row == 2)
    {
        UIImageView *view = [[UIImageView alloc]initWithFrame:TLRect(21/375, 30/667, 333/375, 25/667)];
        [view setImage:[UIImage imageNamed:@"tab1"]];
        for (int i = 0; i < 2; i++)
        {
            UIButton *bt = [UIButton buttonWithFrame:TLRect((i * 166.5)/375, 0, 166.5/375, 25/667) backgroundColor:[UIColor clearColor] title:@"Button" target:nil selection:nil];
            [bt setTitleColor:TLColor(0, 122, 255) forState:UIControlStateNormal];
            [bt.titleLabel setFont:TLFont(15/375)];
            [view addSubview:bt];
        }
        [cell addSubview:view];
    }else if (indexPath.row == 3)
    {
        UIImageView *view = [[UIImageView alloc]initWithFrame:TLRect(21/375, 30/667, 333/375, 25/667)];
        [view setImage:[UIImage imageNamed:@"tab2"]];
        [cell addSubview:view];
        for (int i = 0; i < 3; i++)
        {
            UIButton *bt = [UIButton buttonWithFrame:TLRect((i * 111)/375, 0, 111/375, 25/667) backgroundColor:[UIColor clearColor] title:@"Button" target:nil selection:nil];
            [bt setTitleColor:TLColor(0, 122, 255) forState:UIControlStateNormal];
            [bt.titleLabel setFont:TLFont(15/375)];
            [view addSubview:bt];
        }
    }else if (indexPath.row == 4)
    {
        UIImageView *view = [[UIImageView alloc]initWithFrame:TLRect(21/375, 30/667, 333/375, 25/667)];
        [view setImage:[UIImage imageNamed:@"tab3"]];
        [cell addSubview:view];
        for (int i = 0; i < 4; i++)
        {
            UIButton *bt = [UIButton buttonWithFrame:TLRect((i * 83.25)/375, 0, 83.25/375, 25/667) backgroundColor:[UIColor clearColor] title:@"Button" target:nil selection:nil];
            [bt setTitleColor:TLColor(0, 122, 255) forState:UIControlStateNormal];
            [bt.titleLabel setFont:TLFont(15/375)];
            [view addSubview:bt];
        }
    }
    else if (indexPath.row == 5)
    {
        UILabel *la2 = [UILabel labelWithFrame:TLRect(21/375, 0, 200/375, 30/667) BackgroundColor:TLMainBackColor text:@"BIG BUTTONS" textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
        [cell addSubview:la2];
        
        UIButton *bt41 = [UIButton buttonWithFrame:TLRect(21/375, 30/667, 156/375, 40/667) backgroundColor:TLBlueColor title:@"Active" cornerRdius:3];
        [cell addSubview:bt41];
        
        UIButton *bt42 = [UIButton buttonWithFrame:TLRect(198/375, 30/667, 156/375, 40/667) backgroundColor:TLMainBackColor title:@"Button" cornerRdius:3];
        [bt42 setTitleColor:TLBlueColor forState:UIControlStateNormal];
        [cell addSubview:bt42];
    }else if (indexPath.row == 6)
    {
        UILabel *la3 = [UILabel labelWithFrame:TLRect(21/375, 0, 200/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"THEMED FILL BUTTONS" textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
        [cell addSubview:la3];
        
        UIButton *bt51 = [UIButton buttonWithFrame:TLRect(21/375, 30/667, 156/375, 40/667) backgroundColor:TLColor(76, 217, 100) title:@"Submit" cornerRdius:3];
        [bt51.layer setBorderColor:TLColor(76, 217, 100).CGColor];
        [cell addSubview:bt51];
        
        UIButton *bt52 = [UIButton buttonWithFrame:TLRect(198/375, 30/667, 156/375, 40/667) backgroundColor:TLColor(255, 59, 48) title:@"Cancel" cornerRdius:3];
        [bt52.layer setBorderColor:TLColor(255, 59, 48).CGColor];
        [cell addSubview:bt52];
    }else  if (indexPath.row == 7)
    {
        UILabel *la5 = [UILabel labelWithFrame:TLRect(21/375, 0, 200/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"List-Block Buttons" textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
        [cell addSubview:la5];

        for (int i = 0; i < 3; i++)
        {
            NSString *title = [NSString stringWithFormat:@"List Button %d",i];
            NSLog(@"%@",title);
            UIButton *btn = [UIButton buttonWithFrame:TLRect(21/375, (30 + 41 * i)/667, 333/375, 40/667) backgroundColor:[UIColor whiteColor] title:title cornerRdius:5];
            btn.layer.borderColor = [UIColor whiteColor].CGColor;
            [btn setTitleColor:TLColor(0, 122, 255) forState:UIControlStateNormal];
            [btn setTitle:title forState:UIControlStateNormal];
            [cell addSubview:btn];
        }
        
    }else
    {
        UILabel *la4 = [UILabel labelWithFrame:TLRect(21/375, 0, 200/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"LIST-BLOCK BUTTONS" textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
        [cell addSubview:la4];
        
        UIButton *bt62 = [UIButton buttonWithFrame:TLRect(21/375, 30/667, 333/375, 40/667) backgroundColor:[UIColor whiteColor] title:@"Big Red Button" cornerRdius:3];
        [bt62 setTitleColor:TLColor(255, 59, 48) forState:UIControlStateNormal];
        [bt62.layer setBorderColor:TLColor(255, 255, 255).CGColor];
        [cell addSubview:bt62];
    }

    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row <= 4)
    {
        return TLHeight(65/667);
    }else if(indexPath.row != 7)
    {
        return TLHeight(90/667);
    }else
    {
        return TLHeight(170/667);
    }
}



@end
