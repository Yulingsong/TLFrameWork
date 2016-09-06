//
//  TLListViewController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLListViewController.h"

@interface TLListViewController()<UITableViewDelegate,UITableViewDataSource>
/** noticeLabel */
@property (nonatomic,strong) UILabel *noticeLabel;

@end

@implementation TLListViewController
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
    self.title = @"List View";
    [self.view setBackgroundColor:TLMainBackColor];
    
    /**
     用于滑动的scrollview
     */
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:TLRect(0, 0/667, 1, 603/667)];
    scroll.backgroundColor = TLMainBackColor;
    scroll.contentSize = TLSizeMake(1, 2550/667);
    scroll.delegate = self;
    [self.view addSubview:scroll];
    
    self.noticeLabel = [UILabel labelWithFrame:TLRect(21/375, 0, 333/375, 150/667) BackgroundColor:TLClearColor text:@"Framework7 allows you to be flexible with list views (table views). You can make them as navigation menus, you can use there icons, inputs, and any elements inside of the list, and even make them nested:" textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft font:TLFont(15/375)];
    self.noticeLabel.numberOfLines = 0;
    [scroll addSubview:self.noticeLabel];

    
    UITableView *tableView1 = [[UITableView alloc]initWithFrame:TLRect(0, 160/667, 1, 408/667) style:UITableViewStylePlain];
    tableView1.delegate = self;
    tableView1.dataSource = self;
    tableView1.tag = 1001;
    tableView1.scrollEnabled = NO;
    tableView1.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView1.backgroundColor = TLClearColor;
    [scroll addSubview:tableView1];
    
    

    UITableView *tableView2 = [[UITableView alloc]initWithFrame:TLRect(0, 572/667, 1, 277/667) style:UITableViewStylePlain];
    tableView2.delegate = self;
    tableView2.dataSource = self;
    tableView2.tag = 1002;
    tableView2.scrollEnabled = NO;
    tableView2.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView2.backgroundColor = TLClearColor;
    [scroll addSubview:tableView2];

    UILabel *lb = [[UILabel alloc]initWithFrame:TLRect(15/375, 852/667, 345/375, 55/667)];
    lb.backgroundColor = TLClearColor;
    lb.text = @"Grouped with sticky titles";
    lb.textColor = [UIColor lightGrayColor];
    [scroll addSubview:lb];

    UITableView *tableView3 = [[UITableView alloc]initWithFrame:TLRect(0, 910/667, 1, 560/667) style:UITableViewStyleGrouped];
    tableView3.delegate = self;
    tableView3.dataSource = self;
    tableView3.tag = 1003;
    tableView3.scrollEnabled = NO;
    tableView3.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView3.backgroundColor = TLClearColor;
    [scroll addSubview:tableView3];
 
    UITableView *tableView4 = [[UITableView alloc]initWithFrame:TLRect(0, 1480/667, 1, 535/667) style:UITableViewStylePlain];
    tableView4.delegate = self;
    tableView4.dataSource = self;
    tableView4.tag = 1004;
    tableView4.scrollEnabled = NO;
    tableView4.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView4.backgroundColor = TLClearColor;
    [scroll addSubview:tableView4];

    UITableView *tableView5 = [[UITableView alloc]initWithFrame:TLRect(15/375, 2035/667, 345/375, 252/667) style:UITableViewStylePlain];
    tableView5.delegate = self;
    tableView5.dataSource = self;
    tableView5.tag = 1005;
    tableView5.scrollEnabled = NO;
    tableView5.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView5.backgroundColor = TLClearColor;
    [scroll addSubview:tableView5];

    UITableView *tableView6 = [[UITableView alloc]initWithFrame:TLRect(0, 2295/667, 1, 210/667) style:UITableViewStylePlain];
    tableView6.delegate = self;
    tableView6.dataSource = self;
    tableView6.tag = 1006;
    tableView6.scrollEnabled = NO;
    tableView6.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView6.backgroundColor = TLClearColor;
    [scroll addSubview:tableView6];
}

