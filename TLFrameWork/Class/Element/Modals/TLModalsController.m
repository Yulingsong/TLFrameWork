//
//  TLModalsController.m
//  TLFrameWork
//
//  Created by yulingsong on 16/8/24.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "TLModalsController.h"
#import "TLPopupController.h"
#import "TLPopModalView.h"


@interface TLModalsController()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UIActionSheetDelegate>
/** ModalsTable */
@property (nonatomic,strong) UITableView *modalsList;

/** popview */
@property (nonatomic,strong) TLPopModalView *popModal;

@end

@implementation TLModalsController
//懒加载
-(UITableView *)modalsList
{
    if (!_modalsList)
    {
        _modalsList = [[UITableView alloc]init];
    }
    return _modalsList;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
    [self.popModal remove];
}

-(void)viewDidLoad
{
    self.title = @"Modals";
    self.view.backgroundColor = TLMainBackColor;
    
    self.modalsList = [[UITableView alloc]initWithFrame:TLRect(0, 0, 1, 603/667) style:UITableViewStylePlain];
    self.modalsList.backgroundColor = TLMainBackColor;
    self.modalsList.delegate = self;
    self.modalsList.dataSource = self;
    self.modalsList.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.modalsList];
    
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
    
    if (indexPath.row == 0)
    {
        cell.backgroundColor = TLMainBackColor;
        UIView *line = [UIView viewWithFrame:TLRect(0, 44.5/667, 1, 0.5/667)];
        [cell addSubview:line];
    }
    else if (indexPath.row == 1)
    {
        UILabel *msgLb = [UILabel labelWithFrame:TLRect(21/375, 25/667, 333/375, 100/667) BackgroundColor:TLClearColor text:@"There are 1:1 replacements of native Alert, Prompt and Confirm modals. They support callbacks, have very easy api and can be combined with each other. Check these examples:" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter font:TLFont(15/375)];
        msgLb.numberOfLines = 0;
        [cell addSubview:msgLb];
        
        UIButton *bt1 = [UIButton buttonWithFrame:TLRect(21/375, 135/667, 97/375, 25/667) backgroundColor:[UIColor whiteColor] title:@"Alert" cornerRdius:5 target:self selection:@selector(clickAlert)];
        [cell addSubview:bt1];
        
        UIButton *bt2 = [UIButton buttonWithFrame:TLRect(139/375, 135/667, 97/375, 25/667) backgroundColor:[UIColor whiteColor] title:@"Comfirm" cornerRdius:5 target:self selection:@selector(clickComfirm)];
        [cell addSubview:bt2];
        
        UIButton *bt3 = [UIButton buttonWithFrame:TLRect(257/375, 135/667, 97/375, 25/667) backgroundColor:[UIColor whiteColor] title:@"Prompt" cornerRdius:5 target:self selection:@selector(clickPrompt)];
        [cell addSubview:bt3];
        
        UIButton *bt4 = [UIButton buttonWithFrame:TLRect(21/375, 175/667, 156/375, 25/667) backgroundColor:[UIColor whiteColor] title:@"Login Modal" cornerRdius:5 target:self selection:@selector(clickLogin)];
        [cell addSubview:bt4];
        
        UIButton *bt5 = [UIButton buttonWithFrame:TLRect(198/375, 175/667, 156/375, 25/667) backgroundColor:[UIColor whiteColor] title:@"Password Modal" cornerRdius:5 target:self selection:@selector(clickPassword)];
        [cell addSubview:bt5];
        
        UIButton *bt6 = [UIButton buttonWithFrame:TLRect(21/375, 215/667, 156/375, 25/667) backgroundColor:[UIColor whiteColor] title:@"Action Sheet" cornerRdius:5 target:self selection:@selector(clickAction)];
        [cell addSubview:bt6];
        
        UIButton *bt7 = [UIButton buttonWithFrame:TLRect(198/375, 215/667, 156/375, 25/667) backgroundColor:[UIColor whiteColor] title:@"Popup" cornerRdius:5 target:self selection:@selector(clickPopup)];
        [cell addSubview:bt7];
        
        UIView *line = [UIView viewWithFrame:TLRect(0, 264.5/667, 1, 0.5/667)];
        [cell addSubview:line];
        
    }else if (indexPath.row == 2)
    {
        cell.backgroundColor = TLMainBackColor;
        UILabel *msgLb2 = [UILabel labelWithFrame:TLRect(21/375, 30/667, 300/375, 30/667) BackgroundColor:TLClearColor text:@"ACTION SHEET TO POPOVER" textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
        [cell addSubview:msgLb2];
        
        UIView *line = [UIView viewWithFrame:TLRect(0, 59.5/667, 1, 0.5/667)];
        [cell addSubview:line];
    }else if (indexPath.row == 3)
    {
        UILabel *msgLb3 = [UILabel labelWithFrame:TLRect(21/375, 1/667, 333/375, 100/667) BackgroundColor:[UIColor whiteColor] text:@"Action Sheet could be automatically converted to Popover (for tablets). This button will open Popover on tablets and Action Sheet on phones:" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter font:TLFont(15/375)];
        msgLb3.numberOfLines = 0;
        [cell addSubview:msgLb3];
        
        UIButton *bt7 = [UIButton buttonWithFrame:TLRect(21/375, 105/667, 156/375, 25/667) backgroundColor:[UIColor whiteColor] title:@"Action/Popover" cornerRdius:5 target:self selection:@selector(clickActionOrPopover)];
        [cell addSubview:bt7];
        
        UIView *line = [UIView viewWithFrame:TLRect(0, 149.5/667, 1, 0.5/667)];
        [cell addSubview:line];
    }else if (indexPath.row == 4)
    {
        cell.backgroundColor = TLMainBackColor;
        UILabel *msgLb4 = [UILabel labelWithFrame:TLRect(21/375, 30/667, 300/375, 30/667) BackgroundColor:TLClearColor text:@"Picker Modal" textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
        [cell addSubview:msgLb4];
        
        UIView *line = [UIView viewWithFrame:TLRect(0, 59.5/667, 1, 0.5/667)];
        [cell addSubview:line];
    }else if (indexPath.row == 5)
    {
        UILabel *msgLb5 = [UILabel labelWithFrame:TLRect(21/375, 10/667, 333/375, 70/667) BackgroundColor:TLClearColor text:@"Such overlay type is similar to Picker's overlay, but also allows to create custom picker overlays" textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter font:TLFont(15/375)];
        msgLb5.numberOfLines = 0;
        [cell addSubview:msgLb5];
        
        UIButton *bt8 = [UIButton buttonWithFrame:TLRect(21/375, 80/667, 333/375, 25/667) backgroundColor:[UIColor whiteColor] title:@"Picker Modal With Custom HTML" cornerRdius:5 target:self selection:@selector(clickPicker)];
        [cell addSubview:bt8];
        
        UIView *line = [UIView viewWithFrame:TLRect(0, 119/667, 1, 0.5/667)];
        [cell addSubview:line];
    }else if (indexPath.row == 6)
    {
        cell.backgroundColor = TLMainBackColor;
        UILabel *msgLb6 = [UILabel labelWithFrame:TLRect(21/375, 30/667, 300/375, 30/667) BackgroundColor:TLClearColor text:@"MODALS STACK" textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft font:TLFont(16/375)];
        [cell addSubview:msgLb6];
        
        UIView *line = [UIView viewWithFrame:TLRect(0, 59.5/667, 1, 0.5/667)];
        [cell addSubview:line];
    }else if (indexPath.row == 7)
    {
        UILabel *msgLb7 = [UILabel labelWithFrame:TLRect(21/375, 1/667, 333/375, 100/667) BackgroundColor:TLClearColor text:@"This feature doesn't allow to open multiple modals at the same time, and will automatically open next modal when you close the current one. Such behavior is similar to browser native alerts: " textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter font:TLFont(15/375)];
        msgLb7.numberOfLines = 0;
        [cell addSubview:msgLb7];
        
        UIButton *bt9 = [UIButton buttonWithFrame:TLRect(21/375, 105/667, 333/375, 25/667) backgroundColor:[UIColor whiteColor] title:@"Open Mutiple Alerts" cornerRdius:5 target:self selection:@selector(clickMutipleAlerts)];
        [cell addSubview:bt9];
        
        UIView *line = [UIView viewWithFrame:TLRect(0, 149.5/667, 1, 0.5/667)];
        [cell addSubview:line];
    }else
    {
        cell.backgroundColor = TLMainBackColor;
    }
    
    return cell;
}

//cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return TLHeight(45/667);
    }
    else if (indexPath.row == 1)
    {
        return TLHeight(265/667);
    }else if(indexPath.row == 2)
    {
        return TLHeight(60/667);
    }else if (indexPath.row == 3)
    {
        return TLHeight(150/667);
    }else if (indexPath.row == 4)
    {
        return TLHeight(60/667);
    }else if (indexPath.row == 5)
    {
        return TLHeight(120/667);
    }else if (indexPath.row == 6)
    {
        return TLHeight(60/667);
    }else if (indexPath.row == 7)
    {
        return TLHeight(150/667);
    }
    else
    {
        return TLHeight(50/667);
    }
}


