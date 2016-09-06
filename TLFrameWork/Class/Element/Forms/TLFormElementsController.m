//
//  TLFormElementsController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//
#define textFrame TLRect(160/375, 0, 150/375, 48/667)
#define textFrame2 TLRect(55/375, 0, 150/375, 48/667)
#define textFrame3 TLRect(120/375, 0, 150/375, 48/667)
#define textFrame4 TLRect(15/375, 0, 150/375, 48/667)

#import "TLFormElementsController.h"

@interface TLFormElementsController()<UITableViewDelegate,UITableViewDataSource>
/** tableView */
@property (nonatomic,strong) UITableView *formsTableView;
/** array */
@property (nonatomic,strong) NSArray *array;

@end

@implementation TLFormElementsController
#pragma mark ---- 显示以及隐藏tabbar
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
}

#pragma mark ---- view did load

/**
 *  懒加载
 */
-(UITableView *)formsTableView
{
    if (!_formsTableView)
    {
        _formsTableView = [[UITableView alloc]init];
    }
    return _formsTableView;
}
-(void)viewDidLoad
{
    self.title = @"Form Elements";
    self.view.userInteractionEnabled = YES;
    self.formsTableView = [[UITableView alloc]initWithFrame:TLRect(0, 0, 1, 595/667) style:UITableViewStylePlain];
    self.formsTableView.delegate = self;
    self.formsTableView.dataSource = self;
    self.formsTableView.userInteractionEnabled = YES;
    self.formsTableView.keyboardDismissMode  = UIScrollViewKeyboardDismissModeInteractive;
    [self.formsTableView setBackgroundColor:TLMainBackColor];
    [self.view addSubview:self.formsTableView];
    
}

