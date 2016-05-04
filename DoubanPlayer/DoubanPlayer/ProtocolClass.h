//
//  ProtocolClass.h
//  DoubanPlayer
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol DoubanDelegate <NSObject>//关于Douban的一个协议
@optional //属性为可选的

//登录界面的一些属性
-(void)setCaptchaImageWithURLInString:(NSString *)url;//设置验证码

-(void)loginSuccess;//登录成功

-(void)logoutSuccess;//登录失败

-(void)reloadTableviewData;//播放列表

-(void)initSongInfomation;//初始化歌曲信息

-(void)setUserInfo;//初始化用户信息

-(void)menuButtonClicked:(int)index;//根据下标点击菜单按钮

@end
@interface ProtocolClass : NSObject

@end

