//
//  SongInfo.m
//  DoubanPlayer
//
//  Created by lk on 16/5/6.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import "SongInfo.h"

//两个静态变量
static SongInfo* currentSong;
static int currentSongIndex;

@implementation SongInfo

//dispatch_once 实现单例 代码仅会被调度一次
+(instancetype)currentSong
{
    if (!currentSong)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            currentSong=[[SongInfo alloc]init];
        });
    }
    return currentSong;
}
+(void)setCurrentSong:(SongInfo*)songInfo
{
    currentSong=songInfo;
}


+(NSInteger)currentSongIndex
{
    return currentSongIndex;
}
+(void)setCurrentSongIndex:(int)songInfo
{
    currentSongIndex=songInfo;
}
@end
