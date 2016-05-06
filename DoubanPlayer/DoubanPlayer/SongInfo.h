//
//  SongInfo.h
//  DoubanPlayer
//
//  Created by lk on 16/5/5.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongInfo : NSObject
@property(nonatomic,assign)NSInteger index;/**<歌曲下标*/
@property(nonatomic,copy)NSString* title;/**<歌曲名*/
@property(nonatomic,copy)NSString* artist;/**<艺术家*/
@property(nonatomic,copy)NSString* picture;/**<照片*/
@property(nonatomic,copy)NSString* length;/**<歌曲时长*/
@property(nonatomic,copy)NSString* like;/**<喜欢的歌曲*/
@property(nonatomic,copy)NSString* url;/**<歌手*/
@property(nonatomic,copy)NSString* sid;/**<乐队*/

//当前的歌曲
+(instancetype)currentSong;
+(void)setCurrentSong:(SongInfo*)songInfo;

//当前歌曲的位置下标
+(NSInteger)currentSongIndex;
+(void)setCurrentSongIndex:(int)songInfo;
@end
