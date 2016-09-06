//
//  TLFruitController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/25.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLFruitController.h"

@interface TLFruitController()<UITableViewDelegate,UITableViewDataSource>
/** fruitList */
@property (nonatomic,strong) UITableView *fruitList;
/** image */
@property (nonatomic,strong) UIImageView *checkView;
/** array */
@property (nonatomic,strong) NSArray *array;


@end

@implementation TLFruitController

-(UITableView *)fruitList
{
    if (!_fruitList)
    {
        _fruitList = [[UITableView alloc]init];
    }
    return _fruitList;
}
-(UIImageView *)checkView
{
    if (!_checkView)
    {
        _checkView = [[UIImageView alloc]init];
    }
    return _checkView;
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
    self.title = @"Fruit";
    
    self.array = [NSArray arrayWithObjects:@"Apple",@"Pineapple",@"Pear",@"Orange",@"Melon",@"Peach",@"Banana", nil];
    
//    for (int i = 0; i < self.array.count; i++)
//    {
//        if ([self.value isEqualToString:self.array[i]])
//        {
//            NSLog(@"%@",self.value);
//        }
//    }
//    
    self.view.backgroundColor = TLMainBackColor;
    self.fruitList = [[UITableView alloc]initWithFrame:TLRect(0, 50/667, 1, 350/667) style:UITableViewStylePlain];
    self.fruitList.delegate = self;
    self.fruitList.dataSource = self;
    self.fruitList.backgroundColor = TLMainBackColor;
    [self.view addSubview:self.fruitList];
}



#pragma mark -- UITableViewDateSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TLHeight(50/667);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"fruit" object:cell.textLabel.text];
//    [self popoverPresentationController];
    [self.navigationController popViewControllerAnimated:YES];
//    NSLog(@"%ld",(long)indexPath.row);
}







@end
