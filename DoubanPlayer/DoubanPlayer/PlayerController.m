//
//  PlayerController.m
//  DoubanPlayer
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import "PlayerController.h"
#import "SongInfo.h"
@interface PlayerController()

{
    AppDelegate* AppDelegate;
    
    NetworkManager * networkManager;
    
}

@end
@implementation PlayerController
-(instancetype)init
{
    if (self = [super init])
    {
        AppDelegate = [[UIApplication sharedApplication]delegate];
        
        networkManager = [[NetworkManager alloc]init];
    }
    //通知中心监视
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(startPlay) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(initSongInfomation) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    return  self;
    
}
+ (instancetype)sharedInstance
{
    static PlayerController* sharedInstance;
    //在程序运行过程中只需要执行
    static dispatch_once_t onceToken;
    
    
}


@end