#pragma mark ---- 按钮点击方法实现
/**
 *  每个按钮的点击方法
 */
-(void)clickAlert
{
    TLAlert(@"Hello");
}
-(void)clickComfirm
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Framework7" message:@"Are you feel good today?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.tag = 1000;
    [alert show];
}

-(void)clickPrompt
{
    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Framework7" message:@"What is your name?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert1 setAlertViewStyle:UIAlertViewStylePlainTextInput];
    alert1.tag = 1001;
    [alert1 show];

    /**
     *  UIAlertController方式，有点复杂，时间比较紧，等全部做完之后，再思考优化方法
     *  iOS8中引入UIAlertController 在iOS9里面算是全面要取代UIAlertView 和 UIActionSheet
     */
}

-(void)clickLogin
{
    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Framework7" message:@"What is your name?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert2 setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    alert2.tag = 1002;
    [alert2 show];
}

-(void)clickPassword
{
    UIAlertView *alert3 = [[UIAlertView alloc]initWithTitle:@"Framework7" message:@"Enter your password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert3 setAlertViewStyle:UIAlertViewStyleSecureTextInput];
    alert3.tag = 1003;
    [alert3 show];
}

-(void)clickAction
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Here comes some optional description or warning for actions below" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Nice Red Button" otherButtonTitles:@"Alert", nil];
    [actionSheet showInView:self.view];
}

