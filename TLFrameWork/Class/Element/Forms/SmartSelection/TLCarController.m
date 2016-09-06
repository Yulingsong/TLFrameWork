//
//  TLCarController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/25.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLCarController.h"

@interface TLCarController()<UITableViewDelegate,UITableViewDataSource>
/** carlist */
@property (nonatomic,strong) UITableView *carList;

/** array */
@property (nonatomic,strong) NSArray *array1;
@property (nonatomic,strong) NSArray *array2;
@property (nonatomic,strong) NSArray *array3;

@end


@implementation TLCarController

-(UITableView *)carList
{
    if (!_carList)
    {
        _carList = [[UITableView alloc]init];
    }
    return _carList;
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
    self.title = @"Car";
    self.view.backgroundColor = TLMainBackColor;
    self.array1 = [NSArray arrayWithObjects:@"Honda",@"Lexus",@"Mazda",@"Nissan",@"Toyota", nil];
    self.array2 = [NSArray arrayWithObjects:@"Audi",@"BMW",@"Meredes",@"Volkswagen",@"Volvo", nil];
    self.array3 = [NSArray arrayWithObjects:@"Cadillac",@"Chrysler",@"Dodge",@"Ford", nil];
    self.carList = [[UITableView alloc]initWithFrame:TLRect(0, 0/667, 1, 603/667) style:UITableViewStyleGrouped];
    self.carList.backgroundColor = TLMainBackColor;
    self.carList.delegate = self;
    self.carList.dataSource = self;
    [self.view addSubview:self.carList];
}

#pragma mark -- UITableViewDateSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 5;
    }else if (section == 1)
    {
        return 5;
    }else
    {
        return 4;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.section == 0)
    {
        cell.textLabel.text = self.array1[indexPath.row];
    }else if (indexPath.section == 1)
    {
        cell.textLabel.text = self.array2[indexPath.row];
    }else
    {
        cell.textLabel.text = self.array3[indexPath.row];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TLHeight(50/667);
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Japanese";
    }else if (section == 1)
    {
        return @"German";
    }else
    {
        return @"American";
    }
}

@end