#pragma mark ---- UITabLeViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"formelements"];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (indexPath.row == 0 || indexPath.row == 13 || indexPath.row == 19 || indexPath.row == 25 )
    {
        cell.backgroundColor = TLColor(240, 239, 245);
        cell.textLabel.textColor = [UIColor lightGrayColor];
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"FULL LAYOUY";
        }else if (indexPath.row == 13)
        {
            cell.textLabel.text = @"ICONS AND INPUTS";
        }else if (indexPath.row == 19)
        {
            cell.textLabel.text = @"LABELS AND INPUTS";
        }else if (indexPath.row == 25)
        {
            cell.textLabel.text = @"JUST INPUTS";
        }
    }else if(indexPath.row <= 18)
    {
        cell.imageView.image = [UIImage imageNamed:@"forms"];
        if (indexPath.row == 1)
        {
            cell.textLabel.text = @"Name";
            UITextField *text1 = [UITextField textFieldWithFrame:textFrame placehodler:@"Your Name"];
            [cell addSubview:text1];
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"E-mail";
            UITextField *text2 = [UITextField textFieldWithFrame:textFrame placehodler:@"E-mail"];
            text2.keyboardType = UIKeyboardTypeEmailAddress;
            [cell addSubview:text2];
        }else if (indexPath.row == 3){
            cell.textLabel.text = @"URL";
            UITextField *text3 = [UITextField textFieldWithFrame:textFrame placehodler:@"URL"];
            text3.keyboardType = UIKeyboardTypeEmailAddress;
            [cell addSubview:text3];
        }else if (indexPath.row == 4){
            cell.textLabel.text = @"Password";
            UITextField *text4 = [UITextField textFieldWithFrame:textFrame placehodler:@"Password"];
            text4.secureTextEntry = YES;
            [cell addSubview:text4];
        }else if (indexPath.row == 5){
            cell.textLabel.text = @"Phone";
            UITextField *text5 = [UITextField textFieldWithFrame:textFrame placehodler:@"Phone"];
            text5.keyboardType = UIKeyboardTypeNumberPad;
            [cell addSubview:text5];
        }else if (indexPath.row == 6){
            cell.textLabel.text = @"Gender";
            UITextField *text6 = [UITextField textFieldWithFrame:textFrame placehodler:nil];
            [cell addSubview:text6];
        }else if (indexPath.row == 7){
            cell.textLabel.text = @"Birth date";
            UITextField *text7 = [UITextField textFieldWithFrame:textFrame placehodler:nil];
            [text7 setText:@"2016-08-25"];
            [cell addSubview:text7];
        }else if (indexPath.row == 8){
            cell.textLabel.text = @"Date time";
            UITextField *text8 = [UITextField textFieldWithFrame:textFrame placehodler:@"Birth day"];
            [cell addSubview:text8];
        }else if (indexPath.row == 9){
            cell.textLabel.text = @"Switch";
            UISwitch *switch9 = [[UISwitch alloc]initWithFrame:TLRect(160/375, 8/667, 50/375, 38/667)];
            [cell addSubview:switch9];
        }else if (indexPath.row == 10){
            cell.textLabel.text = @"Slide";
            UISlider *slide10 = [[UISlider alloc]initWithFrame:TLRect(160/375, 15/667, 200/375, 20/667)];
            slide10.value = 0.5;
            slide10.minimumTrackTintColor = [UIColor lightGrayColor];
            [cell addSubview:slide10];
        }else if (indexPath.row == 11){
            cell.textLabel.text = @"Textarea";
            UITextView *textView = [[UITextView alloc]initWithFrame:TLRect(160/375, 0, 200/375, 99.5/667)];
            [cell addSubview:textView];
            textView.font = TLFont(15/375);
        }else if(indexPath.row == 12){
            cell.textLabel.text = @"Resizeable";
        }else if(indexPath.row == 14){
            UITextField *text14 = [UITextField textFieldWithFrame:textFrame2 placehodler:@"Your Name"];
            [cell addSubview:text14];
        }else if(indexPath.row == 15){
            UITextField *text15 = [UITextField textFieldWithFrame:textFrame2 placehodler:@"E-mail"];
            text15.keyboardType = UIKeyboardTypeEmailAddress;
            [cell addSubview:text15];
        }else if(indexPath.row == 16){
            UITextField *text16 = [UITextField textFieldWithFrame:textFrame2 placehodler:nil];
            [cell addSubview:text16];
        }else if(indexPath.row == 17){
            UITextField *text17 = [UITextField textFieldWithFrame:textFrame2 placehodler:nil];
            [text17 setText:@"2016-08-25"];
            [cell addSubview:text17];
        }else if(indexPath.row == 18){
            UISwitch *switch18 = [[UISwitch alloc]initWithFrame:TLRect(55/375, 8/667, 50/375, 38/667)];
            [cell addSubview:switch18];
        }
    }else
    {
        if (indexPath.row == 20){
            cell.textLabel.text = @"Name";
            UITextField *text20 = [UITextField textFieldWithFrame:textFrame3 placehodler:@"Your Name"];
            [cell addSubview:text20];
        }else if (indexPath.row == 21){
            cell.textLabel.text = @"E-mail";
            UITextField *text21 = [UITextField textFieldWithFrame:textFrame3 placehodler:@"E-mail"];
            text21.keyboardType = UIKeyboardTypeEmailAddress;
            [cell addSubview:text21];
        }else if (indexPath.row == 22){
            cell.textLabel.text = @"Gender";
            UITextField *text22 = [UITextField textFieldWithFrame:textFrame3 placehodler:nil];
            [cell addSubview:text22];
        }else if (indexPath.row == 23){
            cell.textLabel.text = @"Birth date";
            UITextField *text23 = [UITextField textFieldWithFrame:textFrame3 placehodler:nil];
            [text23 setText:@"2016-08-25"];
            [cell addSubview:text23];
        }else if (indexPath.row == 24){
            cell.textLabel.text = @"Switch";
            UISwitch *switch24 = [[UISwitch alloc]initWithFrame:TLRect(120/375, 8/667, 50/375, 38/667)];
            [cell addSubview:switch24];
        }else if (indexPath.row == 26){
            UITextField *text26 = [UITextField textFieldWithFrame:textFrame4 placehodler:@"Your Name"];
            [cell addSubview:text26];
        }else if (indexPath.row == 27){
            UITextField *text27 = [UITextField textFieldWithFrame:textFrame4 placehodler:@"E-mail"];
            text27.keyboardType = UIKeyboardTypeEmailAddress;
            [cell addSubview:text27];
        }else if (indexPath.row == 28){
            UITextField *text28 = [UITextField textFieldWithFrame:textFrame4 placehodler:nil];
            [cell addSubview:text28];
        }else if (indexPath.row == 29){
            UITextField *text29 = [UITextField textFieldWithFrame:textFrame4 placehodler:nil];
            [text29 setText:@"2016-08-25"];
            [cell addSubview:text29];
        }
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 13 || indexPath.row == 19 || indexPath.row == 25)
    {
        return TLHeight(65/667);
    }else if (indexPath.row == 11){
        return TLHeight(100/667);
    }else
    {
        return TLHeight(48/667);
    }
}


@end
