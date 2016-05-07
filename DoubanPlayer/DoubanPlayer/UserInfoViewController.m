//
//  UserInfoViewController.m
//  DoubanPlayer
//
//  Created by lk on 16/5/7.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import "UserInfoViewController.h"
#import "CDSideBarController.h"
@interface UserInfoViewController ()
{
    NetworkManager* networkManager;
    UIStoryboard* mainStoryboard;
    AppDelegate* appDelegate;
}
@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mainStoryboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    appDelegate=[[UIApplication sharedApplication]delegate];
    //给登录图片添加手势
    UITapGestureRecognizer* singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loginImageTapped)];
    [singleTap setNumberOfTapsRequired:1];
    self.loginImage.userInteractionEnabled=YES;
    [self.loginImage addGestureRecognizer:singleTap];
    
    networkManager=[[NetworkManager alloc]init];
    networkManager.delegate=(id)self;//系统本身的协议
    
}
-(void)viewWillAppear:(BOOL)animated
{
    //界面即将出来时，将用户信息显示出来
    [super viewWillAppear:animated];
    [self setUserInfo];
}
-(void)viewDidLayoutSubviews
{
    [super viewWillLayoutSubviews];
    //设置登录图片圆角化
    _loginImage.layer.cornerRadius=_loginImage.frame.size.width/2.0;
    if (!_loginImage.clipsToBounds)
    {
        _loginImage.clipsToBounds=YES;
    }
}
//增加点击事件
-(void)loginImageTapped
{
    
    LoginViewController* loginVC=[mainStoryboard instantiateViewControllerWithIdentifier:@"loginVC"];
    loginVC.delegate=(id)self;
    //加载CDSideBarController，释放右侧的菜单
    [[CDSideBarController sharedInstance]dismissMenu];
    [self presentViewController:loginVC animated:YES completion:nil];
    
    
}
- (IBAction)logoutButtonTapped:(UIButton *)sender
{
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"登录" message:@"您确定登录吗" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            break;
        case 1:
            [networkManager logout];
            break;
        default:
            break;
    }
}
-(void)setUserInfo
{
    //若用户已经注册，获取数据库里的信息
    if (appDelegate.userInfo.cookies)
    {
        [[_loginImage setImageWithURL:[NSString stringWithFormat:@"http://img3.douban.com/icon/ul%@-1.jpg",appDelegate.userInfo.userID]]];
        _loginImage.userInteractionEnabled=NO;
        _usernameLabel.text=appDelegate.userInfo.name;
        _playedLabel.text=appDelegate.userInfo.played;
        _likedLabel.text=appDelegate.userInfo.liked;
        _bannedLabel.text=appDelegate.userInfo.banned;
        _logoutButton.hidden=NO;
    }else
    {
        [_loginImage setImage:[UIImage imageNamed:@"login"]];
        _loginImage.userInteractionEnabled=YES;
        _usernameLabel.text=@"";
        _playedLabel.text=@"0";
        _likedLabel.text=@"0";
        _bannedLabel.text=@"0";
        _logoutButton.hidden= YES;
    }
}
//注销成功
-(void)logoutSuccess
{
    [self setUserInfo];
}
@end