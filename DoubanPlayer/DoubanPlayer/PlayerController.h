//
//  PlayerController.h
//  DoubanPlayer
//
//  Created by lkjy on 16/5/7.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"
#import "NetworkManager.h"
#import "ProtocolClass.h"

@interface PlayerController : MPMoviePlayerController

@property(nonatomic,weak) id<DoubanDelegate>songInfoDelegate;//将协议引进来，把协议声明为属性，需要实现这个协议，而不是单纯的引用

@property(nonatomic,strong)DFMPlaylist* playList;//音乐播放列表

+ (instancetype)sharedInstance;//实例

-(instancetype)init;

-(void)startPlay;//开始播放

//播放的一些操作
-(void)pauseSong;//暂停

-(void)restartSong;//重新开始

-(void)likeSong;//喜爱

-(void)dislikesong;//不喜爱

-(void)deleteSong;//删除歌曲

-(void)skipSong;//跳过,进入下一曲
@end