#pragma mark -- UITableViewDateSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 1003) {
        return 3;
    }else
    {
        return 1;
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1001)
    {
        return 8;
    }else if (tableView.tag == 1002)
    {
        return 6;
    }else if (tableView.tag == 1003)
    {
        return 3;
    }else if (tableView.tag == 1004)
    {
        return 11;
    }else if (tableView.tag == 1005)
    {
        return 5;
    }
    else if (tableView.tag == 1006)
    {
        return 4;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1001)
    {
        UITableViewCell *cell1 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        if(indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7)
        {
            cell1.imageView.image = [UIImage imageNamed:@"calendar"];
        }
        if (indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7) {
            cell1.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0)
        {
            cell1.backgroundColor = TLClearColor;
            cell1.textLabel.text = @"DTAT LIST, DEFAULT";
            cell1.textLabel.textColor = [UIColor lightGrayColor];
            UIView *line = [UIView viewWithFrame:TLRect(0, 54.5/667, 1, 0.5/667)];
            [cell1 addSubview:line];
        }else if (indexPath.row == 1)
        {
            cell1.textLabel.text = @"Ivan Petrov";
        }else if (indexPath.row == 2)
        {
            cell1.textLabel.text = @"John Doe";
        }else if(indexPath.row == 3)
        {
            cell1.textLabel.text = @"Jenna Smith";
        }else if (indexPath.row == 4)
        {
            cell1.backgroundColor = TLClearColor;
            cell1.textLabel.textColor = [UIColor lightGrayColor];
            cell1.textLabel.text = @"LINKS";
            UIView *line = [UIView viewWithFrame:TLRect(0, 54.5/667, 1, 0.5/667)];
            [cell1 addSubview:line];
        }else if (indexPath.row == 5)
        {
            cell1.textLabel.text = @"Ivan Petrov";
        }else if (indexPath.row == 6)
        {
            cell1.textLabel.text = @"John Doe";
        }else
        {
            cell1.textLabel.text = @"Jenna Smith";
        }

        return cell1;
    }else if (tableView.tag == 1002)
    {
        UITableViewCell *cell2 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 5) {
            cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0)
        {
            cell2.backgroundColor = TLClearColor;
            cell2.textLabel.textColor = [UIColor lightGrayColor];
            cell2.textLabel.text = @"LINKS, NO ICONS";
            UIView *line = [UIView viewWithFrame:TLRect(0, 54.5/667, 1, 0.5/667)];
            [cell2 addSubview:line];
        }else if (indexPath.row == 1)
        {
            cell2.textLabel.text = @"John Doe";
        }else if(indexPath.row == 2)
        {
            cell2.textLabel.text = @"Jenna Smith";
        }
        else if (indexPath.row == 3)
        {
            cell2.textLabel.text = @"Divider Here";
            cell2.backgroundColor = TLColor(247, 247, 247);
            UIView *line = [UIView viewWithFrame:TLRect(0, 0, 1, 0.5/667)];
            [cell2 addSubview:line];
        }else if(indexPath.row == 2)
        {
            cell2.textLabel.text = @"Jenna Smith";
        }else
        {
            cell2.textLabel.text = @"Jenna Smith";
        }
        return cell2;
    }else if (tableView.tag == 1003)
    {
        UITableViewCell *cell3 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
 
        NSArray *array1 = @[@"Aaron",@"Abble",@"Adam",@"Balley",@"Barclay",@"Bartolo",@"Calden",@"Calvin",@"Candy"];
        if (indexPath.section == 0)
        {
            cell3.textLabel.text = array1[indexPath.row];
        }else if (indexPath.section == 1)
        {
            cell3.textLabel.text = array1[indexPath.row + 3];
        }else
        {
            cell3.textLabel.text = array1[indexPath.row + 6];
        }
        
        return cell3;
    }else if (tableView.tag == 1004)
    {
        UITableViewCell *cell4 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        
        if (indexPath.row == 0)
        {
            cell4.backgroundColor = TLClearColor;
            cell4.textLabel.textColor = [UIColor lightGrayColor];
            cell4.textLabel.text = @"MIXED AND NESTED";
    
            UIView *line = [UIView viewWithFrame:TLRect(0, 54.5/667, 1, 0.5/667)];
            [cell4 addSubview:line];
        }else if (indexPath.row == 1)
        {
            cell4.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(15/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell4 addSubview:image];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(57/375, 9/667, 150/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Ivan Pertrov" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell4 addSubview:lb];
            cell4.detailTextLabel.text = @"CEO";
//            UIView *line = [UIView viewWithFrame:TLRect(57/375, 47.5/667, 318/375, 0.5/667)];
//            [cell4 addSubview:line];
        }else if (indexPath.row == 2)
        {
            cell4.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(15/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell4 addSubview:image];
            
            UIImageView *image2 = [UIImageView imageViewWithFrame:TLRect(57/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell4 addSubview:image2];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(99/375, 9/667, 150/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Two Icons here" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell4 addSubview:lb];
            
//            UIView *line = [UIView viewWithFrame:TLRect(99/375, 47.5/667, 275/375, 0.5/667)];
//            [cell4 addSubview:line];
        }else if (indexPath.row == 3)
        {
            cell4.textLabel.text = @"No Icons here";
            
//            UIView *line = [UIView viewWithFrame:TLRect(15/375, 34.5/667, 360, 0.5/667)];
//            [cell4 addSubview:line];
        }else if (indexPath.row == 4)
        {
            cell4.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(57/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell4 addSubview:image];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(99/375, 9/667, 150/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Ivan Pertrov" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell4 addSubview:lb];
            
            cell4.detailTextLabel.text = @"CEO";
            
//            UIView *line = [UIView viewWithFrame:TLRect(99/375, 47.5/667, 276/375, 0.5/667)];
//            [cell4 addSubview:line];

        }else if (indexPath.row == 5)
        {
            cell4.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(57/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell4 addSubview:image];
            
            UIImageView *image2 = [UIImageView imageViewWithFrame:TLRect(99/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell4 addSubview:image2];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(151/375, 9/667, 150/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Two Icons here" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell4 addSubview:lb];
            
//            UIView *line = [UIView viewWithFrame:TLRect(99/375, 47.5/667, 275/375, 0.5/667)];
//            [cell4 addSubview:line];
        }else if (indexPath.row == 6)
        {
            UILabel *lb = [UILabel labelWithFrame:TLRect(57/375, 9/667, 224/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"No Icons here" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell4 addSubview:lb];
            
//            UIView *line = [UIView viewWithFrame:TLRect(57/375, 47.5/667, 318/375, 0.5/667)];
//            [cell4 addSubview:line];
        }else if (indexPath.row == 7)
        {
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(57/375,  9/667, 30/375, 30/667) image:@"calendar"];
            [cell4 addSubview:image];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(99/375,  9/667, 270/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Ultra long tet gose here no dhakjhdkjasd" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell4 addSubview:lb];
            
//            UIView *line = [UIView viewWithFrame:TLRect(99/375, 47.5/667, 318/375, 0.5/667)];
//            [cell4 addSubview:line];
        }else if (indexPath.row == 8)
        {
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(57/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell4 addSubview:image];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(99/375, 9/667, 100/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"With Switch" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell4 addSubview:lb];
            
            UISwitch *switch1 = [[UISwitch alloc]init];
            switch1.frame = TLRect(300/375, 5/667, 40/375, 27/667);
            [cell4 addSubview:switch1];
            
//            UIView *line = [UIView viewWithFrame:TLRect(99/375, 47.5/667, 318/375, 0.5/667)];
//            [cell4 addSubview:line];
        }else if (indexPath.row == 9)
        {
            cell4.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(15/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell4 addSubview:image];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(57/375, 9/667, 280/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Ultra long tet gose here no dhakjhdkjasd" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell4 addSubview:lb];
            
//            UIView *line = [UIView viewWithFrame:TLRect(57/375, 47.5/667, 318/375, 0.5/667)];
//            [cell4 addSubview:line];
        }else if (indexPath.row == 10)
        {
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(15/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell4 addSubview:image];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(57/375, 9/667, 315/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"With Switch" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell4 addSubview:lb];
            
            UISwitch *switch1 = [[UISwitch alloc]init];
            switch1.frame = TLRect(300/375, 5/667, 40/375, 27/667);
            [cell4 addSubview:switch1];

//            UIView *line = [UIView viewWithFrame:TLRect(57/375, 47.5/667, 318/375, 0.5/667)];
//            [cell4 addSubview:line];
        }
        return cell4;
    }else if (tableView.tag == 1005)
    {
        UITableViewCell *cell5 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        if (indexPath.row == 0)
        {
            cell5.backgroundColor = TLClearColor;
            cell5.textLabel.textColor = [UIColor lightGrayColor];
            cell5.textLabel.text = @"MIXED INSTE";
        }else if (indexPath.row == 1)
        {
            cell5.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(15/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell5 addSubview:image];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(57/375, 9/667, 150/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Ivan Pertrov" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell5 addSubview:lb];
            
            cell5.detailTextLabel.text = @"CEO";
            
//            UIView *line = [UIView viewWithFrame:TLRect(57/375, 34.5/667, 318/375, 0.5/667)];
//            [cell5 addSubview:line];
        }else if (indexPath.row == 2)
        {
            cell5.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(15/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell5 addSubview:image];
            
            UIImageView *image2 = [UIImageView imageViewWithFrame:TLRect(57/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell5 addSubview:image2];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(99/375, 9/667, 150/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Two Icons here" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell5 addSubview:lb];
            
//            UIView *line = [UIView viewWithFrame:TLRect(99/375, 34.5/667, 275/375, 0.5/667)];
//            [cell5 addSubview:line];
        }else if (indexPath.row == 3)
        {
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(15/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell5 addSubview:image];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(57/375, 9/667, 320/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Ultra long tet gose here no ....." textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell5 addSubview:lb];
            
//            UIView *line = [UIView viewWithFrame:TLRect(57/375, 34.5/667, 318/375, 0.5/667)];
//            [cell5 addSubview:line];
        }else if (indexPath.row == 4)
        {
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(15/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell5 addSubview:image];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(57/375, 9/667, 278/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"With Switch" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell5 addSubview:lb];
            
            UISwitch *switch1 = [[UISwitch alloc]init];
            switch1.frame = TLRect(270/375, 5/667, 40/375, 27/667);
            [cell5 addSubview:switch1];
//            UIView *line = [UIView viewWithFrame:TLRect(57/375, 34.5/667, 318/375, 0.5/667)];
//            [cell5 addSubview:line];
        }
        return cell5;
    }else if (tableView.tag == 1006)
    {
        UITableViewCell *cell6 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        if (indexPath.row == 0)
        {
            cell6.backgroundColor = TLClearColor;
            cell6.textLabel.textColor = [UIColor lightGrayColor];
            cell6.textLabel.text = @"TABLE INSTE";
            
            UIView *line = [UIView viewWithFrame:TLRect(0, 53.5/667, 1, 0.5/667)];
            [cell6 addSubview:line];
        }else if (indexPath.row == 1)
        {
            cell6.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(15/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell6 addSubview:image];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(57/375, 9/667, 150/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Ivan Pertrov" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell6 addSubview:lb];
            
            cell6.detailTextLabel.text = @"CEO";
            
//            UIView *line = [UIView viewWithFrame:TLRect(57/375, 34.5/667, 318/375, 0.5/667)];
//            [cell6 addSubview:line];
        }else if (indexPath.row == 2)
        {
            cell6.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(15/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell6 addSubview:image];
            
            UIImageView *image2 = [UIImageView imageViewWithFrame:TLRect(57/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell6 addSubview:image2];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(99/375, 9/667, 150/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Two Icons here" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell6 addSubview:lb];
            
//            UIView *line = [UIView viewWithFrame:TLRect(99/375, 34.5/667, 275/375, 0.5/667)];
//            [cell6 addSubview:line];
        }else if (indexPath.row == 3)
        {
            UIImageView *image = [UIImageView imageViewWithFrame:TLRect(15/375, 9/667, 30/375, 30/667) image:@"calendar"];
            [cell6 addSubview:image];
            
            UILabel *lb = [UILabel labelWithFrame:TLRect(57/375, 9/667, 320/375, 30/667) BackgroundColor:[UIColor clearColor] text:@"Ultra long tet gose here no ....." textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
            [cell6 addSubview:lb];
            
//            UIView *line = [UIView viewWithFrame:TLRect(57/375, 34.5/667, 318/375, 0.5/667)];
//            [cell6 addSubview:line];
        }
        return cell6;
    }

    else{
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        
        return cell;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1001)
    {
        if (indexPath.row == 0 || indexPath.row == 4)
        {
            return TLHeight(55/667);
        }
        else
        {
            return TLHeight(48/667);
        }
    }else if (tableView.tag == 1002)
    {
        if (indexPath.row == 0)
        {
            return TLHeight(55/667);
        }else if (indexPath.row == 3)
        {
            return TLHeight(30/667);
        }else
        {
            return TLHeight(48/667);
        }
    }else if (tableView.tag == 1003)
    {
        return TLHeight(48/667);
    }else if (tableView.tag == 1004)
    {
        if (indexPath.row == 0)
        {
            return TLHeight(55/667);
        }else
        {
            return TLHeight(48/667);
        }
    }else if (tableView.tag == 1005)
    {
        if (indexPath.row == 0)
        {
            return TLHeight(55/667);
        }else
        {
            return TLHeight(48/667);
        }
    }else if (tableView.tag == 1006)
    {
        if (indexPath.row == 0)
        {
            return TLHeight(55/667);
        }else
        {
            return TLHeight(48/667);
        }
    }
    else
    {
        return TLHeight(48/667);
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 1003)
    {
        if (section == 0)
        {
            return TLHeight(40/667);
        }else if (section == 1)
        {
            return TLHeight(40/667);
        }else
        {
            return TLHeight(40/667);
        }
        
    }else
    {
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (tableView.tag == 1003)
    {
        return TLHeight(1/667);
    }else
    {
        return 0;
    }
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *array = @[@"A",@"B",@"C"];
    if (tableView.tag == 1003)
    {
        return array[section];
        
    }else
    {
        return nil;
    }
}

@end
