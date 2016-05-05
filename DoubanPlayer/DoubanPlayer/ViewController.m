//
//  ViewController.m
//  DoubanPlayer
//
//  Created by yuan on 16/5/4.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import "AppDelegate.h"
#import "ChannelInfo.h"
#import "SongInfo.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_once(&onceToken, ^{
        [self loadArchiver];
        //[application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
        [self initChannelsData];
        //后台播放
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];
        [session setActive:YES error:nil];
    });

}

- (void)loadArchiver{
    NSString *homePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *appdelegatePath = [homePath stringByAppendingPathComponent:@"appdelegate.archiver"];
    //添加储存的文件名
    NSData *data = [[NSData alloc]initWithContentsOfFile:appdelegatePath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    _userInfo = [unarchiver decodeObjectForKey:@"userInfo"];
    [unarchiver finishDecoding];
    
    if ([ChannelInfo currentChannel].ID == nil) {
        ChannelInfo *currentChannel = [[ChannelInfo alloc]init];
        currentChannel.name = @"我的私人";
        currentChannel.ID = @"0";
        [ChannelInfo updateCurrentCannel:currentChannel];
    }
    if (_userInfo == nil) {
        _userInfo = [[UserInfo alloc]init];
    }
}

- (void)initChannelsData{
    //初始化数据源Array
    [ChannelInfo updateChannelsTitleArray:@[@"我的兆赫",@"推荐频道",@"上升最快兆赫",@"热门兆赫"]];
    NSMutableArray *channels = [ChannelInfo channels];
    //我的兆赫
    ChannelInfo *myPrivateChannel = [[ChannelInfo alloc]init];
    myPrivateChannel.name = @"我的私人";
    myPrivateChannel.ID = @"0";
    ChannelInfo *myRedheartChannel = [[ChannelInfo alloc]init];
    myRedheartChannel.name = @"我的红心";
    myRedheartChannel.ID = @"-3";
    NSArray *myChannels = @[myPrivateChannel, myRedheartChannel];
    [channels addObject:myChannels];
    //推荐兆赫
    NSArray *recommendChannels = [NSMutableArray array];
    [channels addObject:recommendChannels];
    //上升最快兆赫
    NSMutableArray *upTrendingChannels = [NSMutableArray array];
    [channels addObject:upTrendingChannels];
    //热门兆赫
    NSMutableArray *hotChannels = [NSMutableArray array];
    [channels addObject:hotChannels];
    
}
@end
