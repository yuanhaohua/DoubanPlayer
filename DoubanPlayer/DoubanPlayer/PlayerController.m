//
//  PlayerController.m
//  DoubanPlayer
//
//  Created by lkjy on 16/5/7.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import "PlayerController.h"
#import "SongInfo.h"
@interface PlayerController(){
    AppDelegate* appDelegate;
    NetworkManager *networkManager;
}
@end

@implementation PlayerController
-(instancetype)init
{
    if (self = [super init])
    {
        //初始化操作
        appDelegate = [[UIApplication sharedApplication]delegate];
        
        networkManager = [[NetworkManager alloc]init];
    }
    //通知中心监视
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startPlay) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initSongInfomation)
                                                 name: MPMoviePlayerLoadStateDidChangeNotification
                                               object:nil];
    return self;
}

+ (instancetype)sharedInstance
{
    static PlayerController *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
//初始化歌曲信息
-(void)initSongInfomation
{
    [self.songInfoDelegate initSongInfomation];
}
//播放的一些设置
-(void)startPlay
{
    
    @try {
        //根据歌曲下标与当前下标的比较，做出相应操作
        
        if ([SongInfo currentSongIndex] >= ((int)[[PlayerController sharedInstance].playList.song count]-1)) {
            [networkManager loadPlaylistwithType:@"p"];
        }
        else{
            [SongInfo setCurrentSongIndex:[SongInfo currentSongIndex] + 1];
            
            [SongInfo setCurrentSong:[[PlayerController sharedInstance].playList.song objectAtIndex:[SongInfo currentSongIndex]]];
            
            [self setContentURL:[NSURL URLWithString:[[SongInfo currentSong] valueForKey:@"url"]]];
            
            [self play];
        }
    }
    @catch (NSException *exception) {
    }
}


#pragma mark - PlayerButtonTask
//点击下一曲事件，按照豆瓣算法，需要重新载入播放列表
-(void)pauseSong{
    [self pause];
}
-(void)restartSong{
    [self play];
}
-(void)likeSong{
    [networkManager loadPlaylistwithType:@"r"];
}
-(void)dislikesong{
    [networkManager loadPlaylistwithType:@"u"];
}
-(void)deleteSong{
    [networkManager loadPlaylistwithType:@"b"];
}
-(void)skipSong{
    [networkManager loadPlaylistwithType:@"s"];
}


@end
