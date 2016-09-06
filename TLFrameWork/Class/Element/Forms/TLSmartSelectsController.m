//
//  TLSmartSelectsController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLSmartSelectsController.h"
#import "TLFruitController.h"
#import "TLCarController.h"
#import "TLSystemController.h"

@interface TLSmartSelectsController()<UITableViewDelegate,UITableViewDataSource>
/** notiecLb */
@property (nonatomic,strong) UILabel *noticelLb;
/** selectList */
@property (nonatomic,strong) UITableView *selectList;
/** fruitLb */
@property (nonatomic,strong) UILabel *fruitLb;
/** varLb */
@property (nonatomic,strong) UILabel *carLb;
/** mac */
@property (nonatomic,strong) UILabel *systemLb;

/** fruit*/
@property (nonatomic,strong) NSString *fruit;
/** car */
@property (nonatomic,strong) NSString *car;
/** system */
@property (nonatomic,strong) NSString *system;


@end

@implementation TLSmartSelectsController

//懒加载
-(UITableView *)selectList
{
    if (!_selectList)
    {
        _selectList = [[UITableView alloc]init];
    }
    return _selectList;
}
-(UILabel *)noticelLb
{
    if (!_noticelLb)
    {
        _noticelLb = [[UILabel alloc]init];
    }
    return _noticelLb;
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
    self.title = @"Smart Selects";
    self.view.backgroundColor = TLMainBackColor;
    self.noticelLb = [UILabel labelWithFrame:TLRect(0, 0, 1, 120/667) BackgroundColor:[UIColor clearColor] text:@"Framework7 allows you to easily convert your usual form selects to dynamic pages with radios:" textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentCenter font:TLFont(13/375)];
    self.noticelLb.numberOfLines = 0;
    [self.view addSubview:self.noticelLb];
    
    
    self.selectList = [[UITableView alloc]initWithFrame:TLRect(0, 120/667, 1, 150/667) style:UITableViewStylePlain];
    self.selectList.delegate = self;
    self.selectList.dataSource = self;
    [self.selectList setBackgroundColor:TLMainBackColor];
    [self.view addSubview:self.selectList];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getFruit:) name:@"fruit" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getSystem:) name:@"system" object:nil];
}

-(void)getFruit:(NSNotification *)notification
{
    self.fruit = notification.object;
    [self.selectList reloadData];
}
-(void)getSystem:(NSNotification *)notification
{
    self.system = notification.object;
    [self.selectList reloadData];
}

#pragma mark -- UITableViewDateSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"Fruit";
        if (!self.fruit)
        {
            self.fruit = @"Apple";
        }

        self.fruitLb = [UILabel labelWithFrame:TLRect(80/375, 0, 250/375, 50/667) BackgroundColor:[UIColor clearColor] text:self.fruit textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentCenter font:TLFont(18/375)];
        
        [cell addSubview:self.fruitLb];
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"Car";
        self.carLb = [UILabel labelWithFrame:TLRect(80/375, 0, 250/375, 50/667) BackgroundColor:[UIColor clearColor] text:nil textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentCenter font:TLFont(18/375)];
        if (self.car)
        {
            [self.carLb setText:self.car];
        }else
        {
            [self.carLb setText:@"Honda,Audi,Ford"];
        }
        [cell addSubview:self.carLb];
    }
    else if(indexPath.row == 2)
    {
        cell.textLabel.text = @"Mac or Windows";
        if (!self.system)
        {
            self.system = @"Mac";
        }
        self.systemLb = [UILabel labelWithFrame:TLRect(130/375, 0, 185/375, 50/667) BackgroundColor:[UIColor clearColor] text:self.system textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentRight font:TLFont(18/375)];
        [cell addSubview:self.systemLb];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TLHeight(50/667);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        TLFruitController *fruitvc = [[TLFruitController alloc]init];
//        fruitvc.value = self.fruit;
        NSLog(@"self.fruit----%@",self.fruit);
        [self.navigationController pushViewController:fruitvc animated:YES];
    }else if (indexPath.row == 1)
    {
        TLCarController *carvc = [[TLCarController alloc]init];
        
        [self.navigationController pushViewController:carvc animated:YES];
    }else if (indexPath.row == 2)
    {
        TLSystemController *sysvc = [[TLSystemController alloc]init];
        
        [self.navigationController pushViewController:sysvc animated:YES];
        
    }
}











@end
