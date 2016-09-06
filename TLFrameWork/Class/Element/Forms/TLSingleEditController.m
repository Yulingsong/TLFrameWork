//
//  TLSingleEditController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/25.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLSingleEditController.h"

@interface TLSingleEditController()<UITableViewDataSource,UITableViewDelegate>
/** tableview */
@property (nonatomic,strong) UITableView *singleList;
/** array */
@property (nonatomic,strong) NSArray *array;
/** bool */
@property (nonatomic,assign) BOOL show;


@end

@implementation TLSingleEditController
-(UITableView *)singleList
{
    if (!_singleList)
    {
        _singleList = [[UITableView alloc]init];
        
    }
    return _singleList;
}

#pragma mark ---- 显示以及隐藏tabbar
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
    self.title = @"单选编辑模式";
    self.view.backgroundColor = TLMainBackColor;

    UILabel *label = [UILabel labelWithFrame:TLRect(100/375, 35/667, 175/375, 30/667) BackgroundColor:[UIColor lightGrayColor] text:@"单选编辑模式" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter font:TLFont(15/375)];
    [self.view addSubview:label];
    
    self.singleList = [[UITableView alloc]initWithFrame:TLRect(0, 100/667, 1, 440/667) style:UITableViewStylePlain];
    self.singleList.delegate = self;
    self.singleList.dataSource = self;
    [self.view addSubview:self.singleList];
    
    self.array = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h", nil];
    
}

#pragma mark -- UITableViewDateSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
//    UIImageView *im = [[UIImageView alloc]init];
//    [im setFrame:TLRect(300/375, 10/667, 60/375, 30/667)];
//    [im setImage:[UIImage imageNamed:@"check"]];
//    [cell addSubview:im];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"Item  %@",self.array[indexPath.row]];

    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TLHeight(55/667);
}

#pragma mark -- UITableViewDelegeta
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}



@end
