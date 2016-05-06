//
//  PlayerViewController.m
//  DoubanPlayer
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit+AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

#import <AFNetworking/AFNetworking.h>
#import <MediaPlayer/MediaPlayer.h>

#import "PlayerViewController.h"
#import "PlayerController.h"
#import "ChannelInfo.h"

#import "NetworkManager.h"
#import "ChannelsTableViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "SongInfo.h"
#import "PlayerController.h"
#import "ProtocolClass.h"

//RGB:颜色对照表，分量配置红绿蓝三种颜色及透明度
//宏定义RGB颜色,由r,g,b三个分量合成颜色，a合成透明度。
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define RGB(r,g,b) RGBA(r,g,b,1)

#define kGoldColor RGB(219, 196, 175)//颜色对照表里面的金色


@interface PlayerViewControlle <DoubanDelegate>


{
    BOOL isPlaying;//是否播放
    NSTimer *timer;//设置定时器
    NSMutableString *totalTimeString;//总时间的设定
}


@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
