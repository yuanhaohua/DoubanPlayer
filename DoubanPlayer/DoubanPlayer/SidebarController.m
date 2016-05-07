//
//  SidebarController.m
//  DoubanPlayer
//
//  Created by lkjy on 16/5/7.
//  Copyright © 2016年 yuan. All rights reserved.
//
//侧滑的控制
#import "SidebarController.h"
#import "PlayerViewController.h"
#import "ChannelsTableViewController.h"

@interface SidebarController ()
{
    CDSideBarController* sideBar;//侧边的约束条
    
    PlayerViewController* playerVC;//播放控制器
    
    ChannelsTableViewController* channelsVC;//频道切换控制器
    
    UserInfoViewController *userInfoVC;//用户信息显示
    
     AppDelegate *appDelegate;
    
}

@end

@implementation SidebarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication]delegate];//引进协议
    //创建侧边图像的数组
    NSArray *imageList = @[[UIImage imageNamed:@"menuPlayer"],[UIImage imageNamed:@"menuChannel"],[UIImage imageNamed:@"menuLogin"],
                           [UIImage imageNamed:@"menuClose.png"]];
    
    //将图像放到侧边
    sideBar = [CDSideBarController sharedInstanceWithImages:imageList];
    
    sideBar.delegate = self;
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];//用Storyboard关键字寻找
    
    playerVC = [[PlayerViewController alloc]init];//初始化playerVC
    
    channelsVC =[[ChannelsTableViewController alloc]init];
    
    channelsVC.delegate = (id)self;
    
    
    userInfoVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"userInfoVC"]; //用Storyboard关键字寻找
    
    //创建viewController的数组
    self.viewControllers = @[playerVC, channelsVC, userInfoVC];
    
    
    
}
-(BOOL)canBecomeFirstResponder
{
    return  YES;
}
//界面出现时候的动画
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBar.hidden = YES;//标签条隐藏
    
    //当这个视图属于类视图时，将这个子视图弹出显示
    for (UIView * child in self.tabBar.subviews)
    {
        if ([child isKindOfClass:[UIControl class]])
        {
            [child removeFromSuperview];
        }
    }
    //标签条所在view的位置
    [sideBar insertMenuButtonOnView:self.view atPosition:CGPointMake(self.view.frame.size.width - 50, 30)];
}
//按照下标点击菜单按钮
-(void)menuButtonClicked:(int)index
{
    self.selectedIndex = index;
    
    switch (index) {
        case 0:
        case 1:
        case 2:
            self.selectedIndex = index;
            
            break;
            
        case 3:
            
            break;
            
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