-(void)clickPopup
{
    TLPopupController *popupVC = [[TLPopupController alloc]init];
    [self presentViewController:popupVC animated:YES completion:nil];
}

-(void)clickActionOrPopover
{
    UIActionSheet *actionSheet2 = [[UIActionSheet alloc]initWithTitle:@"Here comes some optional description or warning for actions below" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Nice Red Button" otherButtonTitles:@"Alert", nil];
    [actionSheet2 showInView:self.view];
}
-(void)clickPicker
{
    self.popModal = [[TLPopModalView alloc]init];
    [self.popModal show];
}

-(void)clickMutipleAlerts
{
    UIAlertView *alert4 = [[UIAlertView alloc]initWithTitle:@"Framework7" message:@"Alert1" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert4.tag = 1004;
    [alert4 show];
}

#pragma mark -- UIAlertViewDelegate

//根据被点击按钮的索引处理点击事件(代理)根据alert的tag值来判断
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1000)
    {
        if (buttonIndex == 1)
        {
//            NSLog(@"clickButtonAtIndex:%ld",(long)buttonIndex);
            TLAlert(@"Great");
        }
    }else if (alertView.tag == 1001)
    {
        if (buttonIndex == 1)
        {
            UITextField *nameField = [alertView textFieldAtIndex:0];
            NSString *nameText = [NSString stringWithFormat:@"Ok, your name is %@ :)",nameField.text];
            TLAlert(nameText);
        }
    }else if (alertView.tag == 1002)
    {
        if (buttonIndex == 1)
        {
            UITextField *nameField = [alertView textFieldAtIndex:0];
            UITextField *passwordField = [alertView textFieldAtIndex:1];
            NSString *loginText = [NSString stringWithFormat:@"Thank you! Username: %@,\n password:  %@",nameField.text,passwordField.text];
            TLAlert(loginText);
        }
    }else if (alertView.tag == 1003)
    {
        if (buttonIndex == 1)
        {
            UITextField *passwordField = [alertView textFieldAtIndex:0];
            NSString *pwdText = [NSString stringWithFormat:@"Thank you! Password: %@",passwordField.text];
            TLAlert(pwdText);
        }
    }else if (alertView.tag == 1004)
    {
        if (buttonIndex == 0)
        {
            UIAlertView *alert5 = [[UIAlertView alloc]initWithTitle:@"Framework7" message:@"Alert2" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert5.tag = 1005;
            [alert5 show];
        }
    }else if (alertView.tag == 1005)
    {
        if (buttonIndex == 0)
        {
            UIAlertView *alert6 = [[UIAlertView alloc]initWithTitle:@"Framework7" message:@"Alert3" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert6.tag = 1006;
            [alert6 show];
        }
    }

}

//AlertView的取消按钮的事件
-(void)alertViewCancel:(UIAlertView *)alertView
{}

#pragma mark -- UIActionSheetDelegate
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
